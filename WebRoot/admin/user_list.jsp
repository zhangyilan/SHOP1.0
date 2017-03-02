<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form method="post" action="" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">
     用户列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath }/admin/add_user.jsp"> 新增用户</a> </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="200px" style="text-align:left; padding-left:20px;">头像</th>
        <th width="10%">姓名</th>
        <th width="20%">用户名</th>
        <th width="15%">密码</th>
        <th width="5%">性别</th>
        <th>电话</th>
        <th width="310">注册时间</th>
        <th width="310">操作</th>
      </tr>
      <volist name="list" id="vo">
      <c:forEach items="${stringObjectMap.dataList }" var="user">
        <tr>
        <td width="10%"><img src="${pageContext.request.contextPath }/upload/user/${user.photoUrl}" alt="用户头像" width="70" height="50" /></td>
          <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" />
           ${user.realName }</td>
          <td>${user.userName }</td>
          <td><input type="text" name="sort[1]" value="加密中" disabled="disabled" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" />
          		<button data-id="${user.id }" onclick="resetUserPwd(this)"; style="height: 25px;width: 50px">重置</button>
          </td>
          <td><font color="#00CC99">${user.sex }</font></td>
          <td>${user.phone }</td>
          <td>${user.registerTime }</td>
          <td><div class="button-group"> 
          <a class="button border-main" href="user!findUserById.action?user.id=${user.id}" >
          <span class="icon-edit"></span> 修改</a>
           <a class="button border-red" href="javascript:void(0)" data-id="${user.id }" onclick="return del(this)">
           <span class="icon-trash-o"></span> 删除</a> </div></td>
        </tr>
        </c:forEach>
   		
      <tr>
        <td style="text-align:left; padding:19px 0;padding-left:20px;"><input type="checkbox" id="checkall"/>
         </td>
        <td colspan="7" style="text-align:left;padding-left:20px;"> 操作：
          &nbsp;&nbsp;&nbsp;
          
          一页显示：
          <select name="copynum" style="padding:5px 15px; border:1px solid #ddd;" onchange="changecopy(this)">
          <option value="5">当前显示${rows }条数据</option>
         	<option value="5">每页显示5条数据</option>
            <option value="10">每页显示10条数据</option>
            <option value="20">每页显示20条数据</option>
            <option value="30">每页显示30条数据</option>
            <option value="40">每页显示40条数据</option>
            <option value="50">每页显示50条数据</option>
          </select></td>
      </tr>
      <tr>
        <td colspan="8"><div class="pagelist">
        
       <c:choose>
       	<c:when test="${stringObjectMap.pageNo==1}">
       	<a href="javascript:alert('已经是第一页啦！');">上一页</a>
       	</c:when>
       	<c:otherwise>
       	 <a href="${pageContext.request.contextPath }/user!pageFindAllUser.action?pageNo=${stringObjectMap.pageNo-1}">上一页</a>
       	</c:otherwise>
       </c:choose>
       
       <c:choose>
       	<c:when test="${stringObjectMap.pageNo==stringObjectMap.totalPage}">
       	<a href="javascript:alert('已经是最后一页啦！');">下一页</a>
       	<a href="javascript:alert('已经是最后一页啦！');">尾页</a>
       	</c:when>
       	<c:otherwise>
       	 <a href="${pageContext.request.contextPath }/user!pageFindAllUser.action?pageNo=${stringObjectMap.pageNo+1}">下一页</a>
       	  <a href="${pageContext.request.contextPath }/user!pageFindAllUser.action?pageNo=${stringObjectMap.totalPage}">尾页</a>
       	</c:otherwise>
       </c:choose>
           </div></td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function resetUserPwd(id){	
		var userId = $(id).attr("data-id");
		if(confirm("您确定要重置该用户的密码?")){
			var url = "${pageContext.request.contextPath}/user!AdminResetUserPwd.action?user.id="+userId;
			$.post(url);
			alert("密码重置为123456");
		}
		
		
		
}

//单个删除
function del(id){
	if(confirm("警告：您确定要删除吗?")){
		$(id).parents("tr").hide();
		var userId = $(id).attr("data-id");
		var url = "${pageContext.request.contextPath}/user!deleteUser.action?user.id="+userId;
		$.post(url,function(data){
		if(data==1){//删除失败
			alert("删除失败！因为存在该用户的订单/收货地址/收藏/银行卡信息等，请先清除该用户下的这些资料！");
			$(id).parents("tr").show();
		}else{
			alert("删除成功！");
		}
		});
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var num = $(o).val();
	window.location.href="user!pageFindAllUser.action?rows="+num;
	
}

</script>
</body>
</html>