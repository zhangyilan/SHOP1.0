package com.bigJD.product.service;

import com.bigJD.product.entity.Product;
import com.bigJD.product.entity.SecondCategoryProduct;
import com.bigJD.product.entity.ThirdCategoryProduct;
import com.bigJD.utils.PageUtil;

import java.util.List;

public interface IProductService {
    /**
     * 商品新增
     * @param product
     */
    void add(Product product);

    /**
     * 商品模糊查询
     * @param content
     * @return
     */
    List<Product> search(String content);


    /**
     * 商品批量假删除
     * @param ids
     */
    void delete(List<Integer> ids);

    /**
     * 商品信息修改
     * @param product
     */
    void edit(Product product);

    /**
     * 商品详情
     * @param  id 商品id
     * @return
     */
    Product detail(Integer id);

    /**
     * 分页显示
     * @param page 分页信息
     * @return
     */
    List<Product> pageProducts(PageUtil<Product> page);

    /**
     * 查询全部分类
     */
    List<SecondCategoryProduct> findAllCategoryAndProducts();

    /**
     * 查询所有三级分类
     * @param id
     * @return
     */
    List<ThirdCategoryProduct> thirdCategory(Integer id);

    /**
     * 分页查询商品
     * @param pageUtil
     * @return
     */
    PageUtil<Product> findPageProducts(PageUtil<Product> pageUtil,Integer id);
}
