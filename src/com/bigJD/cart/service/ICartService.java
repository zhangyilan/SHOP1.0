package com.bigJD.cart.service;


import com.bigJD.cart.entity.ProductItem;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;

import java.util.List;

public interface ICartService{
    /**
     *  * 添加到购物车
     * @param product 商品信息
     * @param user 用户信息
     * @param number 购买数量
     * @return
     */
    int addToCart(Product product, User user,int number);

    /**
     * 删除购物车
     * @param id 商品项ID
     */
    int detele(Integer id);

    /**
     * 查找我的购物车
     * @param user 用户
     * @return
     */
    List<ProductItem> findMyCart(User user);
}
