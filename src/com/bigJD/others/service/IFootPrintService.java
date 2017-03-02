package com.bigJD.others.service;

import com.bigJD.others.entity.FootPrint;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;

import java.util.List;
public interface IFootPrintService {

    /**
     * 添加足迹
     * @param footPrint
     * @return
     */
    Integer addFootPrint(FootPrint footPrint);

    /**
     * 得到用户所有足迹
     * @param user
     * @return
     */
    List<FootPrint> getFootPrint(User user);

    /**
     * 查询足迹，用来判断是否存在s
     * @param user
     * @param product
     * @return
     */
    FootPrint queryFootPrint(User user, Product product);

}
