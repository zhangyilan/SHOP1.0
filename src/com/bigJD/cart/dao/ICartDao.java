package com.bigJD.cart.dao;

import com.bigJD.cart.entity.ProductItem;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;

import java.util.List;
public interface ICartDao {

    void save(ProductItem productItem);

    /**
     * 删除
     * @param id
     */
    int delete(Integer id);

    /**
     * find
     * @param product
     * @param user
     * @return
     */
    ProductItem find(Product product,User user);

    /**
     * 修改产品数量
     * @param productItemInfo
     * @param number
     */
    void updateCartNumberAndTotalPrice(ProductItem productItemInfo, int number,double totalPrice);

    /**
     * 根据用户信息查找用户购物车
     * @param user
     * @return
     */
    List<ProductItem> findMyCart(User user);
}
