<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/admin.css">
<script src="${pageContext.request.contextPath }/admin/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/admin/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>修改用户信息</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="${pageContext.request.contextPath }/user!adminUpdateUser.action" enctype="multipart/form-data">  
      <div class="form-group">
        <div class="label">
          <label>用户名</label>
        </div>
        <div class="field">
          <input readonly="readonly" type="text" class="input w50" value="${user.userName }" name="user.userName" data-validate="required:请输入用户名" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>密码</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.password }" name="user.password" data-validate="required:请输入密码" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>姓名</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.realName }" name="user.realName" data-validate="required:请输入姓名" />
          <div class="tips"></div>
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>联系方式</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${user.phone }" name="user.phone" data-validate="required:请输入联系方式" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>选择一个头像：</label>
        </div>
        <div class="field">
          <input type="file" class="button bg-blue margin-left" name="userPhoto" id="user.userPhoto" value="+ 浏览上传"  style="float:left;">
          <div class="tipss">图片支持：jpeg,png,gif,jpg</div>
        </div>
      </div>
        <div class="form-group">
          <div class="label">
            <label>性别：</label>
          </div>
          <div class="field" style="padding-top:8px;"> 
          
		            男<input value="男" id="ishome" name="user.sex" type="radio"  />
		            女 <input value="女"  name="user.sex"  type="radio" />
          </div>
        </div>
      </if>
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <input type="hidden" name="user.id" value="${user.id }">
        <div class="field">
          <textarea class="input" name="note" style=" height:90px;width: 50%">${user.remark }</textarea>
          <div class="tips">  <br><button class="button bg-main icon-check-square-o" type="submit">确定修改</button>&nbsp;&nbsp;&nbsp;&nbsp;${msg }</div>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>