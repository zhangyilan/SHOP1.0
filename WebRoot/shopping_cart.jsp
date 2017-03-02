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
        $(function() {
            $('#list_product').carouFredSel({
                prev: '#prev_c1',
                next: '#next_c1',
                auto: false
            });
            $('#list_product2').carouFredSel({
                prev: '#prev_c2',
                next: '#next_c2',
                auto: false
            });
            $('#list_banners').carouFredSel({
                prev: '#ban_prev',
                next: '#ban_next',
                scroll: 1,
                auto: false
            });
            $(window).resize();
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
        //后面加上去的/////////////////////////////////////////////////
        $(function () {
            totalPrice();
            checkCartIsNull();
            //删除购物车中商品
            $(".delete-cart").click(function () {
                var r = confirm("您确定要删除吗？");
                if(r){
                    var productItem = $(this).parent().parent();
                    $(productItem).remove();
                    totalPrice();
                    var data = {"productItem.id":$(this).attr("data-id")};
                    var url = "${pageContext.request.contextPath}/cart!deleteProductItem.htm";
                    $.post(url,data);
                    checkCartIsNull();
                }

            });
            $(".balance").click(function () {
                balance();
            });
        });
        //结算
        function balance(){
            var isSelectProduct = checkCartIsNull();
            if(!isSelectProduct){
                $(".balance-info").fadeIn();
                setTimeout(function () {
                    $(".balance-info").fadeOut();
                }, 700);
            }else{
                location.href="${pageContext.request.contextPath}/cart!balance.htm";
            }
        }
        //判断购物车中是否还有商品
        function checkCartIsNull() {
            if($(".delete-cart").length==0){
                $(".tishi-info").show();
                return false;
            }else{
                return true;
            }
        }
        //计算总价
        function totalPrice() {
            var totals = $(".totalPrice");
            var countPrice = 0;
            for(var i = 0 ;i <totals.length;i++){
                countPrice+=parseInt($(totals[i]).text());
            }
            $(".countPrice").text(countPrice);
        }
        //清空购物车
        function clearCart() {
            var alls=$(".delete-cart");
            if(alls.length>0){
                var r = confirm("您确定要清空购物车中的商品？");
                if(r){
                    var ids = "";
                    for(var i = 0;i<alls.length;i++){
                        ids += $(alls[i]).attr("data-id")+",";
                        $(alls[i]).parent().parent().remove();
                    }
                    $(".tishi-info").show();
                    var url = "${pageContext.request.contextPath}/cart!deleteAll.htm?ids="+ids;
                    $.post(url);
                }
            }

        }
    </script>
</head>
<body>
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

        <div class="grid_6">

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
                    <li><a href="collect!findUserAll">我的收藏</a></li>
                </ul>
            </nav><!-- .private -->
        </div><!-- .grid_6 -->
    </header><!-- #branding -->
</div><!-- .container_12 -->


<div id="block_nav_primary">
    <div class="container_12">
        <div class="grid_12">
            <nav class="primary">
                <ul>
                    <li ><a href="index.jsp">bigJD首页</a></li>
                    <li ><a href="user_info.jsp">个人信息</a></li>
                    <li><a href="user_update.jsp">信息修改</a></li>
                    <li><a href="user_password.jsp">密码修改</a></li>
                    <li><a href="user_findAllAddress">收货地址管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/order!myOrder.action">我的订单</a></li>
                    <li><a href="collect!findUserAll">我的收藏</a></li>
                    <li class="curent"><a href="${pageContext.request.contextPath}/cart!findMyCart.htm">购物车</a></li>
                    <li><a href="user_userBank">储蓄卡</a></li>
                </ul>
            </nav><!-- .primary -->
        </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
</div><!-- .block_nav_primary -->

<div class="clear"></div>

  <section id="main" class="entire_width">
    <div class="container_12">
       <div class="grid_12">
       <h1 class="page_title">购物车</h1>

       <table class="cart_product">
	      <tr>
		     <th class="images">商品图片</th>
		     <th class="bg name">商品名</th>
		     <th class="edit">备注</th>
		     <th class="bg price">单价</th>
		     <th class="qty">购买数量</th>
		     <th class="bg subtotal">小计</th>
		     <th class="close"> </th>
	      </tr>
               <tr class="tishi-info" style="display: none">
                    <td colspan="5"><h1>很遗憾！您的购物车中没有商品！</h1></td>
               </tr>
           <c:forEach items="${productItems}" var="pt">
	      <tr>
              <td class="images"><a href="product_detail?id=${pt.product.id}">
                  <c:forEach var="d" items="${pt.product.imgs}" varStatus="index">
                      <c:if test="${index.index == 0}">
                          <img src="${pageContext.request.contextPath}/upload/product/${d.url}" alt="Product 6">
                     </c:if>
                 </c:forEach>
             </a></td>
		     <td class="bg name">${pt.product.name}<br/>
                 原价：<span style="text-decoration:line-through;color: gray">$${pt.product.oldPrice}</span >
                 &nbsp;促销价：<span style="color:#EE2C2C">$${pt.product.barginPrice}</span>
                 <br><br>
                 <c:set var="testStr" value="${pt.product.info}"  ></c:set>
                <c:choose>
                 <c:when test="${fn:length(testStr) > 50}">
                     <c:out value="${fn:substring(testStr, 0, 50)}......" />
                 </c:when>
                 <c:otherwise>
                     <c:out value="${testStr}" />
                 </c:otherwise>
                 </c:choose>
             </td>
		     <td class="edit"><a title="Edit" href="#">Edit</a></td>
		     <td class="bg price">$${pt.product.barginPrice}</td>
		     <td class="qty"><input type="text" name="" style="width:50px;text-align: center" value="${pt.number}" placeholder="1000" readonly /></td>
		     <td class="bg subtotal">$<span class="totalPrice">${pt.totalPrice}</span></td>
		     <td class="close"><a title="close" class="close delete-cart" data-id="${pt.id}"></a></td>
	      </tr>
           </c:forEach>
	      <tr>
		     <td colspan="7" class="cart_but">
			    <a href="index.jsp"><button class="continue"><span>icon</span>继续购物</button></a>
			    <button class="update clear-cart" onclick="clearCart();"><span>icon</span>清空购物车</button>
		     </td>
	      </tr>
       </table>
       </div><!-- .grid_12 -->
        <div class="grid_4" style="float: right;width: 100%">
          <div class="bottom_block total">
	      <table class="subtotal">
		     <tr>
			    <td>Subtotal</td><td class="price">$<span class="countPrice">0</span>.00</td>
		     </tr>
		     <tr class="grand_total">
			    <td>总价钱</td><td class="price">￥<span class="countPrice">计算中...</span>.00</td>
		     </tr>
	      </table>
	    <button class="checkout balance" >立即结算</button>
            <span  class="balance-info" style="color:red;display: none">sorry！没有可以结算的商品！</span>
          </div><!-- .total -->
        </div><!-- .grid_4 -->

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
