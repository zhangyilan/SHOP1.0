package com.bigJD.user.dao.impl;

import com.bigJD.user.dao.IUserDao;
import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.Admin;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;
import com.bigJD.utils.PageModel;

import org.hibernate.SessionFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDao implements IUserDao{
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public List<User> userNameIsExist(String userName) {
        return sessionFactory.getCurrentSession().createQuery("from User where userName=?")
                .setParameter(0,userName).list();
    }

    @Override
    public List<Admin> adminNameIsExist(String userName) {
        return sessionFactory.getCurrentSession().createQuery("from Admin where loginName=?")
                .setParameter(0,userName).list();
    }

    @Override
    public void userSaveOrUpdate(User user) {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
    }

    @Override
    public User findByUserNamePassword(User user) {
        List<User> users = sessionFactory.getCurrentSession().createQuery("from User where userName = ? and password = ?")
                .setParameter(0, user.getUserName())
                .setParameter(1, user.getPassword())
                .list();
        return users.size() > 0 ? users.get(0) : null;
    }

    @Override
    public void userDelete(User user) {
        sessionFactory.getCurrentSession().createQuery("update User set state = 1 where id = ?")
        .setParameter(0,user.getId()).executeUpdate();
    }

    @Override
    public User getUserById(Integer id) {
        return (User) sessionFactory.getCurrentSession().get(User.class,id);
    }

    @Override
    public Integer adminSaveOrUpdate(Admin admin) {
        sessionFactory.getCurrentSession().saveOrUpdate(admin);
        return 1;
    }

    @Override
    public Admin findByAdminNamePassword(Admin admin) {
        List<Admin> admins= sessionFactory.getCurrentSession().createQuery("from Admin where name = ? and password = ?")
                .setParameter(0, admin.getLoginName())
                .setParameter(1, admin.getPassword())
                .list();
        return admins.size() > 0 ? admins.get(0) : null;
    }

    @Override
    public Integer adminDelete(Admin admin) {
        sessionFactory.getCurrentSession().createQuery("update Admin set state = 1 where id = ?")
                .setParameter(0,admin.getId()).executeUpdate();
        return 1;
    }

    @Override
    public Admin getAdminById(Integer id) {
        return (Admin) sessionFactory.getCurrentSession().get(Admin.class, id);
    }

    @Override
    public List<Address> findUserAllAddress(Integer id) {
        return sessionFactory.getCurrentSession().createQuery("from Address ad where ad.user.id=?")
                .setParameter(0,id).list();
    }

    @Override
    public Address findById(Integer id) {
        return (Address) sessionFactory.getCurrentSession().get(Address.class, id);
    }

    @Override
    public void saveOrUpdateAddress(Address address) {
        sessionFactory.getCurrentSession().saveOrUpdate(address);
    }

    @Override
    public void delete(Address address) {
        sessionFactory.getCurrentSession().createQuery("delete from Address where id = ?")
        .setParameter(0,address.getId()).executeUpdate();
    }

    @Override
    public List<BankCard> findAllAddress(Integer id) {
        return sessionFactory.getCurrentSession().createQuery("from BankCard b where b.user.id=?")
                .setParameter(0,id).list();
    }

    @Override
    public BankCard findBankCardById(Integer id) {
        return (BankCard) sessionFactory.getCurrentSession().get(BankCard.class,id);
    }

    @Override
    public void saveOrUpdateBankCard(BankCard bankCard) {
        sessionFactory.getCurrentSession().saveOrUpdate(bankCard);
    }

    @Override
    public void deleteBankCard(Integer id) {
        sessionFactory.getCurrentSession().createQuery("delete from BankCard where id = ?")
                .setParameter(0, id).executeUpdate();
    }

    @SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> pageFindAllUser(int pageNo, int rows) {
		 Map<String, Object> map = new HashMap<String, Object>();
	        PageModel<User> pm = new PageModel<User>();
	        long count = 0;
	            //全查
	            count = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from User").uniqueResult();
	            pm.setTotalRecords(count);
	            pm.setPageNo(pageNo);
	            pm.setPageSize(rows);
	          
				List<User> list = sessionFactory.getCurrentSession()
	                    .createQuery("from User order by id desc")
	                    .setFirstResult((int) pm.beginLimit())
	                    .setMaxResults((int) pm.getPageSize()).list();
	            map.put("dataList", list);
	            map.put("pageNo", pageNo);
	            map.put("total", count);
	            map.put("totalPage", pm.getTotalPages());
	            return map;
	}


	@Override
	public void save(User user) {
		sessionFactory.getCurrentSession().save(user);		
	}


	@Override
	public boolean checkUserNameIsExist(String userName) {
		long count = (long) sessionFactory.getCurrentSession().createQuery("select count(*) from User u where u.userName=? ").setParameter(0, userName).uniqueResult();
		if(count>0){
			return true;
		}
		return false;
	}


	@Override
	public User findUserById(Integer id) {
		try {
			return (User) sessionFactory.getCurrentSession().get(User.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	@Override
	public void update(User user) {
		StringBuffer hql = new StringBuffer();
		hql.append("update User u set u.realName=?,u.password=?,u.phone=?,u.photoUrl=?,u.sex=?,u.remark=? where u.id=?");
		sessionFactory.getCurrentSession().createQuery(hql.toString())
		.setParameter(0, user.getRealName())
		.setParameter(1, user.getPassword())
		.setParameter(2, user.getPhone())
		.setParameter(3, user.getPhotoUrl())
		.setParameter(4, user.getSex())
		.setParameter(5, user.getRemark())
		.setParameter(6, user.getId())
		.executeUpdate();
		
	}


	@Override
	public void delete(Integer id) {
		sessionFactory.getCurrentSession().createQuery("delete from User where id=?")
		.setParameter(0, id).executeUpdate(); 
	}


	@Override
	public void resetPwd(Integer id, String newPwd) {
		sessionFactory.getCurrentSession().createQuery("update User set password=? where id=?")
		.setParameter(0, newPwd)
		.setParameter(1, id).executeUpdate();
	}


	@Override
	public void adminUpdatePwd(String password, Integer id) {
		sessionFactory.getCurrentSession().createQuery("update Admin set password=? where id=?").setParameter(0, password)
		.setParameter(1, id).executeUpdate();
	}
}
