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
			// 逐个商品，修改库存
			for (Details details : order.getList()) {
				// 修改details的库存
				goodsMapper.updateCount(details.getGid(), details.getGcount());
				// 取出商品的详细信息
				Goods goods = goodsMapper.selectAllGoods(details.getGid());

				details.setGprice(goods.getGprice());

				oprice += details.getGcount() * goods.getGprice();
			}
		} catch (Exception e) {
			// 库存不足
			e.printStackTrace();

			throw new RuntimeException("购买失败，库存不足！");
		}

		try {
			// 扣钱
			int res = customerMapper.updateMoney(order.getCid(), oprice);
		} catch (Exception e) {
			e.printStackTrace();

			throw new RuntimeException("购买失败，余额不足！");
		}
		// 写入order表
		order.setOprice(oprice);
		orderMapper.add(order);
		// 写入details表
		// 逐个商品，修改库存
		for (Details details : order.getList()) {
			details.setOnum(order.getOnum());

			// 写入数据库
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
		// 需要知道有几条数据
				Integer count = orderMapper.getRows(details);
				
				System.out.println(count);
				//计算有几页
				page.setRows(count);
				page.setWhere(details);
				//查询当前页面有哪些数据
				List<Details> list = orderMapper.selectAll(page);
				page.setList(list);
				return page;
	}

	


}
