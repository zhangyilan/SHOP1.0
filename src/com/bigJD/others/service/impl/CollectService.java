package com.bigJD.others.service.impl;

import com.bigJD.others.dao.ICollectDao;
import com.bigJD.others.entity.Collect;
import com.bigJD.others.service.ICollectService;
import com.bigJD.product.entity.Product;
import com.bigJD.user.entity.User;

import java.util.List;
public class CollectService implements ICollectService {
    private ICollectDao collectDao;

    public void setCollectDao(ICollectDao collectDao) {
        this.collectDao = collectDao;
    }

    /**
     *  添加收藏
     * @param collect
     * @return
     */
    @Override
    public Integer addCollect(Collect collect) {
        Integer state = 1;
        if(collect.getUser() !=null && collect.getProduct()!=null){
           collectDao.addCollect(collect);
            state = 0;
        }else {
            state = 1;
        }
        return state;
    }

    @Override
    public Collect queryCollect(User user, Product product) {
        return collectDao.queryCollect(user,product);
    }

    /**
     * 批量删除
     * @param collectId
     * @return
     */
    @Override
    public Integer babatchDeleteCollect(Integer collectId) {
        Integer state;
        if(collectId !=null){
            collectDao.batchDeleteCollect(collectId);
            state = 0;
        }else {
            state = 1;
        }
        return state;
    }

    /**
     * 查找用户所有收藏
     * @param user
     * @return
     */
    @Override
    public List<Collect> findUserAll(User user) {

      return collectDao.findUserAll(user);
    }
    /**
     * 管理员查找所有用户收藏
     * @return
     */
    @Override
    public List<Collect> findAll() {

        return collectDao.findAll();

    }

    @Override
    public Integer deleteCollect(Integer id) {
        return collectDao.delete(id);
    }


}
