package com.st.stmall.pojo;

import java.util.Date;
import java.util.List;

public class Order {
	
	private String onum;
	private Date odate;
	private Double oprice;
	private Integer cid;
	private String oaddr;
	private String ophone;
	private String oname;
	private String ocode;
	
	//�����µ���Ʒ����
	private List<Details> list;

	public String getOnum() {
		return onum;
	}

	public void setOnum(String onum) {
		this.onum = onum;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public Double getOprice() {
		return oprice;
	}

	public void setOprice(Double oprice) {
		this.oprice = oprice;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getOaddr() {
		return oaddr;
	}

	public void setOaddr(String oaddr) {
		this.oaddr = oaddr;
	}

	public String getOphone() {
		return ophone;
	}

	public void setOphone(String ophone) {
		this.ophone = ophone;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOcode() {
		return ocode;
	}

	public void setOcode(String ocode) {
		this.ocode = ocode;
	}

	public List<Details> getList() {
		return list;
	}

	public void setList(List<Details> list) {
		this.list = list;
	}
	
	
}
