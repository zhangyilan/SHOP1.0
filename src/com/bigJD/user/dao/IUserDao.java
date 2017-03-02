package com.bigJD.user.dao;

import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.Admin;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;

import java.util.List;
import java.util.Map;
public interface IUserDao {

    /**
     * 普通用户根据用户名模糊查询
     * @param userName 用户名
     * @return
     */
    List<User> userNameIsExist(String userName);

    /**
     * 管理员用户查询
     * @param userName 用户名
     * @return
     */
    List<Admin> adminNameIsExist(String userName);

    /**
     * 添加/修改普通用户
     * @param user
     * @return
     */
    void userSaveOrUpdate(User user);

    /**
     * 根据用户账号密码查询
     * @param user
     * @return
     */
    User findByUserNamePassword(User user);

    /**
     * 用户假删除
     * @param user
     */
    void userDelete(User user);

    /**
     * 根据用户id查询用户
     * @param id
     * @return
     */
    User getUserById(Integer id);
    /***************************
     * 后台
     *******************************************/

    /**
     * 管理员添加/更新
     * @param admin
     * @return
     */
    Integer adminSaveOrUpdate(Admin admin);

    /**
     * 管理员登录
     * @param admin
     * @return
     */
    Admin findByAdminNamePassword(Admin admin);

    /**
     * 管理员假删除
     * @param admin
     * @return
     */
    Integer adminDelete(Admin admin);

    /**
     * 根据管理员id查询
     * @param id
     * @return
     */
    Admin getAdminById(Integer id);

    /**
     * 查找用户全部地址
     * @param id
     * @return
     */
    List<Address> findUserAllAddress(Integer id);

    /**
     * 根据id查询地址
     * @param id
     * @return
     */
    Address findById(Integer id);
    /**
     * 保存或修改用户地址
     * @param address
     */
    void saveOrUpdateAddress(Address address);

    /**
     * 删除地址
     * @param address
     */
    void delete(Address address);

    /**
     * 全查储蓄卡
     * @param id
     * @return
     */
    List<BankCard> findAllAddress(Integer id);

    /**
     * id查
     * @param id
     * @return
     */
    BankCard findBankCardById(Integer id);

    /**
     * 新增修改
     * @param bankCard
     */
    void saveOrUpdateBankCard(BankCard bankCard);

    /**
     * 删除储蓄卡
     * @param id
     */
    void deleteBankCard(Integer id);
    /**
     * 管理员分页查找所有用户
     * @param pageNo
     * @param rows
     * @return
     */
	Map<String, Object> pageFindAllUser(int pageNo, int rows);
/**
 * 添加用户
 * @param user
 */
	void save(User user);
/**
 * 检查用户名是否存在
 * @param userName
 * @return
 */
boolean checkUserNameIsExist(String userName);

User findUserById(Integer id);

void update(User user);
/**
 * @param id
 */
void delete(Integer id);
/**
 * @param id
 * @param newPwd
 */
void resetPwd(Integer id, String newPwd);
/**
 * 
 * @param password
 * @param id
 */
void adminUpdatePwd(String password, Integer id);
}
