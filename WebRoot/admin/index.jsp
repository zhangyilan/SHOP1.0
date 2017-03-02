<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理中心</title>  
 <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/admin.css">
    <script src="${pageContext.request.contextPath }/admin/js/jquery.js"></script>
</head>

<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="${pageContext.request.contextPath }/admin/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />后台管理中心,你好！${sessionScope.adminInfo.realName }</h1>
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="${pageContext.request.contextPath }/product_indexShow.action" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;<a href="javascript:alert('清除成功！');" class="button button-little bg-blue"><span class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;<a class="button button-little bg-red" href="${pageContext.request.contextPath }/user!adminLogout.action"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <c:forEach items="${sessionScope.adminInfo.authoritys }" var="authority">
  	 <h2><span class="icon-user"></span>${authority.name }</h2>
  <ul style="display:block">
  <c:forEach items="${authority.menus }" var="menu">
   <li><a href="${pageContext.request.contextPath }/${menu.url}" target="right"><span class="icon-caret-right"></span>${menu.name }</a></li>
   </c:forEach>
  </ul> 
  </c:forEach>
  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a href="{:U('Index/info')}" target="right" class="icon-home"> 首页</a></li>
  <li><a href="##" id="a_leader_txt">当前账号:&nbsp;${sessionScope.adminInfo.loginName }</a></li>
  <li><b>当前身份：</b><span style="color:red;">${sessionScope.adminInfo.realName }</php></span>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">中文</a> </li>
</ul>
<div class="admin" style="text-align: center;">
   <iframe scrolling="auto" rameborder="0" src="/shop/admin/loginsuc.html" name="right" width="100%" height="100%"></iframe>
</div>
<div style="text-align:center;">
</div>
</body>
</html>