package com.st.stmall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.stmall.dao.DetailsMapper;
import com.st.stmall.pojo.Details;
import com.st.stmall.service.IDetailsService;
import com.st.stmall.util.Page;

@Service
public class DetailsServiceImpl implements IDetailsService{
	@Autowired
	DetailsMapper detailsMapper;
	
	

}
