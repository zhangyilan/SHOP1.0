<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改管理员密码</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" name="form1" action="user!adminUpdatePwd.action" target="_top">
     <div class="form-group">
        <div class="label">
          <label for="sitename">当前身份：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           ${sessionScope.adminInfo.realName }
          </label>
        </div>
      </div>   
     
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员帐号：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           ${sessionScope.adminInfo.loginName }
          </label>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="oldpwd" name="mpass" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="newpass" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码,length#>=5:新密码不能小于5位" />         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" id="newpwd" name="admin.password" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#newpass:两次输入的密码不一致" />          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" onclick="checkOldPwd();"> 确认修改</button>
        </div>
      </div>      
    </form>
  </div>
</div>
<input type="hidden" id="pwd" value="${sessionScope.adminInfo.password }" >
</body>
<script type="text/javascript">
function checkOldPwd(){
	var oldPwd=$("#pwd").val();
	if($("#oldpwd").val()==oldPwd){
		alert("密码修改成功！需要重新登陆！");
		$("[name=form1]").submit();
	}else{
		alert("原密码错误！");
	}
}
</script>
</html>