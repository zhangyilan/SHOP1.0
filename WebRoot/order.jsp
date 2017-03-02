<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>

    <title>个人中心</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">

    <script src="js/jquery-1.7.2.min.js" ></script>
    <script src="js/html5.js" ></script>
    <script src="js/jflow.plus.js"></script>
    <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="js/checkbox.js"></script>
    <script src="js/radio.js"></script>
    <script src="js/selectBox.js"></script>
<style>
    .states li{
        font-size: 10px;
    }
    .counts{
        color: #EE4000;font-weight: bold;
    }
    .state-name{color: #EE4000;font-weight: bold;
    }
    .titles{
        background: #EE7942;border-radius: 5px;color: white;
    }.img-sty{
        width: 100px;
        height: 90px;
        border: 1px solid #F4F4F4;
         }.pay-error{
              color:red;
              font-size: 12px;
          }
    .pay-btn{
        margin-left: 80%;width: 150px;font-weight: bold;
    }.pay-window{
         position: fixed;
         top:40%;
         display: none;
         left: 40%;width: 250px;background: #B9D3EE;
         height:100px;border: 2px solid #9AC0CD;
         -webkit-box-shadow: #D1D1D1 0px 0px 8px;
         -moz-box-shadow: #D1D1D1 0px 0px 8px;
         box-shadow: #D1D1D1 0px 0px 8px;z-index: 5;text-align: center;
     }
</style>
    <script>
        $(document).ready(function() {
            $("select").selectBox();
        });
    </script>

    <script>
        $(document).ready(function(){
            $("#myController").jFlow({
                controller: ".control", // must be class, use . sign
                slideWrapper : "#jFlowSlider", // must be id, use # sign
                slides: "#slider",  // the div where all your sliding divs are nested in
                selectedWrapper: "jFlowSelected",  // just pure text, no sign
                width: "984px",  // this is the width for the content-slider
                height: "480px",  // this is the height for the content-slider
                duration: 400,  // time in miliseconds to transition one slide
                prev: ".slidprev", // must be class, use . sign
                next: ".slidnext", // must be class, use . sign
                auto: true
            });
        });
    </script>

    <script>
        $(document).ready(function(){
            $("button").click(function(){
                $(this).addClass('click')
            });
        })
    </script>
    <script>
        $(function () {
            //取消订单
            $(".deleteBtn").click(function () {
                var order = $(this).attr("data-id");
                var r = confirm("您确定要删除吗？");
                if(r){
                    var data = {"order.id":order};
                    var url = "${pageContext.request.contextPath}/order!cancel.action";
                    $.post(url,data);
                    $(this).parents("table").remove();
                }
            });
            //确认收货
            $(".shouhuo").click(function () {
                $(".order-id").val($(this).attr("data-id"));
                $(".pay-window").show();
            });

        });
        //关闭输入密码窗口
        function closePayWindow() {
            $(".pay-window").hide();
            $("[name=pay-pwd]").val("");
            $(".input-pwd").text(" 输入支付密码：");
        }
        function submitPwd() {
            var payPwd = $(".paypwd").val();
            var userPwd = $(".userPwd").val();
            if(payPwd==""){
                $(".input-pwd").html("<span class='pay-error' >支付密码不能为空！</span>");
            }else if(payPwd!=userPwd){
                $(".input-pwd").html("<span class='pay-error' >支付密码错误，请重新输入</span>");
            }else{
                //支付密码验证成功
                $(".input-pwd").html("<span style='color:green' >√密码验证成功！请稍后...</span>");
                var id = $(".order-id").val();
               location.href="${pageContext.request.contextPath}/order!changeOrder.action?order.orderNumber="+id;
            }
        }
    </script>
</head>
<body>
<!--支付窗口-->
<div class="pay-window">
    <%--用户实际密码--%>
    <input type="hidden" class="userPwd" value="${sessionScope.userInfo.password}">
    <input type="hidden" class="order-id" value="">
    <span class="input-pwd"> 输入支付密码</span><br>
    <input  type="password" class="paypwd" name="pay-pwd" placeholder="默认为登录密码" maxlength="15"><br><br>
    <input style="cursor: pointer" type="button" onclick="submitPwd()" value="确定"/>&nbsp;&nbsp;
    <input type="button" style="cursor: pointer" onclick="closePayWindow()" value="取消"/>
</div>
<div class="container_12">

    <div class="clear"></div>

    <header id="branding">
        <div class="grid_3">
            <hgroup>
                <h1 id="site_logo" ><a href="index.jsp" title=""><img src="images/logo.png" alt="Online Store Theme Logo"/></a></h1>
            </hgroup>
        </div><!-- .grid_3 -->

        <div class="grid_3">
            <form class="search">
                <input type="text" name="search" class="entry_form" value="" placeholder="搜索整个商店"/>
            </form>
        </div><!-- .grid_3 -->
            <nav class="private">
                <ul>
                    <c:if test="${not empty userInfo}">
                        <li><a href="user_info.jsp">${userInfo.userName}</a></li>
                        <li class="separator">|</li>
                        <li> <a href="user_userLogout">注销</a></li>
                    </c:if>
                    <c:if test="${empty userInfo}">
                        <li> <a href="login.jsp">登录</a></li>
                        <li class="separator">|</li>
                        <li><a href="register.jsp">注册</a></li>
                    </c:if>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/collect!findUserAll">我的收藏</a></li>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/cart!findMyCart.htm">我的购物车</a></li>
                </ul>
            </nav><!-- .private -->
        </div><!-- .grid_6 -->
    </header><!-- #branding -->
