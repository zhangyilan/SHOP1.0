package com.bigJD.others.dao.impl;

import com.bigJD.others.dao.ICollectDao;
import com.bigJD.others.entity.Collect;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;
import org.hibernate.SessionFactory;

import java.util.Date;
import java.util.List;

public class CollectDao implements ICollectDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * 添加收藏
     * @param collect
     * @return
     */
    @Override
    public Integer addCollect(Collect collect) {
      sessionFactory.getCurrentSession().save(collect);
        return 0;
    }
    @Override
    public Collect queryCollect(User user, Product product) {
        return(Collect) sessionFactory.getCurrentSession().createQuery("from Collect c where c.user.id=? and c.product.id=?")
                .setParameter(0,user.getId())
                .setParameter(1,product.getId())
                .uniqueResult();

    }

    /**
     * 删除收藏
     * @param collect
     * @return
     */
    @Override
    public Integer deleteCollect(User user, Product product) {
            sessionFactory.getCurrentSession().createQuery("delete Collect c where c.user.id=? and c.product.id=?")
                                   .setParameter(0,user.getId())
                                   .setParameter(1,product.getId())
                                    .executeUpdate();
        return 0;
    }

    /**
     * 批量删除
     * @param collectId
     * @return
     */
    @Override
    public Integer batchDeleteCollect(Integer collectId) {
        sessionFactory.getCurrentSession().createQuery("delete from Collect where id=?").setParameter(0,collectId).executeUpdate();
        return 0;
    }

    /**
     * 查找用户所有收藏
     * @param user
     * @return
     */
    @Override
    public List<Collect> findUserAll(User user) {

           return sessionFactory.getCurrentSession().createQuery("from Collect c where c.user.id=?").setParameter(0,user.getId()).list();


    }
    /**
     * 管理员查找所有用户收藏
     * @return
     */
    @Override
    public List<Collect> findAll() {

        return sessionFactory.getCurrentSession().createQuery(" from Collect").list();

    }

    @Override
    public Integer delete(Integer id) {
        sessionFactory.getCurrentSession().createQuery("delete from Collect c where c.id=?").setParameter(0,id).executeUpdate();
        return 0;
    }


}
