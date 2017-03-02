<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>

    <title>支付页面</title>
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
    .bank-card{
        border:5px solid #9AC0CD;
        border-style: dashed;
        -webkit-box-shadow: #9AC0CD 0px 0px 8px;
        -moz-box-shadow: #9AC0CD 0px 0px 8px;
        box-shadow: #9AC0CD 0px 0px 8px;
        text-align: right;
        background: url("../images/yl.JPG") no-repeat;
    }
    .pay-error{
        color:red;
        font-size: 12px;
    }
   .card{
       margin: 5px;background: #7D9EC0;
       width: 100px;color: white;
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
.select-cards{
    width: 20%;
}.tishi{
        font-size: 13px;
        color: #B22222;
        display: none;
 }input[name=pay-pwd]{
       background: black;
        color: white;
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
    //支付
       $(function () {
           //默认显示
           var str = $("[name=select-cards]").val();
           checkMoney(str);
           //改变银行卡
           $("[name=select-cards]").change(function () {
               var str = $(this).val();
               checkMoney(str);

           });
       });
        //判断余额
        function checkMoney(str) {
            var arr = str.split(",");
            $(".card-name").text(arr[0]);
            $(".card-number").text(arr[1]);
            $(".card-money").text(arr[2]);
            var cardId = arr[4];
            var payPrice = parseInt($(".shiji-pay").text());
            var kardMoney = parseInt(arr[2]);
            $(".card-id").val(arr[3]);

            if((kardMoney-payPrice)<0){
                $(".tishi").show();
                $(".pay-btn").css("background","gray");
                return false;//不可以支付
            }else{
                $(".tishi").hide();
                $(".pay-btn").css("background","#59b7c2");
                return true;
            }
        }
        //提交支付
        function submitPay() {
            var str = $("[name=select-cards]").val();
            var flag = checkMoney(str);
            if(flag){
                $(".pay-window").show();
            }
        }
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
                var id = $(".card-id").val();
                location.href="${pageContext.request.contextPath}/order!paySuccess.action?id="+id+"&order.orderNumber=${order.orderNumber}";
            }
        }

    </script>
</head>
<body>
<!--支付窗口-->
<div class="pay-window">
    <%--用户实际密码--%>
    <input type="hidden" class="userPwd" value="${sessionScope.userInfo.password}">
   <span class="input-pwd"> 输入支付密码</span><br>
        <input  type="password" class="paypwd" name="pay-pwd" placeholder="默认为登录密码" maxlength="15"><br><br>
    <input style="cursor: pointer" type="button" onclick="submitPwd()" value="确定"/>&nbsp;&nbsp;
    <input type="button" style="cursor: pointer" onclick="closePayWindow()" value="取消"/>
</div>
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
                    <li><a href="${pageContext.request.contextPath}/collect!findUserAll">我的收藏</a></li>
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/cart!findMyCart.htm">我的购物车</a></li>
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
			<h1 class="page_title">我的收银台</h1>
		</div><!-- .grid_12 -->

		<div class="grid_9" id="checkout_info" style="width: 100%">
			<ul class="checkout_list">
				<li class="active">
					<div class="list_header">我的收银台 -- 中国大陆版<div class="number">1</div></div>
					<div class="list_body">
                   <span style="font-size: 12px;color: #4682B4">  您将使用&nbsp</span>
                        <select class="select-cards" name="select-cards">
                          <c:forEach items="${bankCards}" var="bc">
                              <option value="${bc.name},${bc.cardNumber},${bc.money},${bc.id}">${bc.name}</option>
                          </c:forEach>
                       </select>
                        <span style="font-size: 12px;color: #4682B4">&nbsp进行支付&nbsp;共需要支付${sessionScope.countPrice}元</span>
                        <div class="bank-card">
                            <%--银行卡ID--%>
                            <input type="hidden" value="" class="card-id">
                            <span class="card-name" style="color:gray">XXXXXXXXXXX</span>
                            <span>   储蓄卡 | 快捷</span>
                             <span class="card-number">XXXXXXXXXXXXX</span>
                                &nbsp; &nbsp;<br>
                              <span> 账户余额:</span>
                                <span class="card-money" style="color: #EE4000">XXXXX</span>
                               <span>(RMB)&nbsp;&nbsp;</span>
                            </div>
                        <div class="pay-win">
                            您共需要支付<span class="shiji-pay">${sessionScope.countPrice}</span>元&nbsp;
                            <span class="tishi">您的银行卡余额不足，请充值！</span>
                            <button class="pay-btn" onclick="submitPay()">立即支付</button>
                        </div>

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