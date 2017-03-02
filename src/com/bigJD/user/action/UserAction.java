package com.bigJD.user.action;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.struts2.ServletActionContext;

import com.bigJD.user.entity.Address;
import com.bigJD.user.entity.Admin;
import com.bigJD.user.entity.BankCard;
import com.bigJD.user.entity.User;
import com.bigJD.user.service.IUserService;
import com.bigJD.utils.Constant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
    private IUserService userService;
    private User user;
    private List<User> users;
    private Integer state;
    private String name;
    private Admin admin;
    private List<Admin> admins;
    private Address address;
    private List<BankCard> bankCards;
    private BankCard bankCard;
    private Integer rechangeMoney;
    private String msg;//提示信息
    private File userPhoto;
    private String userPhotoFileName;
    private String userPhotoContentType;
    //    **************************************管理员开始*************************************************
    private Map<String, Object> stringObjectMap = null;
    private int rows = 10;//一页显示多少行
    private int pageNo;//第几页
    /**
     * 管理员修改自己的密码
     * @return
     */
    public String adminUpdatePwd(){
    		Admin adminInfo = (Admin) ActionContext.getContext().getSession().get("adminInfo");
        	if(adminInfo==null||admin==null){
        		return "adminLogin";//登陆 超时跳转至登陆页面
        	}else{
        		userService.adminUpdatePwd(admin.getPassword(),adminInfo.getId());
        		return adminLogout();
        	}
    }
    /**
     * 管理员重置用户的密码
     * @return
     */
    public String AdminResetUserPwd(){
    	if(user!=null){
    		userService.resetPwd(user.getId(),"123456");//新密码为123456
    	}
    	return "state";
    }
    /**
     * 管理员删除用户资料
     */
    public String deleteUser(){
    	//物理删除
    	try {
    		userService.delete(user.getId());
		} catch (Exception e) {
			e.printStackTrace();
			state = 1;//删除失败
		}
    	return "state";
    }
    /**
     * 管理员提交修改
     */
    public String adminUpdateUser(){
    try {
    	if(user!=null){
    		if(userPhotoFileName!=null){
				System.out.println("正在保存头像。");
				 String newPicName = UUID.randomUUID().toString().replace("-","").concat(".").concat(userPhotoContentType.split("/")[1]);
 	            String path = ServletActionContext.getServletContext()
 	                    .getRealPath("/upload/user");
 	            File destFile = new File(path,newPicName);
 	            userPhoto.renameTo(destFile);
 	            user.setPhotoUrl(newPicName);
			}
    		userService.update(user);
    		msg="修改成功！";
    	}else{
    		msg="修改失败！";
    	}
	} catch (Exception e) {
		e.printStackTrace();
	}
    	return "updateUser";
    }
    /**
     * 管理员修改用户信息
     */
    public String findUserById(){
    	User userInfo = userService.findUserById(user.getId());
    	user = userInfo;
    	return "updateUser";
    }
    /**
     * 管理员添加用户
     */
    public String adminAddUser(){
    	if(user!=null){
    		boolean isExist = userService.checkUserNameIsExist(user.getUserName());
    		if(!isExist){
    			if(userPhotoFileName!=null){
    				System.out.println("正在保存头像。");
    				 String newPicName = UUID.randomUUID().toString().replace("-","").concat(".").concat(userPhotoContentType.split("/")[1]);
     	            String path = ServletActionContext.getServletContext()
     	                    .getRealPath("/upload/user");
     	            File destFile = new File(path,newPicName);
     	            userPhoto.renameTo(destFile);
     	            user.setPhotoUrl(newPicName);
    			}
    	            user.setRegisterTime(new Date());
    	            userService.save(user);
    	            msg = "添加成功！";
    		}else{
    			 msg = "此用户名已经被使用！";
    		}
          
           
    	}else{
    		 msg = "表单填写不完整！";
    	}
    	 return "addUser";
    }
    /**
     * 分页查看所有用户
     */
    public String pageFindAllUser(){
    	stringObjectMap = userService.pageFindAllUser(pageNo, rows);
    	return "userList";
    }
    /**
     * 管理员登陆
     */
    public String adminLogin(){
    	if(admin!=null){
    		Admin adminInfo = userService.adminLogin(admin);
    		if(adminInfo!=null){
    			ActionContext.getContext().getSession().put("adminInfo", adminInfo);
    			return "adminIndex";
    		}else{
    			msg = "用户名或密码错误！";
    			return "adminLogin";
    		}
    		
    	}else{
    		msg = "请输入用户名或密码！";
    		return "adminLogin";
    	}
    }
    /**
     * 管理员退出
     */
    public String adminLogout(){
    	ActionContext.getContext().getSession().clear();
    	return "adminLogin";
    }
    //    **************************************管理员结束*************************************************
    
    
    
    
    //    **************************************普通用户*************************************************

    /**
     * 判断用户名是否存在
     * @return
     */
    public String nameIsExist(){
        state = userService.nameIsExist(1,name);
        return "state";
    }
    /**
     * 用户注册
     * @return
     */
    public String userRegister() {
        user = userService.userSaveOrUpdate(user);
        if (user == null) {
            state = 1;
        }else{
            state = 0;
        }
        return "state";
    }

    /**
     * 用户登录
     * @return
     */
    public String userLogin() {
        User user = userService.userLogin(this.user);
        if (user != null) {
            ActionContext.getContext().getSession().put(Constant.USER_LOGIN_INFO,user);//userInfo
            state = 1;
        }else{
            state = 0;
        }
        return "state";
    }

    /**
     * 用户注销
     * @return
     */
    public String userLogout() {
        ActionContext.getContext().getSession().remove(Constant.USER_LOGIN_INFO);
        return "index";
    }
    /**
     * 用户修改
     * @return
     */
    public String userUpdate() {
        User userInfo = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        user.setPassword(userInfo.getPassword());
        user.setPhotoUrl(userInfo.getPhotoUrl());
        user = userService.userSaveOrUpdate(user);
        ActionContext.getContext().getSession().put(Constant.USER_LOGIN_INFO, user);
        return "user_update";
    }

    /**
     * 密码修改
     * @return
     */
    public String userUpdatePassword() {
        User userInfo = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        userInfo.setPassword(user.getPassword());
        userService.userSaveOrUpdate(userInfo);
//        ActionContext.getContext().getSession().remove(Constant.USER_LOGIN_INFO);
        return "login";
    }
    /**
     * 用户头像修改
     * @return
     */
    public String userUpdatePhoto() {
        user = (User) ActionContext.getContext().getSession().get("userInfo");
        String newPicName = UUID.randomUUID().toString().replace("-","").concat(".").concat(userPhotoContentType.split("/")[1]);
        String path = ServletActionContext.getServletContext()
                .getRealPath("/upload/user");
        System.out.println(path);
        File destFile = new File(path,newPicName);
        userPhoto.renameTo(destFile);
        user.setPhotoUrl(newPicName);
        user = userService.userSaveOrUpdate(user);
        ActionContext.getContext().getSession().put(Constant.USER_LOGIN_INFO, user);
        return "user_update";
    }

    /**
     * 查询用户所有收货地址
     * @return
     */
    public String findAllAddress() {
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        List<Address> addresss = userService.findUserAllAddress(user.getId());
        ActionContext.getContext().getSession().put("addresss", addresss);
        return "userAddress";
    }

    /**
     * 新增地址
     * @return
     */
    public String newUserAddress() {
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        address.setUser(user);
        address.setAddTime(new Date());
        userService.newAddress(address);
        List<Address> addresss = userService.findUserAllAddress(user.getId());
        ActionContext.getContext().getSession().put("addresss", addresss);
        return "userAddress";
    }

    /**
     * 用户地址修改
     * @return
     */
    public String updateUserAddress() {
        userService.updateAdderss(address);
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        List<Address> addresss = userService.findUserAllAddress(user.getId());
        ActionContext.getContext().getSession().put("addresss", addresss);
        return "userAddress";
    }
    /**
     * 用户地址删除
     * @return
     */
    public String deleteUserAddress() {
        userService.deleteAddress(address);
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        List<Address> addresss = userService.findUserAllAddress(user.getId());
        ActionContext.getContext().getSession().put("addresss", addresss);
        return "userAddress";
    }

    /**
     * 用户储蓄卡查询
     * @return
     */
    public String userBank() {
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        bankCards = userService.findUserBanks(user.getId());
        ActionContext.getContext().getSession().put("bankCards", bankCards);
        return "userBank";
    }

    /**
     * 银行卡新增
     * @return
     */
    public String newUserBankCard() {
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);
        bankCard.setUser(user);
        userService.newBankCard(bankCard);
        bankCards = userService.findUserBanks(user.getId());
        ActionContext.getContext().getSession().put("bankCards", bankCards);
        return "userBank";
    }

    /**
     * 银行卡删除
     * @return
     */
    public String deleteUserBankCard() {
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);

        userService.deleteBankCard(bankCard.getId());

        bankCards = userService.findUserBanks(user.getId());
        ActionContext.getContext().getSession().put("bankCards", bankCards);
        return "userBank";
    }

    /**
     * 储蓄卡充值
     * @return
     */
    public String rechargeUserBankCard() {
        user = (User) ActionContext.getContext().getSession().get(Constant.USER_LOGIN_INFO);

        userService.recharge(bankCard,rechangeMoney);

        bankCards = userService.findUserBanks(user.getId());
        ActionContext.getContext().getSession().put("bankCards", bankCards);
        return "userBank";
    }
    /**
     * 用户假删除
     * @return
     */
    public String userDelete() {
        state = userService.userDelete(user);
        return "state";
    }

    //    **************************************管理员*************************************************

    /**
     * 注册
     * @return
     */
    public String adminRegister() {
        state = userService.adminSaveOrUpdate(admin);
        return "state";
    }
    /**
     * 管理员头像修改--------
     * @return
     */
    public String adminUpdatePhoto() {

        return "state";
    }
    /**
     * 登录
     * @return
     */
  /*  public String adminLogin() {
        Admin admin = userService.adminLogin(this.admin);
        if (admin != null) {
            ActionContext.getContext().getSession().put(Constant.ADMIN_LOGIN_INFO, admin);
            state = 1;
        }else{
            state = 0;
        }
        return "state";
    }*/
    /**
     * 删除
     * @return
     */
    public String adminDelete() {
        state = userService.adminDelete(admin);
        return "state";
    }
    /**
     * 管理员信息修改
     * @return
     */
    public String adminUpdate() {
        state = userService.adminSaveOrUpdate(admin);
        return "state";
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public IUserService getUserService() {
        return userService;
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

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public List<Admin> getAdmins() {
        return admins;
    }

    public void setAdmins(List<Admin> admins) {
        this.admins = admins;
    }

    public File getUserPhoto() {
        return userPhoto;
    }

    public void setUserPhoto(File userPhoto) {
        this.userPhoto = userPhoto;
    }

    public String getUserPhotoFileName() {
        return userPhotoFileName;
    }

    public void setUserPhotoFileName(String userPhotoFileName) {
        this.userPhotoFileName = userPhotoFileName;
    }

    public String getUserPhotoContentType() {
        return userPhotoContentType;
    }

    public void setUserPhotoContentType(String userPhotoContentType) {
        this.userPhotoContentType = userPhotoContentType;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public List<BankCard> getBankCards() {
        return bankCards;
    }

    public void setBankCards(List<BankCard> bankCards) {
        this.bankCards = bankCards;
    }

    public BankCard getBankCard() {
        return bankCard;
    }

    public void setBankCard(BankCard bankCard) {
        this.bankCard = bankCard;
    }

    public Integer getRechangeMoney() {
        return rechangeMoney;
    }

    public void setRechangeMoney(Integer rechangeMoney) {
        this.rechangeMoney = rechangeMoney;
    }

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getStringObjectMap() {
		return stringObjectMap;
	}
	public void setStringObjectMap(Map<String, Object> stringObjectMap) {
		this.stringObjectMap = stringObjectMap;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}

