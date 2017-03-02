package com.bigJD.cart.dao.impl;

import com.bigJD.cart.dao.ICartDao;
import com.bigJD.cart.entity.ProductItem;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;
import com.bigJD.utils.Constant;
import org.hibernate.SessionFactory;

import java.util.List;

public class CartDao implements ICartDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void save(ProductItem productItem) {
        sessionFactory.getCurrentSession().save(productItem);
    }

    @Override
    public int delete(Integer id) {
        sessionFactory.getCurrentSession().createQuery("delete from ProductItem c where c.id=?")
                .setParameter(0,id).executeUpdate();
        return Constant.CART_DELETE_SUCCESS;
    }

    @Override
    public ProductItem find(Product product, User user) {
        return (ProductItem) sessionFactory.getCurrentSession().createQuery("from ProductItem pt where pt.user.id=? and pt.product.id=?")
                .setParameter(0,user.getId()).setParameter(1,product.getId()).uniqueResult();
    }

    @Override
    public void updateCartNumberAndTotalPrice(ProductItem productItemInfo, int number,double totalPrice) {
        sessionFactory.getCurrentSession().createQuery("update ProductItem  set number=number+"+number+",totalPrice=totalPrice+"+totalPrice+" where id=?")
                .setParameter(0,productItemInfo.getId()).executeUpdate();
    }

    @Override
    public List<ProductItem> findMyCart(User user) {
        System.out.println(user.getId());
        return sessionFactory.getCurrentSession().createQuery("from ProductItem pt where pt.user.id=? ")
                .setParameter(0,user.getId()).list();
    }
}
