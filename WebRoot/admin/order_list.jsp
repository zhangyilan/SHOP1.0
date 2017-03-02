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
    <div class="panel-head"><strong class="icon-reorder"> 用户订单列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    
    <table class="table table-hover text-center">
   
      <tr>
        <th width="100" style="text-align:left; padding-left:20px;">订单号</th>
        <th width="10%">购买数量</th>
        <th>所购商品</th>
        <th>商品单价</th>
        <th>下单日期</th>
        <th>收件人|电话</th>
        <th>备注</th>
        <th width="10%">价钱计算(RMB)</th>
        <th width="5%">状态</th>
        <th width="210">操作</th>
      </tr>
      <volist name="list" id="vo">
        <c:forEach items="${stringObjectMap.dataList }" var="o">
       	<tr>
          <td style="text-align:left; padding-left:20px;">
           ${o.orderNumber }</td>
          <td><input type="text" readonly="readonly" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" value="${o.number }"/></td>
          <td width="10%"><a href="product_detail?id=${o.product.id}" target="_blank">${o.product.name }</a></td>
          <td>${o.product.barginPrice }</td>
          <td>${o.addTime }</td>
          <td><font color="#00CC99">${o.tell}|${o.address }</font></td>
          <td>${o.remark }</td>
          <td>${o.number }件X${o.product.barginPrice }元<h2 style="color: red">${o.number*o.product.barginPrice }</h2></td>
          <td>
          	<c:if test="${o.state==0 }"><span style="color: red;font-weight: bold;">未付款☹</span></c:if>
          	<c:if test="${o.state==1 }"><span style="color: green;font-weight: bold;">已付款√</span></c:if>
          	<c:if test="${o.state==2 }"><span style="color: blue;font-weight: bold;">发货中┉</span></c:if>
          	<c:if test="${o.state==3 }"><span style="font-weight: bold;">已完成☑</span></c:if>
          </td>
          <td>
          <div class="button-group"> 
          <c:if test="${o.state==1 }">
          	 <a onclick="alert('发货成功！');" class="button border-main" href="${pageContext.request.contextPath }/order!adminFahuo.action?order.orderNumber=${o.orderNumber}">
          	<span class="icon-edit"></span>立即发货</a>
          </c:if>
          <c:if test="${o.state==3 }">
          	 <a class="button border-red" href="javascript:void(0)" id="del${o.id}" onclick="return del(${o.id})">
          <span class="icon-trash-o"></span>删除订单</a> </div>
          </c:if>
           <c:if test="${o.state==0 }">
          	 <a class="button border-main" href="javascript:alert('已通知买家！')">
          	<span class="icon-edit"></span>提醒付款</a> 
          </c:if>
          <c:if test="${o.state==2 }">
          	 <a class="button border-main" href="javascript:alert('暂无物流信息！')">
          	<span class="icon-edit"></span>查物流信息</a> 
          </c:if>
          </td>
        </tr>
   		</c:forEach>
   		
     <tr>
        <td colspan="10"><div class="pagelist">
        
       <c:choose>
       	<c:when test="${stringObjectMap.pageNo==1}">
       	<a href="javascript:alert('已经是第一页啦！');">上一页</a>
       	</c:when>
       	<c:otherwise>
       	 <a href="${pageContext.request.contextPath }/order!adminFindAllOrderList.action?pageNo=${stringObjectMap.pageNo-1}&state=${state}">上一页</a>
       	</c:otherwise>
       </c:choose>
       
       <c:choose>
       	<c:when test="${stringObjectMap.pageNo==stringObjectMap.totalPage}">
       	<a href="javascript:alert('已经是最后一页啦！');">下一页</a>
       	<a href="javascript:alert('已经是最后一页啦！');">尾页</a>
       	</c:when>
       	<c:otherwise>
       	 <a href="${pageContext.request.contextPath }/order!adminFindAllOrderList.action?pageNo=${stringObjectMap.pageNo+1}&state=${state}">下一页</a>
       	  <a href="${pageContext.request.contextPath }/order!adminFindAllOrderList.action?pageNo=${stringObjectMap.totalPage}&state=${state}">尾页</a>
       	</c:otherwise>
       </c:choose>
           </div></td>
      </tr>
      
    </table>
  </div>
</form>
<script type="text/javascript">

//搜索
function changesearch(){	
		
}

//单个删除
function del(id){
	if(confirm("您确定要删除吗?")){
		$("#del"+id).parents("tr").hide();
		 var url = "order!delete.action?order.id="+id;
		$.post(url); 
		 
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
});

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
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>