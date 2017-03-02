package com.bigJD.others.dao;/**
 * Created by Administrator on 2016/12/16.
 */

import com.bigJD.others.entity.FootPrint;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;

import java.util.List;
public interface IFootPrintDao {
    /**
     * 添加足迹
     * @param footPrint
     * @return
     */
    Integer addFootPrint(FootPrint footPrint);

    /**
     * 得到用户所有足迹s
     * @param user
     * @return
     */
    List<FootPrint> getFootPrint(User user);

    /**
     * 查询足迹，用来判断是否存在
     * @param product
     * @param user
     * @return
     */
    FootPrint queryFootPrint(User product, Product user);

}
