package com.bigJD.order.service;

import com.bigJD.order.entity.Order;
import com.bigJD.product.entity.Product;
import com.bigJD.user.dao.IUserDao;
import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;
import com.bigJD.user.service.IUserService;

import java.util.List;
import java.util.Map;

public interface IOrderService {

    /**
     * 创建订单
     * @return
     */
    Integer creatOrder(Order order);

    /**
     * 根据订单id修改订单状态
     * @param id
     * @return
     */
    Integer updateOrderState(Integer id,Integer state);

    /**
     * 订单详情
     * @param order
     * @return
     */
    Order orderDetails(Order order);

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

    void updateBankCardMoney(Double countPrice, int id);

    /**
     * 分页查找
     * @param pageNo 第几页数据
     * @param rows 一页显示多少行
     * @param orderState 订单状态
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
     * 根据订单号查询
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
 * 管理员查看订单列表
 * @param pageNo
 * @param rows
 * @param state
 * @return
 */
	Map<String, Object> adminFindAllOrderList(int pageNo, int rows,
			Integer state);
/**
 * 物理删除订单
 * @param id
 */
void delete(Integer id);
}
