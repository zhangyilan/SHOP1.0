package com.bigJD.others.action;

import com.bigJD.others.entity.Collect;
import com.bigJD.others.entity.FootPrint;
import com.bigJD.others.service.ICollectService;
import com.bigJD.others.service.IFootPrintService;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;
import com.bigJD.utils.Constant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.Date;
import java.util.List;
import java.util.Map;
public class CollectAction extends ActionSupport {
    private ICollectService collectService;
    private User user = null;
    private Integer state=1;
    private Product product = null;
    private Collect collect = null;
    private Integer[] id;
    private IFootPrintService footPrintService;




    /**
     * 添加收藏
     * @return
     */
    public String addCollect()throws Exception{
        collect = new Collect();
        collect.setUser(user);
        collect.setProduct(product);
        collect.setAddTime(new Date());
        try {
            if(collectService.queryCollect(user,product)==null) {
                state = collectService.addCollect(collect);
            }else {
                state=1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            state= Constant.CART_ADD_FAIL;
        }
        return "state";
    }

    /**
     * 删除收藏
     * @return
     */
    public String deleteCollect()throws Exception{
        try {

            state =  collectService.deleteCollect(collect.getId());
        } catch (Exception e) {
            state=Constant.COLLECT_DELETE_FAIL;
            e.printStackTrace();
        }
        return "state";
    }

    /**
     * 批量删除
     * @return
     */
    public String batchDeleteCollect()throws Exception{
        try {
            for(Integer collectId : id){
                collectService.babatchDeleteCollect(collectId);
            }
            state=0;
        } catch (Exception e) {
            e.printStackTrace();
            state=Constant.COLLECT_BATCH_DELETE_FAIL;
        }
        return "state";
    }

    /**
     * 查找用户所有收藏
     * @return
     */
    public String findUserAll()throws Exception{
        try {
            user = (User) ActionContext.getContext().getSession().get("userInfo");
            List<Collect> userCollects =  collectService.findUserAll(user);
            Map request = (Map) ActionContext.getContext().get("request");
            request.put("userCollects",userCollects);
            state=Constant.COLLECT_FIND_USER_ALL_SUCCESS;

            //足迹
            List<FootPrint> userFootPrint = footPrintService.getFootPrint(user);
            Map session = ActionContext.getContext().getSession();
            session.put("userFootPrint", userFootPrint);
        } catch (Exception e) {
            e.printStackTrace();
            state=Constant.COLLECT_FIND_USER_ALL_FAIL;
        }
        return "findsuccess";
    }
    /**
     * 管理员查找所有用户收藏
     * @return
     */
    public String findAll()throws Exception{
        try {
            List<Collect> allCollects = collectService.findAll();
            Map request = (Map)ActionContext.getContext().get("request");
            request.put("allCollects",allCollects);
            state=Constant.COLLECT_FIND_ALL_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            state=Constant.COLLECT_FIND_ALL_FAIL;
        }
        return "state";
    }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Collect getCollect() {
        return collect;
    }

    public void setCollect(Collect collect) {
        this.collect = collect;
    }

    public void setCollectService(ICollectService collectService) {
        this.collectService = collectService;
    }

    public Integer[] getId() {
        return id;
    }

    public void setId(Integer[] id) {
        this.id = id;
    }

    public ICollectService getCollectService() {
        return collectService;
    }

    public IFootPrintService getFootPrintService() {
        return footPrintService;
    }

    public void setFootPrintService(IFootPrintService footPrintService) {
        this.footPrintService = footPrintService;
    }
}
