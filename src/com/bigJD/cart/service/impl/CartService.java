package com.bigJD.cart.service.impl;

import com.bigJD.cart.dao.ICartDao;
import com.bigJD.cart.entity.ProductItem;
import com.bigJD.cart.service.ICartService;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;
import com.bigJD.utils.Constant;

import java.util.Date;
import java.util.List;
public class CartService implements ICartService {
    private ICartDao cartDao;

    public void setCartDao(ICartDao cartDao) {
        this.cartDao = cartDao;
    }

    @Override
    public int addToCart(Product product, User user ,int number) {
        ProductItem productItemInfo =cartDao.find(product,user);
        System.out.println("id:"+productItemInfo);
        if(productItemInfo!=null)
            cartDao.updateCartNumberAndTotalPrice(productItemInfo, number, number * productItemInfo.getProduct().getBarginPrice());
        else if (product != null && user != null) {
            ProductItem  productItem = new ProductItem();
            productItem.setUser(user);
            productItem.setProduct(product);
            productItem.setAddTime(new Date());
            productItem.setNumber(number);
            productItem.setTotalPrice(product.getBarginPrice()*number);
            cartDao.save(productItem);
        }else{
            return Constant.CART_ADD_FAIL;
        }
        return Constant.CART_ADD_SUCCESS;
    }

    @Override
    public int detele(Integer id) {
       return cartDao.delete(id);
    }

    @Override
    public List<ProductItem> findMyCart(User user) {
        return cartDao.findMyCart(user);
    }
}
