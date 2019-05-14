package com.st.stmall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.CustomerMapper;
import com.st.stmall.dao.CustomermgrMapper;
import com.st.stmall.dao.DetailsMapper;
import com.st.stmall.dao.GoodsMapper;
import com.st.stmall.dao.OrderMapper;
import com.st.stmall.pojo.Details;
import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Order;
import com.st.stmall.service.IOrderService;
import com.st.stmall.util.Page;

@Service
public class OrderServiceImpl implements IOrderService {
	@Autowired
	GoodsMapper goodsMapper;
	@Autowired
	CustomerMapper customerMapper;
	@Autowired
	OrderMapper orderMapper;
	@Autowired
	DetailsMapper detailsMapper;

	@Override
	public int add(Order order) {

		Double oprice = 0.0;
		try {
			// �����Ʒ���޸Ŀ��
			for (Details details : order.getList()) {
				// �޸�details�Ŀ��
				goodsMapper.updateCount(details.getGid(), details.getGcount());
				// ȡ����Ʒ����ϸ��Ϣ
				Goods goods = goodsMapper.selectAllGoods(details.getGid());

				details.setGprice(goods.getGprice());

				oprice += details.getGcount() * goods.getGprice();
			}
		} catch (Exception e) {
			// ��治��
			e.printStackTrace();

			throw new RuntimeException("����ʧ�ܣ���治�㣡");
		}

		try {
			// ��Ǯ
			int res = customerMapper.updateMoney(order.getCid(), oprice);
		} catch (Exception e) {
			e.printStackTrace();

			throw new RuntimeException("����ʧ�ܣ����㣡");
		}
		// д��order��
		order.setOprice(oprice);
		orderMapper.add(order);
		// д��details��
		// �����Ʒ���޸Ŀ��
		for (Details details : order.getList()) {
			details.setOnum(order.getOnum());

			// д�����ݿ�
			detailsMapper.add(details);
		}
		return 1;
	}

	@Override
	public List<Order> selectByCid(Integer cid) {
		// TODO Auto-generated method stub
		return orderMapper.selectByCid(cid);
	}

	
	@Override
	public List<Order> selectAllOrder() {
		// TODO Auto-generated method stub
		return orderMapper.selectAllOrder();
	}

	@Override
	public Page selectAllDetails(Details details, Page page) {
		// ��Ҫ֪���м�������
				Integer count = orderMapper.getRows(details);
				
				System.out.println(count);
				//�����м�ҳ
				page.setRows(count);
				page.setWhere(details);
				//��ѯ��ǰҳ������Щ����
				List<Details> list = orderMapper.selectAll(page);
				page.setList(list);
				return page;
	}

	


}
