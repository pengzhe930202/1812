package com.st.stmall.util;

import java.security.MessageDigest;

import sun.misc.BASE64Encoder;

public class MD5Util {

	// MD5����
	public static String getMD5(String str) {
		
		String newstr = null;
		try {
			//ȷ�����㷽��
			MessageDigest md5=MessageDigest.getInstance("MD5");
			BASE64Encoder base64en = new BASE64Encoder();
			//���ܺ���ַ���
			newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
		
		} catch (Exception e) {
			// TODO: handle exception
		}

		return newstr; 
	}
	
	public static void main(String[] args) {
		String string = "123123";
		String str2 = getMD5(string);
		/*
		 * 1. �ı�˳��
		 * 		����
		 * 		��żλ����
		 * 2. �ַ��滻
		 * 		1->A
		 * 		2->3
		 * 		
		 * 26*26*10*10
		 */
		
		
		
		
		System.out.println(str2);
		
	}
}
