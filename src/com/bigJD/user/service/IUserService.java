package com.bigJD.user.service;


import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.Admin;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;

import java.util.List;
import java.util.Map;

public interface IUserService {
    /**
     * 判断用户名是否存在
     * @param state 1 普通用户用户名  2管理员用户名
     * @param userName 用户名
     * @return 0 不存在 1存在
     */
    Integer nameIsExist(int state, String userName);

    /**
     * 用户添加/更新
     * @param user
     * @return
     */
    User userSaveOrUpdate(User user);

    /**
     * 用户登录
     * @param user
     * @return
     */
    User userLogin(User user);

    /**
     * 用户假删除
     * @param user
     * @return
     */
    Integer userDelete(User user);

    //****************************************后台********************************************

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
    Admin adminLogin(Admin admin);

    /**
     * 管理员假删除
     * @param admin
     * @return
     */
    Integer adminDelete(Admin admin);

    /**
     * 查找用户全部收货地址
     * @param id
     * @return
     */
    List<Address> findUserAllAddress(Integer id);

    /**
     * 新增用户地址
     * @param address
     */
    void newAddress(Address address);

    /**
     * 地址修改
     * @param address
     */
    void updateAdderss(Address address);

    /**
     * 地址删除
     * @param address
     */
    void deleteAddress(Address address);

    /**
     * 全查用户的储蓄卡
     * @param id
     * @return
     */
    List<BankCard> findUserBanks(Integer id);

    /**
     * 根据储蓄卡id查询
     * @param id
     * @return
     */
    BankCard findBankCardById(Integer id);

    /**
     * 新增储蓄卡
     * @param bankCard
     */
    void newBankCard(BankCard bankCard);

    /**
     * 充值
     * @param bankCard
     * @param money
     */
    void recharge(BankCard bankCard, Integer money);

    /**
     * 删除储蓄卡
     * @param id
     */
    void deleteBankCard(Integer id);
	/**
	 * 分页查找所有用户
	 * @param pageNo
	 * @param rows
	 * @return
	 */
	Map<String, Object> pageFindAllUser(int pageNo, int rows);
	/**
	 * 保存用户
	 * @param user
	 */
	void save(User user);
	/**
	 * 检查用户名村纯在
	 * @param userName
	 * @return
	 */
	boolean checkUserNameIsExist(String userName);
	/**
	 * 
	 * @param id
	 * @return
	 */
	User findUserById(Integer id);

	void update(User user);
	/**
	 * @param id
	 */
	void delete(Integer id);
/**
 * 密码重置
 * @param id
 * @param string
 */
	void resetPwd(Integer id, String string);
/**
 * 管理员修改自己的密码
 * @param password
 * @param id
 */
void adminUpdatePwd(String password, Integer id);
}
