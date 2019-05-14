package com.st.stmall.service;

import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Manager;
import com.st.stmall.util.Page;

public interface IGoodsService {
	
	int add(Goods goods);


	Page selectAllGoods(Goods goods, Page page);


	int update(Goods goods);


	int delete(Integer gid);


	Goods selectAllGoods(Integer gid);



}
