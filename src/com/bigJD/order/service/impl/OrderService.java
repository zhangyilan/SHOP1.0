package com.bigJD.order.service.impl;

import com.bigJD.order.dao.IOrderDao;
import com.bigJD.order.entity.Order;
import com.bigJD.order.service.IOrderService;
import com.bigJD.product.entity.Product;
import com.bigJD.user.dao.IUserDao;
import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;
import com.bigJD.user.service.IUserService;
import com.bigJD.utils.Constant;
import com.bigJD.utils.StringUtil;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class OrderService implements IOrderService {
    private IOrderDao orderDao;

    public void setOrderDao(IOrderDao orderDao) {
        this.orderDao = orderDao;
    }

    /**
     * 创建订单
     *
     * @param order
     * @return
     */
    public Integer creatOrder(Order order) {
            orderDao.creatOrder(order);
            return Constant.USER_ADD_ORDER_SUCCESS;

    }


    /**
     * 改变订单状态
     *
     * @param id
     * @param state
     * @return
     */
    @Override
    public Integer updateOrderState(Integer id, Integer state) {

        return orderDao.updateOrderState(id, state);
    }

    /**
     * 定单详情
     *
     * @param order
     * @return
     */
    public Order orderDetails(Order order) {
        return orderDao.orderDetails(order);
    }

    /**
     * 订单模糊查询
     *
     * @param keyWord
     * @return
     */
    @Override
    public List<Order> fuzzyQueryOrder(String keyWord) {
        return orderDao.fuzzyQueryOrder(keyWord);
    }

    @Override
    public Address findAddById(int id) {
        return orderDao.findAddById(id);
    }

    @Override
    public List<BankCard> findUserAllCard(Integer id) {
        return orderDao.findUserAllCard(id) ;
    }

    @Override
    public void updateOrderStateByOrderNumber(String orderNumber, Integer state) {
        orderDao.updateOrderStateByOrderNumber(orderNumber,state);
    }

    @Override
    public void updateBankCardMoney(Double countPrice, int id) {
        orderDao.updateBankCardMoney(countPrice,id);
    }

    @Override
    public Map<String, Object> pageFindUserOrderByState(int pageNo, int rows, int orderState, User user) {
        return orderDao.pageFindUserOrderByState(pageNo,rows,orderState,user);
    }

    @Override
    public Map<String,Long> totalUserStateNumber(User user) {
        return orderDao.totalUserStateNumber(user);
    }

    @Override
    public Order findByOderNumber(String orderNumber) {
        return orderDao.findByOderNumber(orderNumber);
    }

    @Override
    public void cancel(Integer id) {
        orderDao.cancel(id);
    }

	@Override
	public Map<String, Object> adminFindAllOrderList(int pageNo, int rows,
			Integer state) {
		return orderDao.adminFindAllOrderList(pageNo,rows,state);
		 
	}

	@Override
	public void delete(Integer id) {
		orderDao.delete(id);		
	}


}
