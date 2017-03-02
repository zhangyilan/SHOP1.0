package com.bigJD.order.action;

import com.bigJD.cart.entity.ProductItem;
import com.bigJD.cart.service.ICartService;
import com.bigJD.order.entity.Order;
import com.bigJD.order.service.IOrderService;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;
import com.bigJD.user.service.IUserService;
import com.bigJD.utils.Constant;
import com.bigJD.utils.PageUtil;
import com.bigJD.utils.StringUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class OrderAction extends ActionSupport {

    private IOrderService orderService;
    private ICartService cartService;
    private Integer state = -1;
    private Product product = null;
    private User user;
    private Order order = null;
    private List<Order> orders = null;
    private Double countPrice = 0.0;
    private List<BankCard> bankCards = null;
    private Map<String, Object> stringObjectMap = null;
    private int rows = 10;//一页显示多少行
    private int pageNo;//第几页
    ///////////////////////////////////管理员开始///////////////////////////////////////////////////
    /**
     * 删除订单
     */
    public String delete(){
    	//物理删除
    	orderService.delete(order.getId());
    	return "state";
    }
    /**
     * 管理员点击发货
     */
    public String adminFahuo(){
    	orderService.updateOrderStateByOrderNumber(order.getOrderNumber(), Constant.ORDER_FAHUO_OK);
    	return adminFindAllOrderList();
    }
    /**
     * 管理员查看订单列表
     * @return
     */
    public String adminFindAllOrderList(){
    	stringObjectMap = orderService.adminFindAllOrderList(pageNo, rows,state);
		return "orderList";
    	
    }
    
    
    
    /////////////////////////////////////////管理员结束////////////////////////////////
    /**
     * 取消订单
     * @return
     */
    public String cancel(){
        if(order!=null){
            orderService.cancel(order.getId());
        }
        return null;
    }
    /**
     * 统计用户订单状态对应的数量
     */
    public void totalUserStateNumber(User user) {
        if (user != null) {
            Map<String, Long> stringLongMap = orderService.totalUserStateNumber(user);
            ActionContext.getContext().getSession().put("stringLongMap", stringLongMap);
        }
    }

    /**
     * 查看我的订单
     *
     * @return
     */
    public String myOrder() {
        User user = (User) ActionContext.getContext().getSession().get("userInfo");
        if (user != null) {
            if (pageNo <= 0) {
                pageNo = 1;
            }
            Map<String, Long> stringLongMap = (Map<String, Long>) ActionContext.getContext().getSession().get("stringLongMap");
            if (stringLongMap == null) {
                totalUserStateNumber(user);
            }
            System.out.println("查看我的订单" + user.getUserName());
            stringObjectMap = orderService.pageFindUserOrderByState(pageNo, rows, state, user);
        }
        return "orderPage";
    }

    /**
     * 支付成功
     *
     * @return
     */
    public String paySuccess() {
        user = (User) ActionContext.getContext().getSession().get("userInfo");
        String bankCardId = ServletActionContext.getRequest().getParameter("id");
        if (user != null) {
            countPrice = (Double) ActionContext.getContext().getSession().get("countPrice");
            //用户重新支付
            if(order!=null){
                System.out.println("来自用户的重新支付....");
                System.out.println("付款的订单号："+order.getOrderNumber());
                orderService.updateOrderStateByOrderNumber(order.getOrderNumber(), Constant.ORDER_PAY);
            }
            List<String> orderNumbers = (List<String>) ActionContext.getContext().getSession().get("orderNumbers");
            if (orderNumbers != null) {
                for (String orderNumber : orderNumbers) {
                    System.out.println("订单号：" + orderNumber);
                    //将订单改为已付款
                    orderService.updateOrderStateByOrderNumber(orderNumber, Constant.ORDER_PAY);
                }
            }
            //修改用户银行卡余额
            charge(user,bankCardId);
        }
        return myOrder();
    }

    /**
     * 扣款
     * @param user
     * @param bankCardId
     */
    public void charge(User user,String bankCardId){
        if (bankCardId != null) {
            orderService.updateBankCardMoney(countPrice, Integer.parseInt(bankCardId));
        }
        //清空已经付款的订单
        ActionContext.getContext().getSession().remove("orderNumbers");
        ActionContext.getContext().getSession().remove("countPrice");
        totalUserStateNumber(user);
    }
    /**
     * 打印支付信息
     *
     * @return
     */
    public String pay() {
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        if (user != null) {
            //判断用户是不是重新付款
            String op = ServletActionContext.getRequest().getParameter("op");
            if (op != null) {
                //用户重新付款
                Order orderInfo = orderService.findByOderNumber(order.getOrderNumber());
                order.setOrderNumber(orderInfo.getOrderNumber());
                countPrice = orderInfo.getNumber()*orderInfo.getProduct().getBarginPrice();
                ActionContext.getContext().getSession().put("countPrice", countPrice);
            }
                bankCards = orderService.findUserAllCard(user.getId());
                //用户存在银行卡
                if (bankCards != null) {
                    System.out.println("用户存在银行卡！");
                    return "pay";
                //查找出用户的银行卡信息
            }


        }
        return null;
    }

    /**
     * 创建订单
     *
     * @return
     */
    public String createOrder() throws Exception {
        System.out.println("创建order..............");
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        if (user != null) {
            String addressIds = ServletActionContext.getRequest().getParameter("addressIds");
            System.out.println(addressIds);
            Address address = orderService.findAddById(Integer.parseInt(addressIds));
            if (address != null) {
                order.setAddress(address.getName());
                order.setConsigneeName(address.getReceipt());
                order.setTell(address.getTell());
                List<ProductItem> productItems = (List<ProductItem>) ActionContext.getContext().getSession().get("productItems");
                if (productItems != null) {
                    List<String> orderNumbers = new ArrayList<String>();
                    for (ProductItem productItem : productItems) {
                        countPrice += productItem.getTotalPrice();
                        order.setProduct(productItem.getProduct());
                        order.setAddTime(new Date());
                        order.setUser(user);
                        order.setNumber(productItem.getNumber());
                        String orderNumber = StringUtil.createOrderNumber();
                        order.setOrderNumber(orderNumber);
                        //添加订单
                        state = orderService.creatOrder(order);
                        //删除已结算的购物车商品
                        cartService.detele(productItem.getId());
                        orderNumbers.add(orderNumber);
                    }
                    //清空session
                    ActionContext.getContext().getSession().remove("productItems");
                    //将结算金额放入session
                    ActionContext.getContext().getSession().put("countPrice", countPrice);
                    //记录已经本次结算的订单
                    ActionContext.getContext().getSession().put("orderNumbers", orderNumbers);
                }

            }
            totalUserStateNumber(user);
        }

        return "countPrice";
    }

    /**
     * 改变订单状态
     *
     * @return
     */
    public String changeOrder() {
        orderService.updateOrderStateByOrderNumber(order.getOrderNumber(), Constant.ORDER_FINISH);
        return myOrder();
    }

    public Map<String, Object> getStringObjectMap() {
        return stringObjectMap;
    }

    public void setStringObjectMap(Map<String, Object> stringObjectMap) {
        this.stringObjectMap = stringObjectMap;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public void setCartService(ICartService cartService) {
        this.cartService = cartService;
    }

    public Double getCountPrice() {
        return countPrice;
    }

    public void setCountPrice(Double countPrice) {
        this.countPrice = countPrice;
    }

    public List<BankCard> getBankCards() {
        return bankCards;
    }

    public void setBankCards(List<BankCard> bankCards) {
        this.bankCards = bankCards;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public void setOrderService(IOrderService orderService) {
        this.orderService = orderService;
    }
}

