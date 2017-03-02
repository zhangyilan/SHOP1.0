package com.bigJD.order.dao.impl;


import com.bigJD.order.dao.IOrderDao;
import com.bigJD.order.entity.Order;
import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;
import com.bigJD.utils.Constant;
import com.bigJD.utils.PageModel;

import org.apache.commons.collections.map.HashedMap;
import org.hibernate.SessionFactory;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@SuppressWarnings("unchecked")
public class OrderDao implements IOrderDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * 创建订单
     *
     * @param order
     * @return
     */
    @Override
    public Integer creatOrder(Order order) {
        sessionFactory.getCurrentSession().save(order);
        return Constant.USER_ADD_ORDER_SUCCESS;
    }

    /**
     * 更改订单状态
     *
     * @param id
     * @param state
     * @return
     */
    @Override
    public Integer updateOrderState(Integer id, Integer state) {
        sessionFactory.getCurrentSession().createQuery("update Order c set c.state=?").setParameter(0, state).executeUpdate();
        return 1;//修改成功！
    }

    /**
     * 订单详情
     *
     * @param order
     * @return
     */
    @Override
    public Order orderDetails(Order order) {

        return (Order) sessionFactory.getCurrentSession().get(Order.class, order.getId());
    }

    /**
     * 模糊查询
     *
     * @param keyWord
     * @return
     */
    @Override
    public List<Order> fuzzyQueryOrder(String keyWord) {
        String hql = "from Order as order where order.id like '%" + keyWord + "%'";

        return sessionFactory.getCurrentSession().createQuery(hql).list();
    }

    @Override
    public Address findAddById(int id) {

        return (Address) sessionFactory.getCurrentSession().get(Address.class, id);
    }

    @Override
    public List<BankCard> findUserAllCard(Integer id) {
        return sessionFactory.getCurrentSession().createQuery("from BankCard bk where bk.user.id=?").setParameter(0, id).list();
    }

    @Override
    public void updateOrderStateByOrderNumber(String orderNumber, Integer state) {
        sessionFactory.getCurrentSession().createQuery("update Order c set c.state=?,c.addTime=? where c.orderNumber=?")
                .setParameter(0, state).setParameter(1, new Date()).setParameter(2, orderNumber).executeUpdate();
    }

    @Override
    public void updateBankCardMoney(Double countPrice, int id) {
        sessionFactory.getCurrentSession().createQuery("update BankCard b set b.money=money-" + countPrice + " where b.id=?")
                .setParameter(0, id).executeUpdate();
    }

    @Override
    public Map<String, Object> pageFindUserOrderByState(int pageNo, int rows, int orderState, User user) {
        Map<String, Object> map = new HashMap<String, Object>();
        PageModel<Order> pm = new PageModel<Order>();
        String hql ="";
        long count = 0;
        if(orderState==-1){
            //全查
            hql ="select count(*) from Order o where o.user.id=?";
            count = (Long) sessionFactory.getCurrentSession()
                    .createQuery(hql).setParameter(0, user.getId())
                    .uniqueResult();
            pm.setTotalRecords(count);
            pm.setPageNo(pageNo);
            pm.setPageSize(rows);
            List<Order> list = sessionFactory.getCurrentSession()
                    .createQuery("from Order o where o.user.id=? order by id desc").setParameter(0, user.getId())
                    .setFirstResult((int) pm.beginLimit())
                    .setMaxResults((int) pm.getPageSize()).list();
            map.put("dataList", list);
            map.put("pageNo", pageNo);
            map.put("total", count);
            map.put("totalPage", pm.getTotalPages());
            return map;
        }else{
            hql ="select count(*) from Order o where o.state=? and o.user.id=?";
             count = (Long) sessionFactory.getCurrentSession()
                    .createQuery(hql)
                    .setParameter(0, orderState).setParameter(1, user.getId())
                    .uniqueResult();
            pm.setTotalRecords(count);
            pm.setPageNo(pageNo);
            pm.setPageSize(rows);
            List<Order> list = sessionFactory.getCurrentSession()
                    .createQuery("from Order o where o.state=? and o.user.id=? order by o.addTime desc")
                    .setParameter(0, orderState).setParameter(1, user.getId())
                    .setFirstResult((int) pm.beginLimit())
                    .setMaxResults((int) pm.getPageSize()).list();
            map.put("dataList", list);
            map.put("pageNo", pageNo);
            map.put("total", count);
            map.put("totalPage", pm.getTotalPages());
            return map;
        }
    }

    @Override
    public Map<String, Long> totalUserStateNumber(User user) {
        Map<String, Long> stringLongMap = new HashMap<String, Long>();
        Long noPay = (Long) sessionFactory.getCurrentSession()
                .createQuery("select count(*) from Order o where o.state=? and o.user.id=?")
                .setParameter(0, Constant.ORDER_NOT_PAY)
                .setParameter(1, user.getId()).uniqueResult();

        Long pay = (Long) sessionFactory.getCurrentSession()
                .createQuery("select count(*) from Order o where o.state=? and o.user.id=?")
                .setParameter(0, Constant.ORDER_PAY)
                .setParameter(1, user.getId()).uniqueResult();

        Long fahuo = (Long) sessionFactory.getCurrentSession()
                .createQuery("select count(*) from Order o where o.state=? and o.user.id=?")
                .setParameter(0, Constant.ORDER_FAHUO_OK)
                .setParameter(1, user.getId()).uniqueResult();

        Long finish = (Long) sessionFactory.getCurrentSession()
                .createQuery("select count(*) from Order o where o.state=? and o.user.id=?")
                .setParameter(0, Constant.ORDER_FINISH)
                .setParameter(1, user.getId()).uniqueResult();
        Long all = (Long) sessionFactory.getCurrentSession()
                .createQuery("select count(*) from Order o where o.user.id=?")
                .setParameter(0, user.getId()).uniqueResult();
        stringLongMap.put("noPay", noPay);
        stringLongMap.put("pay", pay);
        stringLongMap.put("fahuo", fahuo);
        stringLongMap.put("finish", finish);
        stringLongMap.put("all", all);
        return stringLongMap;
    }

    @Override
    public Order findByOderNumber(String orderNumber) {
        return (Order) sessionFactory.getCurrentSession().createQuery("from Order o where  o.orderNumber=?").setParameter(0,orderNumber).uniqueResult();
    }

    @Override
    public void cancel(Integer id) {
        sessionFactory.getCurrentSession().createQuery("delete from Order where id=?")
                .setParameter(0,id)
                .executeUpdate();
    }

	@Override
	public Map<String, Object> adminFindAllOrderList(int pageNo, int rows,
			Integer orderState) {
		 Map<String, Object> map = new HashMap<String, Object>();
	        PageModel<Order> pm = new PageModel<Order>();
	        String hql ="";
	        long count = 0;
	        if(orderState==-1){
	            //全查
	            hql ="select count(*) from Order";
	            count = (Long) sessionFactory.getCurrentSession()
	                    .createQuery(hql)
	                    .uniqueResult();
	            pm.setTotalRecords(count);
	            pm.setPageNo(pageNo);
	            pm.setPageSize(rows);
	            List<Order> list = sessionFactory.getCurrentSession()
	                    .createQuery("from Order order by id desc")
	                    .setFirstResult((int) pm.beginLimit())
	                    .setMaxResults((int) pm.getPageSize()).list();
	            map.put("dataList", list);
	            map.put("pageNo", pageNo);
	            map.put("total", count);
	            map.put("totalPage", pm.getTotalPages());
	            return map;
	        }else{
	            hql ="select count(*) from Order o where o.state=?";
	             count = (Long) sessionFactory.getCurrentSession()
	                    .createQuery(hql)
	                    .setParameter(0, orderState)
	                    .uniqueResult();
	            pm.setTotalRecords(count);
	            pm.setPageNo(pageNo);
	            pm.setPageSize(rows);
	          
				List<Order> list = sessionFactory.getCurrentSession()
	                    .createQuery("from Order o where o.state=? order by o.addTime desc")
	                    .setParameter(0, orderState)
	                    .setFirstResult((int) pm.beginLimit())
	                    .setMaxResults((int) pm.getPageSize()).list();
	            map.put("dataList", list);
	            map.put("pageNo", pageNo);
	            map.put("total", count);
	            map.put("totalPage", pm.getTotalPages());
	            return map;
	        }
	}

	@Override
	public void delete(Integer id) {
		sessionFactory.getCurrentSession().createQuery("delete from Order where id=?")
		.setParameter(0, id).executeUpdate();
	}


}
