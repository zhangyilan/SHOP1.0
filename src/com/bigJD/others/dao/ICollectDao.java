package com.bigJD.others.dao;

import com.bigJD.others.entity.Collect;
import com.bigJD.product.entity.Product;
import com.bigJD.user.dao.IUserDao;
import com.bigJD.user.entity.User;
import com.bigJD.utils.PageModel;
import org.hibernate.SessionFactory;

import java.util.List;

public interface ICollectDao {

    /**
     * 添加收藏
     * @param collect
     */
    Integer addCollect(Collect collect);

    /**
     * 查找收藏
     * @param user
     * @param product
     * @return
     */
    public Collect queryCollect(User user, Product product);

    /**
     * 删除收藏
     * @param collect
     * @return
     */
    Integer deleteCollect(User user, Product product);

    /**
     * 批量删除
     * @param collectId
     * @return
     */
    Integer batchDeleteCollect(Integer collectId);

    /**
     * 查找用户所有收藏
     * @param user
     * @return
     */
    List<Collect> findUserAll(User user);

    /**
     * 管理员查找所有用户收藏
     * @return
     */
    List<Collect> findAll();

    /**
     * s删除
     * @param id
     * @return
     */
    Integer delete(Integer id);
}
