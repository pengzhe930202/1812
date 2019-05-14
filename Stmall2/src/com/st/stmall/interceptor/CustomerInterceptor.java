package com.st.stmall.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.st.stmall.pojo.Customer;

/**
 * �����û���¼, ������֤
 * 
 * HandlerInterceptor�ӿ� SpringMVC��������
 * 
 */
public class CustomerInterceptor implements HandlerInterceptor {

	@Override
	/**
	 * ����ִ����ʱ����
	 */
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	/**
	 * ������ͼʱ, ���ø÷���
	 */
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	/**
	 * ��Ҫ�����ص�����Contollerִ��֮ǰ, ִ�и÷���
	 * 
	 * ���÷�������falseʱ, ��������, 
	 * ���÷�������trueʱ, �������.
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("�û���¼��֤");
		// �����û���¼
		// �ж��û��Ƿ��Ѿ���¼
		HttpSession session = request.getSession();
		
		Customer customer = (Customer) session.getAttribute("customer");
		
		// �û��Ѿ���¼
		if (customer != null) {
			return true;
		}else {
			//�û�û�е�½
			//��ת����½ҳ�棬�ض��򵽵�½ҳ��
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
		return false;
	}

}
