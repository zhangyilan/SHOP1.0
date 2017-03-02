package com.bigJD.product.service.impl;

import com.bigJD.product.dao.IProductDao;
import com.bigJD.product.entity.Product;
import com.bigJD.product.entity.SecondCategoryProduct;
import com.bigJD.product.entity.ThirdCategoryProduct;
import com.bigJD.product.service.IProductService;
import com.bigJD.utils.PageUtil;

import java.util.List;

public class ProductService implements IProductService{
    private IProductDao productDao;

    public void setProductDao(IProductDao productDao) {
        this.productDao = productDao;
    }

    @Override
    public void add(Product product) {
        productDao.saveOrUpdate(product);
    }

    @Override
    public List<Product> search(String content) {
        return null;
    }



    @Override
    public void delete(List<Integer> ids) {

    }

    @Override
    public void edit(Product product) {

    }

    @Override
    public Product detail(Integer id) {
        return productDao.findById(id);
    }

    @Override
    public List<Product> pageProducts(PageUtil<Product> page) {
        return null;
    }

    @Override
    public List<SecondCategoryProduct> findAllCategoryAndProducts() {
        return productDao.findAllCategory();
    }

    @Override
    public List<ThirdCategoryProduct> thirdCategory(Integer id) {
        return productDao.findThirdCategory(id);
    }

    @Override
    public PageUtil<Product> findPageProducts(PageUtil<Product> pageUtil,Integer id) {
        Long number = productDao.findCount(id);
        pageUtil.setTotalCount((Integer.parseInt( Long.toString(number))));
        pageUtil.setTotalPage(pageUtil.getTotalPage());
        List<Product> data = productDao.findByPage(pageUtil, id);
        pageUtil.setPageData(data);
        return pageUtil;
    }
}
