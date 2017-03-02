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
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加商品</strong></div>
  <div class="body-content">
    <form class="form-x" action="product_newProduct" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>商品展示名</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="product.name" data-validate="required:请输入商品展示名" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>原价</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" value="" name="product.oldPrice" data-validate="required:请输入原价" />
          <div class="tips"></div>
        </div>
      </div>
      
        <div class="form-group">
        <div class="label">
          <label>促销价</label>
        </div>
        <div class="field">
          <input type="number" class="input w50" value="" name="product.barginPrice" data-validate="required:请输入促销价" />
          <div class="tips"></div>
        </div>
      </div>
      
      <div class="form-group" id="fileBox">
        <div class="label">
          <label>上传商品图片</label>
        </div>
        <div class="field" >
          <input type="file" name='file' onchange="addFile()" class="button bg-blue margin-left" id="image1" value="+ 浏览上传"  style="float:left;">
          <div class="tipss">支持上传多张图片</div>
        </div>
      </div>     
         <script>
           function addFile() {
               var data =  "<div class='form-group' id='fileBox'>"+
               "<div class='label'><label>上传商品图片</label> </div>"+
            	  " <div class='field' ><input type='file' name='file' onchange='addFile()' class='button bg-blue margin-left' id='image1' value='+ 浏览上传'  style='float:left'></div></div>";
               $("#fileBox").append(data);
           }
          </script>
      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>商品分类：</label>
          </div>
          <div class="field">
             <select name="categoryId" class="input w50">
                    <c:forEach var="data" items="${categoryProducts}">
                            <option  value="${data.id}"> ${data.name}</option>
                    </c:forEach>
                    </select>
            <div class="tips"></div>
          </div>
        </div>
      </if>
      <div class="form-group">
        <div class="label">
          <label>描述：</label>
        </div>
        <div class="field">
          <textarea class="input" name="product.info"  style=" height:110px;width: 50%"></textarea>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 添加</button>
          &nbsp;<span style="color: red">${msg }</span>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>
