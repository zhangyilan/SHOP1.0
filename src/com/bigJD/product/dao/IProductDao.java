package com.bigJD.product.dao;

import com.bigJD.product.entity.Product;
import com.bigJD.product.entity.SecondCategoryProduct;
import com.bigJD.product.entity.ThirdCategoryProduct;
import com.bigJD.user.entity.User;
import com.bigJD.utils.PageUtil;
import org.hibernate.SessionFactory;

import java.util.List;

public interface IProductDao {
    /**
     * 保存/更新商品
     * @param product
     */
    void saveOrUpdate(Product product);

    /**
     * 根据商品名模糊查询
     * @param content
     * @return
     */
    List<Product> searchByName(String content);
    /**
     * 商品假删除
     * @param id
     */
    void delete(Integer id);
    /**
     * 根据id查询商品详情
     * @param id
     * @return
     */
    Product findById(Integer id);

    /**
     * 商品的总数量
     * @return
     */
    Integer totalCount();

    /**
     * 分页查询
     * @param start 起始位置
     * @param end  结束位置
     * @return
     */
    List<Product> findByPage(Integer start, Integer end);

    /**
     * 查询所有商品分类
     * @return
     */
    List<SecondCategoryProduct> findAllCategory();

    /**
     * 根据二级分类查询三级分类
     * @param id
     * @return
     */
    List<ThirdCategoryProduct> findThirdCategory(Integer id);

    /**
     * 查询某个商品分类的商品数量
     * @param id
     * @return
     */
    Long findCount(Integer id);

    /**
     * 分页查询
     * @param pageUtil
     * @return
     */
    List<Product> findByPage(PageUtil<Product> pageUtil,Integer id);
}
