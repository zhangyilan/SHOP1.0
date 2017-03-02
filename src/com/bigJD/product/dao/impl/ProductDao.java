package com.bigJD.product.dao.impl;

import com.bigJD.product.dao.IProductDao;
import com.bigJD.product.entity.Product;
import com.bigJD.product.entity.SecondCategoryProduct;
import com.bigJD.product.entity.ThirdCategoryProduct;
import com.bigJD.user.dao.IUserDao;
import com.bigJD.user.entity.User;
import com.bigJD.utils.PageUtil;
import org.hibernate.SessionFactory;

import java.util.List;

public class ProductDao implements IProductDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void saveOrUpdate(Product product) {
        sessionFactory.getCurrentSession().saveOrUpdate(product);
    }

    @Override
    public List<Product> searchByName(String content) {
        return null;
    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public Product findById(Integer id) {
        return (Product) sessionFactory.getCurrentSession().get(Product.class,id);
    }

    @Override
    public Integer totalCount() {
        return null;
    }

    @Override
    public List<Product> findByPage(Integer start, Integer end) {
        return null;
    }

    @Override
    public List<SecondCategoryProduct> findAllCategory() {
        return (List<SecondCategoryProduct>) sessionFactory.getCurrentSession().createQuery("from SecondCategoryProduct").list();
    }

    @Override
    public List<ThirdCategoryProduct> findThirdCategory(Integer id) {
        return sessionFactory.getCurrentSession().createQuery("from ThirdCategoryProduct where secondCategoryProduct.id =?")
                .setParameter(0,id).list();
    }

    @Override
    public Long findCount(Integer id) {
        return (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Product where thirdCategoryProduct.secondCategoryProduct.id=?")
                .setParameter(0,id).uniqueResult();
    }

    @Override
    public List<Product> findByPage(PageUtil<Product> pageUtil,Integer id) {
        String sql = "SELECT\t p.* FROM t_product p \n" +
                "LEFT JOIN(SELECT p3.third_category_product_id,p3.second_category_product_id FROM t_third_category_product p3 ) p3 ON p3.third_category_product_id = p.third_category_product_id \n" +
                "LEFT JOIN (SELECT * FROM t_second_category_product p2) p2 ON p2.second_category_product_id = p3.second_category_product_id \n" +
                "WHERE  p2.second_category_product_id="+id;
        List<Product> list = sessionFactory.getCurrentSession().createSQLQuery(sql).addEntity(Product.class)
                .setFirstResult((pageUtil.getCurrentPage() - 1) * pageUtil.getPageCount())
                .setMaxResults(pageUtil.getPageCount())
                .list();
        return list;
    }
}
