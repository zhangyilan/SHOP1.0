package com.bigJD.others.service.impl;/**
 * Created by Administrator on 2016/12/16.
 */

import com.bigJD.others.dao.IFootPrintDao;
import com.bigJD.others.dao.impl.FootPrintDao;
import com.bigJD.others.entity.FootPrint;
import com.bigJD.others.service.IFootPrintService;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;
import com.bigJD.utils.Constant;

import java.util.List;

public class FootPrintService implements IFootPrintService {
   private IFootPrintDao footPrintDao;

    public void setFootPrintDao(IFootPrintDao footPrintDao) {
        this.footPrintDao = footPrintDao;
    }


    /**
     * 添加足迹
     * @param footPrint
     * @return
     */
    @Override
    public Integer addFootPrint(FootPrint footPrint) {
        if (footPrint!=null){
            footPrintDao.addFootPrint(footPrint);
            return Constant.FOOT_PRINT_ADD_SUCCESS;
        }else {
            return Constant.FOOT_PRINT_ADD_FAIL;
        }
    }

    /**
     * 得到用户所有足迹
     * @param user
     * @return
     */
    @Override
    public List<FootPrint> getFootPrint(User user) {

            return footPrintDao.getFootPrint(user);

    }

    /**
     * 查询足迹，用来判断是否存在s
     * @param product
     * @param user
     * @return
     */
    @Override
    public FootPrint queryFootPrint(User user, Product product) {
        return footPrintDao.queryFootPrint(user,product);

    }


}
