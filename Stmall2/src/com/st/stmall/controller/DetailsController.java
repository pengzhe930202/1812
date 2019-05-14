package com.st.stmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.stmall.pojo.Details;
import com.st.stmall.pojo.Order;
import com.st.stmall.service.IDetailsService;
import com.st.stmall.util.Page;

@Controller
public class DetailsController {
	@Autowired
	IDetailsService iDetailsService;
	
	
}
