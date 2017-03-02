package com.bigJD.utils;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StringUtil {
	/**
	 * 获取当前系统时间并转化为字符串(eg:2016-09-21 21:24:09)
	 * @return
	 */
	public static String getStringTime(String format) {
		Date date = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat(format);
		return sdf.format(date);
	}
	/**
	 * 产生订单号
	 * @return
	 */
	public static String createOrderNumber(){
		StringBuffer sb=new StringBuffer();
		sb.append(getStringTime("MMddHHmmssSSSS"));
		for (int i = 0; i < 5; i++) {
			sb.append((int)(Math.random()*10));
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(createOrderNumber());
	}
	/**
	 * 产生唯一字符串
	 * @param str
	 * @return
	 */
	public static String onlyString(){
		StringBuffer sb=new StringBuffer();
		sb.append(getStringTime("MMddHHmmssSSSS"));
		for (int i = 0; i < 3; i++) {
			sb.append((int)(Math.random()*10));
		}
		return sb.toString();
	}
	

}