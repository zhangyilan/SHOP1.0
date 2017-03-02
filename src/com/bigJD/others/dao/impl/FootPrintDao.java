package com.bigJD.others.dao.impl;/**
 * Created by Administrator on 2016/12/16.
 */

import com.bigJD.others.dao.IFootPrintDao;
import com.bigJD.others.entity.FootPrint;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;
import org.hibernate.SessionFactory;

import java.util.List;
public class FootPrintDao implements IFootPrintDao{
  private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * 添加足迹s
     * @param footPrint
     * @return
     */
    @Override
    public Integer addFootPrint(FootPrint footPrint) {
        sessionFactory.getCurrentSession().save(footPrint);
        return 0;
    }

    /**
     * 得到用户所有的足迹
     * @param user
     * @return
     */
    @Override
    public List<FootPrint> getFootPrint(User user) {

        return  sessionFactory.getCurrentSession().
                createQuery("from FootPrint f where f.user.id=?").
                setParameter(0,user.getId()).list();

    }

    /**
     *查询足迹，用来判断是否存在
     * @param product
     * @param user
     * @return
     */
    @Override
    public FootPrint queryFootPrint(User user, Product product) {
        return (FootPrint) sessionFactory.getCurrentSession().createQuery("from FootPrint f where f.product.id=? and f.user.id=?")
                .setParameter(0,product.getId())
                .setParameter(1,user.getId()).uniqueResult();
    }


}
