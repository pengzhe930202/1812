package com.st.stmall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.GoodsMapper;
import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Manager;
import com.st.stmall.service.IGoodsService;
import com.st.stmall.util.Page;
@Service
public class GoodsServiceImpl implements IGoodsService {
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public int add(Goods goods) {
		// TODO Auto-generated method stub
		
		return goodsMapper.add(goods);
	}

	@Override
	public Page selectAllGoods(Goods goods,Page page) {
		// ��Ҫ֪���м�������
		Integer count = goodsMapper.getRows(goods);
		
		System.out.println(count);
		//�����м�ҳ
		page.setRows(count);
		page.setWhere(goods);
		//��ѯ��ǰҳ������Щ����
		List<Goods> list = goodsMapper.selectAll(page);
		page.setList(list);
		return page;
	}

	@Override
	public int update(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.update(goods);
	}

	@Override
	public int delete(Integer gid) {
		// TODO Auto-generated method stub
		return goodsMapper.delete(gid);
	}

	@Override
	public Goods selectAllGoods(Integer gid) {
		// TODO Auto-generated method stub
		return goodsMapper.selectAllGoods(gid);
	}


}
