package com.st.stmall.dao;

import java.util.List;

import com.st.stmall.pojo.Goods;
import com.st.stmall.pojo.Manager;
import com.st.stmall.util.Page;

public interface GoodsMapper {
	
	int add(Goods goods);

	Integer getRows(Goods goods);

	List<Goods> selectAll(Page page);

	int update(Goods goods);

	int delete(Integer gid);

	Goods selectAllGoods(Integer gid);

	int updateCount(Integer gid,Integer count);

}
