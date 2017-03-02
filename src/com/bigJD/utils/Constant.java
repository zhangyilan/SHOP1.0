package com.bigJD.utils;

public class Constant {
	/**
	 * 用户登录信息
	 */
	public final static String USER_LOGIN_INFO = "userInfo";
	/**
	 * 管理员登录信息
	 */
	public final static String ADMIN_LOGIN_INFO = "adminInfo";
	/**
	 * 单个商品信息
	 */
	public final static String PRODUCT_INFO = "productInfo";
	/**
	 * 购物车添加失败
	 */
	public static final Integer CART_ADD_FAIL = 1;
	/**
	 * 购物车添加成功
	 */
	public static final Integer CART_ADD_SUCCESS = 0;
	/**
	 * 购物车删除失败
	 */
	public static final Integer CART_DELETE_FAIL = 1;
	/**
	 * 购物车删除成功
	 */
	public static final Integer CART_DELETE_SUCCESS = 0;
	/**
	 * 用户没有登录或其他异常添加订单失败
	 */
	public static final Integer USER_ADD_ORDER_FAIL = 1;
	/**
	 * 用户创建订单成功
	 */
	public static final Integer USER_ADD_ORDER_SUCCESS = 0;
	/**
	 * 未付款状态
	 */
	public static final Integer ORDER_NOT_PAY= 0;
	/**
	 * 已付款待发货状态
	 */
	public static final Integer ORDER_PAY= 1;
	/**
	 * 已发货待收货状态
	 */
	public static final Integer ORDER_FAHUO_OK= 2;
	/**
	 *已完成
	 */
	public static final Integer ORDER_FINISH=3 ;
	/**
	 * 添加收藏成功
	 */
	public static final Integer COLLECT_ADD_SUCCESS=0;

	/**************收藏模块**********/
	/**
	 * 添加收藏失败
	 */
	public static final Integer COLLECT_ADD_FAIL=1;
	/**
	 * 删除收藏成功
	 */
	public static final Integer COLLECT_DELETE_SUCCESS=0;
	/**
	 * 删除收藏失败
	 */
	public static final Integer COLLECT_DELETE_FAIL=1;
	/**
	 * 批量删除成功
	 */
	public static final Integer COLLECT_BATCH_DELETE_SUCCESS=0;
	/**
	 * 批量删除失败
	 */
	public static final Integer COLLECT_BATCH_DELETE_FAIL=1;
	/**
	 * 查找用户所有收藏成功
	 */
	public static final Integer COLLECT_FIND_USER_ALL_SUCCESS=0;
	/**
	 * 查找用户所有收藏失败
	 */
	public static final Integer COLLECT_FIND_USER_ALL_FAIL=1;
	/**
	 * 管理员查找所有用户收藏成功
	 */
	public static final Integer COLLECT_FIND_ALL_SUCCESS=0;
	/**
	 * 管理员查找所有用户收藏失败
	 */
	public static final Integer COLLECT_FIND_ALL_FAIL=1;

	/****************足迹模块*************/
	/**
	 * 足迹添加成功
	 */
	public static final Integer FOOT_PRINT_ADD_SUCCESS= 0;

	/**
	 * 足迹添加失败
	 */
	public static final Integer FOOT_PRINT_ADD_FAIL= 1;
	/**
	 * 得到用户足迹成功
	 */
	public static final Integer FOOT_PRINT_GET_SUCCESS= 0;

	/**
	 * 得到用户足迹失败
	 */
	public static final Integer FOOT_PRINT_GET_FAIL= 1;


	/*************关键字模块****************/

	/**
	 * 关键字添加成功
	 */
	public static final Integer KEY_WORD_SAVE_SUCCESS= 0;
	/**
	 * 关键字添加失败
	 */
	public static final Integer KEY_WORD_SAVE_FAIL= 1;
	/**
	 * 关键字更新成功
	 */
	public static final Integer KEY_WORD_UPDATA_SUCCESS= 0;
	/**
	 * 关键字更新失败
	 */
	public static final Integer KEY_WORD_UPDATA_FAIL= 1;

}
