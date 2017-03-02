package com.bigJD.user.service.impl;

import com.bigJD.user.dao.IUserDao;
import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.Admin;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;
import com.bigJD.user.service.IUserService;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class UserService implements IUserService{
    private IUserDao userDao;

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public Integer nameIsExist(int state, String userName) {
        //state = 1 ; 查询普通用户的用户名是否存在
        if(state == 1){
            List<User> users = userDao.userNameIsExist(userName);
            state = users.size() > 0 ? 1 : 0;
        }else{ //查询管理员用户名是否存在
            List<Admin> admins = userDao.adminNameIsExist(userName);
            state = admins.size() > 0 ? 1 : 0;
        }
        return state;
    }

    @Override
    public User userSaveOrUpdate(User user) {
        //更新
        User data = null;
        if(user.getId() != null){
            data = userDao.getUserById(user.getId());
            data.setRealName(user.getRealName());
            data.setPassword(user.getPassword());
            data.setPhotoUrl(user.getPhotoUrl());
            data.setSex(user.getSex());
            data.setPhone(user.getPhone());
            user = data;
        }else {
            //判断用户名是否存在
            List<User> users = userDao.userNameIsExist(user.getUserName());
            if(users.size() > 0){
                return null;
            }
            user.setRegisterTime(new Date());
        }
         userDao.userSaveOrUpdate(user);
        return data;
    }

    @Override
    public User userLogin(User user) {
        return userDao.findByUserNamePassword(user);
    }

    @Override
    public Integer userDelete(User user) {
        userDao.userDelete(user);
        return 1;
    }

    @Override
    public Integer adminSaveOrUpdate(Admin admin) {
        //更新
        if(admin.getId() != null){
            Admin data = userDao.getAdminById(admin.getId());
            data.setPassword(admin.getPassword());
            admin = data;
        }else {
            //判断用户名是否存在
            List<Admin> admins = userDao.adminNameIsExist(admin.getLoginName());
            if(admins.size() > 0){
                return 0;
            }
        }
        userDao.adminSaveOrUpdate(admin);
        return 1;
    }

    @Override
    public Admin adminLogin(Admin admin) {
        return userDao.findByAdminNamePassword(admin);
    }

    @Override
    public Integer adminDelete(Admin admin) {
        userDao.adminDelete(admin);
        return 1;
    }

    @Override
    public List<Address> findUserAllAddress(Integer id) {
        return userDao.findUserAllAddress(id);
    }

    @Override
    public void newAddress(Address address) {
        userDao.saveOrUpdateAddress(address);
    }

    @Override
    public void updateAdderss(Address address) {
        Address add = userDao.findById(address.getId());
        add.setName(address.getName());
        add.setReceipt(address.getReceipt());
        add.setTell(address.getTell());
        userDao.saveOrUpdateAddress(add);
    }

    @Override
    public void deleteAddress(Address address) {
        userDao.delete(address);
    }

    @Override
    public List<BankCard> findUserBanks(Integer id) {
        return userDao.findAllAddress(id);
    }

    @Override
    public BankCard findBankCardById(Integer id) {
        return userDao.findBankCardById(id);
    }

    @Override
    public void newBankCard(BankCard bankCard) {
        userDao.saveOrUpdateBankCard(bankCard);

    }

    @Override
    public void recharge(BankCard bankCard, Integer money) {
        bankCard = userDao.findBankCardById(bankCard.getId());
        int mo = bankCard.getMoney();
        mo+=money;
        bankCard.setMoney(mo);
        userDao.saveOrUpdateBankCard(bankCard);
    }

    @Override
    public void deleteBankCard(Integer id) {
        userDao.deleteBankCard(id);
    }

	@Override
	public Map<String, Object> pageFindAllUser(int pageNo, int rows) {
		if(pageNo == 0){
			pageNo = 1;
		}
		return userDao.pageFindAllUser(pageNo,rows);
	}

	@Override
	public void save(User user) {
		userDao.save(user);;
	}

	@Override
	public boolean checkUserNameIsExist(String userName) {
		return userDao.checkUserNameIsExist(userName);
	}

	@Override
	public User findUserById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(id);
	}

	@Override
	public void update(User user) {
		 userDao.update(user);
		
	}

	@Override
	public void delete(Integer id) {
		userDao.delete(id);
	}

	@Override
	public void resetPwd(Integer id, String newPwd) {
		userDao.resetPwd(id, newPwd);
	}

	@Override
	public void adminUpdatePwd(String password, Integer id) {
		userDao.adminUpdatePwd(password,id);
		
	}

}
