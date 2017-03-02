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
    .select-address li{
        list-style-type: none;
        border-bottom: 1px solid #F4F4F4;
        background: #F4F4F4;
        border-radius: 20px;
        color: #333333;
    }
    .botton-info{
        background: #f2f7ff;
    }
    .queren-info{
        padding-top: 5px;
       border:2px solid #CD0000;
        height:150px;
        border-style: dotted;
        -webkit-box-shadow: #CD0000 0px 0px 8px;
        -moz-box-shadow: #CD0000 0px 0px 8px;
        box-shadow: #CD0000 0px 0px 8px;
    }
    .sjfk{
        font-size: 20px;
        font-weight: bold;
    }.endPrice{
        color: #CD0000;
        font-size: 30px;
         }
    .endAddress{ font-size: 17px;
        font-weight: bold;}
.order_address{
    color: gray;
    font-size: 14px;
}.submit-btn{
        width: 170px;
        height: 45px;
        background:gray;
        color: white;
        cursor: pointer;
        text-align: center;
        font-size: 20px;float: right;margin-right: 20px;
        font-weight: bold;line-height: 45px;

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
            //选择收货地址
            $("[name=address]").click(function () {
                $(".order_address").text($(this).val());
                $(".submit-btn").css("background","#CD0000");
            });
            //
            $(".address-li").click(function(){
                $("[name=addressIds]").val($(this).attr("data-id"));
            });
        });
        //计算总价
        function totalPrice() {
            var totals = $(".totalPrice");
            var countPrice = 0;
            for(var i = 0 ;i <totals.length;i++){
                countPrice+=parseInt($(totals[i]).text());
            }
            $(".endPrice").text(countPrice);
        }
        //提交订单
        function submitOrder() {
             var flag = $(".flag-address").text();
            if(flag==""){
                //提交一次
                $(".submit-btn").text("结算中...");
                //已选择地址
                var remark = $("[name=remark]").val();
                if(remark==""){
                    remark="买家没有填写备注！";
                }
               var data = {"addressIds":$("[name=addressIds]").val(),
                            "order.remark":remark,
                            };
                var url ="${pageContext.request.contextPath}/order!createOrder.action";

                $.post(url,data,function (rs) {
                    //结算成功
                   if(rs>0){
                       //跳转支付页面
                       location.href = "${pageContext.request.contextPath}/order!pay.htm";
                   }
                });
            }

        }

    </script>
</head>
<body>
<!--支付窗口开始-->

<!--支付窗口结束-->
<div class="container_12">

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


<div class="clear"></div>
  <section id="main" class="entire_width">
    <div class="container_12">
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">订单确认</h1>
		</div><!-- .grid_12 -->

		<div class="grid_9" id="checkout_info" style="width: 100%">
			<ul class="checkout_list">
				<li class="active">
					<div class="list_header">确认订单<div class="number">1</div></div>
					<div class="list_body">
						<form class="checkout_or">
							<h6 style="color: #DC143C;">您将要购买以下商品，请确认购买信息</h6>
							<p>京东自营品牌</p>
						</form>
                        <table class="cart_product">
                            <c:forEach items="${sessionScope.productItems}" var="pt">
                                <tr>
                                    <td class="images"><a href="product_detail?id=${pt.product.id}">
                                        <c:forEach var="data" items="${pt.product.imgs}" varStatus="index">
                                            <c:if test="${index.index == 0}">
                                            <img src="${pageContext.request.contextPath}/upload/product/${data.url}" alt="Product 6"></a></td>
                                            </c:if>
                                        </c:forEach>
                                    <td class="bg name">${pt.product.name}<br/>
                                        原价：<span style="text-decoration:line-through;color: gray">$${pt.product.oldPrice}</span >
                                        &nbsp;<br>促销价：<span style="color:#EE2C2C">$${pt.product.barginPrice}</span>
                                    </td>
                                    <td class="bg price">$${pt.product.barginPrice}</td>
                                    <td class="qty"><input type="text" name="" value="${pt.number}" placeholder="1000" readonly /></td>
                                    <td class="bg subtotal">$<span class="totalPrice">${pt.totalPrice}</span></td>
                                </tr>
                            </c:forEach>
                            <tr>
                            </tr>
                        </table>
                        <h4>*选择你的收货地址：</h4>
                        <ul class="radio select-address">
                            <c:forEach items="${sessionScope.addressList}" var="ad">
                                <li class="address-li" data-id="${ad.id}"><label><input class="niceRadio"  type="radio" name="address"  value="${ad.name}${ad.tell}(${ad.receipt}&nbsp;收)"/>
                                     ${ad.name}${ad.tell}(${ad.receipt}&nbsp;收)</label></li>
                            </c:forEach>
                        </ul>
                        <table class="botton-info">
                            <tr style="height: 150px;">
                                <td><textarea name="remark" style="width: 70%" placeholder="备注：如发货问题，商品描述等"></textarea><br></td>
                                <td>
                                    运送方式:<select>
                                                <option>免邮费普通配送快递 免邮</option>
                                            </select><br><br>
                                    发票抬头：<input value="${sessionScope.userInfo.realName}">
                                </td>
                            </tr>
                            <tr>
                                <td class="queren-info" colspan="2" >
                                        <div class="sjfk">实付款：<span>￥</span><span class="endPrice" ></span>.00</div>
                                    <div class="endAddress">寄送至:&nbsp&nbsp;
                                        <input name="addressIds" type="hidden">
                                        <span class="order_address"><span style="display: none" class="flag-address">1</span><span style="color: red">你还没有选择收货地址！</span></span></div>
                                    <div class="submit-btn" onclick="submitOrder()">提交订单</div>
                                </td>
                            </tr>
                        </table>
						<div class="clear"></div>
					</div>
				</li>
			</ul>
                </div><!-- .grid_9 -->

       </div><!-- #content -->
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