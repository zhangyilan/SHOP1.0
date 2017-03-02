package com.bigJD.others.action;/**
 * Created by Administrator on 2016/12/16.
 */

import com.bigJD.others.entity.FootPrint;
import com.bigJD.others.service.IFootPrintService;
import com.bigJD.others.service.impl.FootPrintService;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;
import com.bigJD.utils.Constant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class FootPrintAction extends ActionSupport {
    private IFootPrintService footPrintService;

    private User user = null;
    private Product product = null;
    private Integer state = null;
    private FootPrint footPrint = null;

    /**
     * 添加足迹
     *
     * @return
     */
    public String addFootPrint() throws Exception{
        try {
            if (footPrintService.queryFootPrint(user, product) == null) {        //判断用户足迹是否已经存在
                state = footPrintService.addFootPrint(footPrint);
            } else {
                state = Constant.FOOT_PRINT_ADD_FAIL;
            }
        } catch (Exception e) {
            e.printStackTrace();
            state = Constant.FOOT_PRINT_ADD_FAIL;
        }
        return "state";
    }

    /**
     * 得到用户所有足迹
     *
     * @return
     */
    public String getFootPrint()throws Exception {
        try {
                List<FootPrint> userFootPrint = footPrintService.getFootPrint(user);
                System.out.println(userFootPrint);
                Map session = ActionContext.getContext().getSession();
                session.put("userFootPrint", userFootPrint);
            state = Constant.FOOT_PRINT_GET_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            state = Constant.FOOT_PRINT_GET_FAIL;
        }
        return "state";
    }


    public IFootPrintService getFootPrintService() {
        return footPrintService;
    }

    public void setFootPrintService(IFootPrintService footPrintService) {
        this.footPrintService = footPrintService;
    }

    public void setFootPrint(FootPrint footPrint) {
        this.footPrint = footPrint;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }


}
