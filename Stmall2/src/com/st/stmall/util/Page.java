package com.st.stmall.util;

import java.util.List;

/**
 * ������ҳ��ѯ
 * @author mi
 *
 */
public class Page {
	
	// 1. ÿҳ��ʾ�ļ�¼��
	private Integer pagerows = 4;
	
	// 2. ��ǰҳ
	private Integer curpage; 
	
	// 3. ��ҳ��
	private Integer pagecount;
	
	// 4. ��ѯ�������еļ�¼�ж�����
	private Integer rows;
	
	// 5. ��ѯ�������ݼ���
	private List list;
	
	// 6. ��ѯ���
	private Integer start;
	
	//7 ��ѯ����
	private Object where;
	

	public Integer getPagerows() {
		return pagerows;
	}

	public void setPagerows(Integer pagerows) {
		this.pagerows = pagerows;
		this.start = (curpage-1) * this.pagerows;
	}

	public Integer getCurpage() {
		return curpage;
	}

	public void setCurpage(Integer curpage) {
		this.curpage = curpage;
		
		// �����ѯ��� 
		/*
		 * ��һҳ��, 0
		 * �ڶ�ҳ��, 10
		 * ����ҳ��, 20
		 */
		this.start = (curpage-1) * this.pagerows;
	}

	public Integer getPagecount() {
		return pagecount;
	}

	public void setPagecount(Integer pagecount) {
		this.pagecount = pagecount;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
		//����ҳ����
		/**
		 * 0 => 0
		 * 1 => 1
		 * 2 => 1
		 * 3 => 2
		 * 4 => 2
		 * pagerows
		 */
		this.pagecount = (this.rows+this.pagerows-1) / this.pagerows;
	}

	public List<Object> getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Object getWhere() {
		return where;
	}

	public void setWhere(Object where) {
		this.where = where;
	}
	
}