</div><!-- .container_12 -->


<div id="block_nav_primary">
    <div class="container_12">
        <div class="grid_12" style="border:0">
            <nav class="primary">
                <ul>
                    <li ><a href="index.jsp">bigJD首页</a></li>
                    <li ><a href="user_info.jsp">个人信息</a></li>
                    <li><a href="user_update.jsp">信息修改</a></li>
                    <li><a href="user_password.jsp">密码修改</a></li>
                    <li><a href="user_address.jsp">收货地址管理</a></li>
                    <li class="curent"><a href="${pageContext.request.contextPath}/order!myOrder.action">我的订单</a></li>
                    <li><a href="${pageContext.request.contextPath}/collect!findUserAll">我的收藏</a></li>
                    <li ><a href="${pageContext.request.contextPath}/cart!findMyCart.htm">购物车</a></li>
                    <li><a href="user_userBank">储蓄卡</a></li>
                </ul>
            </nav><!-- .primary -->
        </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
</div><!-- .block_nav_primary -->

<div class="clear"></div>

  <section id="main" >
    <div class="container_12">
           <div class="grid_12"  style="border:0">
               <nav class="primary">
                   <ul class="states">
                       <li ><a href="${pageContext.request.contextPath}/order!myOrder.htm?state=-1" style="font-size: 12px">全部订单&nbsp;<span class="counts">${sessionScope.stringLongMap.all}</span></a></li>
                       <li ><a href="${pageContext.request.contextPath}/order!myOrder.htm?state=0" style="font-size: 12px">未付款&nbsp;<span class="counts">${sessionScope.stringLongMap.noPay}</span></a></li>
                       <li ><a href="${pageContext.request.contextPath}/order!myOrder.htm?state=1" style="font-size: 12px">待发货&nbsp;<span class="counts">${sessionScope.stringLongMap.pay}</span></a></li>
                       <li ><a href="${pageContext.request.contextPath}/order!myOrder.htm?state=2" style="font-size: 12px">已发货&nbsp;<span class="counts">${sessionScope.stringLongMap.fahuo}</span></a></li>
                       <li ><a href="${pageContext.request.contextPath}/order!myOrder.htm?state=3" style="font-size: 12px">已完成&nbsp;<span class="counts">${sessionScope.stringLongMap.finish}</span></a></li>
                   </ul>
               </nav><!-- .primary -->
           </div><!-- .grid_12 -->
        <c:if test="${stringObjectMap.total==0}">
        <table class="cart_product" style="border: 2px solid #59b7c2">
            <table class="cart_product" style="border: 2px solid #59b7c2">
                <tr>
                    <th class="bg name" style="text-align: center"><h3>没有订单数据！</h3></th>

                </tr>

                </tr>
            </table>
        </table>
        </c:if>
    <c:forEach items="${stringObjectMap.dataList}" var="order">
       <table class="cart_product" style="border: 2px solid #59b7c2">
	      <tr>
		     <th class="images">编号：${order.id}</th>
		     <th class="bg name">下单日期:2016-12-20 00:00:00 <br>订单号:${order.orderNumber}</th>
		     <th class="edit">收件人|电话</th>
		     <th class="bg price">备注</th>
		     <th class="qty">购买数量</th>
		     <th class="bg subtotal">小计</th>
		     <th class="close">状态|操作</th>
	      </tr>
	      <tr>
		     <td class="images" ><a href="product_detail?id=${order.product.id}" >
                 <c:forEach var="d" items="${order.product.imgs}" varStatus="index">
                     <c:if test="${index.index == 0}">
                         <img class="img-sty" src="${pageContext.request.contextPath}/upload/product/${d.url}" alt="Product 6">
                     </c:if>
                 </c:forEach>
             </a></td>
		     <td class="bg name">${order.product.name}<br/>
                 原价：<span style="text-decoration:line-through;color: gray">$${order.product.oldPrice}</span >
                 &nbsp;促销价：<span style="color:#EE2C2C">$${order.product.barginPrice}</span>
                 <br><br>
                 <span style="color:#EE7942">收货地址</span>[${order.address}]
             </td>
		     <td class="edit"><a title="Edit"><br>${order.consigneeName}（收）<br><br>${order.tell}</a></td>
		     <td class="bg price">${order.remark}</td>
		     <td class="qty"><input type="text" style="width:50px;text-align: center" value="${order.number}" placeholder="1000" readonly />
                <br>
             </td>
		     <td class="bg subtotal">
                 ${order.number}X${order.product.barginPrice}<br>
                     <span style="color: #EE4000;font-size: 20px;font-weight: bold">￥${order.number*order.product.barginPrice}</span>
                 <br>（RMB）</td>
		     <td class="close" style="width: 100px;text-align: center;line-height: 30px">
                 <c:if test="${order.state==0}">
                     <span class="state-name">未付款</span><br>
                     <input  class="titles" value="立即付款" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/order!pay.action?order.orderNumber=${order.orderNumber}&op=isNewPay'">
                     <br/>
                     <a class="deleteBtn" data-id="${order.id}" style="text-decoration: none;cursor: pointer">取消订单</a>
                     </c:if>

                 <c:if test="${order.state==1}">
                     <span class="state-name"><span style="color: #36648B;">已付款</span><br>待发货</span><br>
                 </c:if>
                 <c:if test="${order.state==2}">
                     <span class="state-name">已发货</span><br>
                     <input class="titles shouhuo" data-id="${order.orderNumber}" value="确认收货" type="button">
                 </c:if>
                 <c:if test="${order.state==3}">
                     <span class="state-name">已完成</span><br>
                     <a class="deleteBtn" data-id="${order.id}" style="text-decoration: none;cursor: pointer">删除订单</a>
                 </c:if>
	      </tr>
	      <tr>
	      </tr>
       </table>
    </c:forEach>
       </div><!-- .grid_12 -->
      <c:if test="${stringObjectMap.total!=0}">
        <div class="pagination">
            <ul>
                <li class="prev"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo-1}">
                    <span>&#8592;</span></a></li>
                <c:if test="${stringObjectMap.totalPage>=pageNo}">
                    <li class="curent"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo}">${stringObjectMap.pageNo}</a></li>
                </c:if>
                <c:if test="${stringObjectMap.totalPage>=pageNo+1}">
                    <li class="curent"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo+1}">${stringObjectMap.pageNo+1}</a></li>
                </c:if>
                <c:if test="${stringObjectMap.totalPage>=pageNo+2}">
                    <li class="curent"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo+2}">${stringObjectMap.pageNo+2}</a></li>
                </c:if>
                <c:if test="${stringObjectMap.totalPage>=pageNo+3}">
                    <li class="curent"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo+3}">${stringObjectMap.pageNo+3}</a></li>
                </c:if>
                <c:if test="${stringObjectMap.totalPage>=pageNo+4}">
                    <li class="curent"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo+4}">${stringObjectMap.pageNo+4}</a></li>
                </c:if>
                <c:if test="${stringObjectMap.totalPage>=pageNo+5}">
                    <li class="curent"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo+5}">${stringObjectMap.pageNo+5}</a></li>
                </c:if>
                <c:if test="${stringObjectMap.totalPage>=pageNo+6}">
                    <li class="curent"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo+6}">${stringObjectMap.pageNo+6}</a></li>
                </c:if>
                <c:if test="${stringObjectMap.totalPage>=pageNo+7}">
                    <li><span>...</span></li>
                </c:if>
                <c:choose>
                    <c:when test="${stringObjectMap.totalPage==pageNo}">
                        <li class="next"><a href="javascript:void(0)">&#8594;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="next"><a href="${pageContext.request.contextPath}/order!myOrder.action?pageNo=${stringObjectMap.pageNo+1}">&#8594;</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div><!-- .pagination -->
      </c:if>
        <div class="clear"></div>
      </div><!-- #content_bottom -->
      <div class="clear"></div>

      <div class="clear"></div>

        </div><!-- .list_carousel -->
      </div><!-- .carousel -->

    </div><!-- .container_12 -->
  </section><!-- #main -->

  <div class="clear"></div>

  <footer>
    <div class="f_navigation">
      <div class="container_12">
        <div class="grid_3">
          <h3>Contact Us</h3>
          <ul class="f_contact">
            <li>49 Archdale, 2B Charlestone</li>
            <li>+777 (100) 1234</li>
            <li>mail@example.com</li>
          </ul><!-- .f_contact -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>Information</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="#">About As</a></li>
              <li><a href="#">Privacy Policy</a></li>
              <li><a href="#">Terms & Conditions</a></li>
              <li><a href="#">Secure payment</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>Costumer Servise</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="contact_us.html">Contact As</a></li>
              <li><a href="#">Return</a></li>
              <li><a href="#">FAQ</a></li>
              <li><a href="#">Site Map</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="grid_3">
          <h3>My Account</h3>
          <nav class="f_menu">
            <ul>
              <li><a href="#">My Account</a></li>
              <li><a href="#">Order History</a></li>
              <li><a href="#">Wish List</a></li>
              <li><a href="#">Newsletter</a></li>
            </ul>
          </nav><!-- .private -->
        </div><!-- .grid_3 -->

        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_navigation -->

    <div class="f_info">
      <div class="container_12">
        <div class="grid_6">
          <p class="copyright">© Breeze Store Theme, 2013. Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></p>
        </div><!-- .grid_6 -->

        <div class="grid_6">
          <div class="soc">
            <a class="google" href="#"></a>
            <a class="twitter" href="#"></a>
            <a class="facebook" href="#"></a>
          </div><!-- .soc -->
        </div><!-- .grid_6 -->

        <div class="clear"></div>
      </div><!-- .container_12 -->
    </div><!-- .f_info -->
  </footer>

</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
