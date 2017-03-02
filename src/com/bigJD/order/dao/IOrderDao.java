package com.bigJD.order.dao;


import com.bigJD.order.entity.Order;
import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;

import java.util.List;
import java.util.Map;
public interface IOrderDao{
    /**
     * 创建订单
     * @return
     */
      Integer creatOrder(Order order);

    /**
     * 改变订单状态
     * @param id
     * @return
     */
    Integer updateOrderState(Integer id,Integer state);

    /**
     * 订单详情
     * @param orderId
     * @return
     */
    Order orderDetails(Order orderId);

    /**
     * 订单模糊查询
     * @param keyWord
     * @return
     */
    List<Order> fuzzyQueryOrder(String keyWord);

    /**
     * 查询订单要使用的收货地址
     * @param id
     * @return
     */
    Address findAddById(int id);

    List<BankCard> findUserAllCard(Integer id);

    /**
     * 修改订单状态
     * @param orderNumber
     */
    void updateOrderStateByOrderNumber(String orderNumber,Integer state);

    /**
     * 扣款
     * @param countPrice
     * @param id
     */
    void updateBankCardMoney(Double countPrice, int id);
    /**
     * 分页查找订单
     * @param pageNo
     * @param rows
     * @param orderState
     * @return
     */
    Map<String,Object> pageFindUserOrderByState(int pageNo, int rows, int orderState,User user);
    /**
     * 统计用户订单状态的数量
     * @param user
     * @return
     */
    Map<String,Long> totalUserStateNumber(User user);

    /**
     *
     * @param orderNumber
     * @return
     */
    Order findByOderNumber(String orderNumber);

    /**
     *
     * @param id
     */
    void cancel(Integer id);
/**
 * 
 * 管理员查看订单列表
 * @param pageNo
 * @param rows
 * @param state
 * @return
 */
	Map<String, Object> adminFindAllOrderList(int pageNo, int rows,
			Integer state);

void delete(Integer id);
}
