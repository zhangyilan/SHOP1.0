package com.bigJD.cart.action;

import com.bigJD.cart.entity.ProductItem;
import com.bigJD.cart.service.ICartService;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.User;
import com.bigJD.user.service.IUserService;
import com.bigJD.utils.Constant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.List;

/**
 * 购物车模块
 */
public class CartAction extends ActionSupport {
    private ICartService cartService;
    private IUserService userService;
    private Product product = null;
    private User user = null;
    private int state = 1;
    private Integer number = 1;
    private ProductItem productItem = null;
    private List<ProductItem> productItems = null;

    /**
     *结算购物车
     * @return
     */
    public String balance(){
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        if (user!=null){
            productItems = cartService.findMyCart(user);
            ActionContext.getContext().getSession().put("productItems",productItems);
            List<Address> addressList = userService.findUserAllAddress(user.getId());
            ActionContext.getContext().getSession().put("addressList",addressList);
        }
        return "balance";
    }
    /**
     * 查找我的购物车
     * @return
     */
    public String findMyCart(){
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
       if (user!=null){
            productItems = cartService.findMyCart(user);
       }
        return "myCart";
    }
    /**
     * 添加到购物车
     *
     * @return
     */
    public String add() throws Exception {
        state = Constant.CART_ADD_FAIL;
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        state = cartService.addToCart(product, user, number);
        return "state";
    }

    /**
     * 删除购物车中商品
     * @return
     * @throws Exception
     */
    public String deleteProductItem() throws Exception {
        state = Constant.CART_DELETE_FAIL;
        if (productItem != null) {
            state = cartService.detele(productItem.getId());
        }
        return "state";
    }

    /**
     * 批量删除购物车中商品
     * @return
     */
    public String deleteAll(){
        String ids = ServletActionContext.getRequest().getParameter("ids");
        String[] idsArr = ids.split(",");
        for(String id:idsArr){
            if(!id.equals("")){
                state = cartService.detele(Integer.parseInt(id));
            }
        }
        return "state";
    }
    /**
     * get and set....。。
     *
     * @return
     */
    public ProductItem getProductItem() {
        return productItem;
    }

    public void setProductItem(ProductItem productItem) {
        this.productItem = productItem;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public List<ProductItem> getProductItems() {
        return productItems;
    }

    public void setProductItems(List<ProductItem> productItems) {
        this.productItems = productItems;
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    //get and set....
    public void setCartService(ICartService cartService) {
        this.cartService = cartService;
    }
}
