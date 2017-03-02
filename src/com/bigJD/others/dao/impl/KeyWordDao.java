package com.bigJD.others.dao.impl;/**
 * Created by Administrator on 2016/12/16.
 */

import com.bigJD.others.dao.IKeyWordDao;
import com.bigJD.others.entity.KeyWord;
import com.bigJD.product.entity.Product;
import org.hibernate.SessionFactory;

import java.util.List;

public class KeyWordDao implements IKeyWordDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * 保存关键字
     * @param keyWord
     * @return
     */
    @Override
    public Integer saveKeyWord(KeyWord keyWord) {
        sessionFactory.getCurrentSession().save(keyWord);
        return 0;
    }

    /**
     * 查询关键字是否存在s
     * @param keyWord
     * @return
     */
    @Override
    public KeyWord queryKeyWord(KeyWord keyWord) {

       return (KeyWord) sessionFactory.getCurrentSession().createQuery("from KeyWord k where k.name=?")
                .setParameter(0,keyWord.getName()).uniqueResult();

    }


    /**
     * 更新关键字（点击量）
     * @param keyWord
     * @return
     */
    @Override
    public Integer updataKeyWord(KeyWord keyWord) {
        sessionFactory.getCurrentSession().update(keyWord);
        return 0;

    }

    /**
     * 按照关键字名查找
     * @param name
     * @return
     */
    @Override
    public KeyWord queryKeyWordByName(String name) {

        return (KeyWord) sessionFactory.getCurrentSession().createQuery("from KeyWord k where k.name=?")
                .setParameter(0,name).uniqueResult();

    }

    /**
     * 模糊查询关键字
     * @param name
     * @return
     */
    @Override
    public List<Product> fuzzyQuery(String name) {
        String hql = "select id,name from Product as key where key.name like '%"+name+"%'";
        return  sessionFactory.getCurrentSession().createQuery(hql).list();

    }

    @Override
    public List<Product> keywordFindProducts(String name) {
        String hql = "from Product as p where p.name like '%"+name+"%'";
        return  sessionFactory.getCurrentSession().createQuery(hql).list();
    }
}
