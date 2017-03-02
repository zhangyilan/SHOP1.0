<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

    <title>个人中心</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
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
                    <li class="separator">|</li>
                    <li><a href="${pageContext.request.contextPath}/cart!findMyCart.htm">我的购物车</a></li>
                </ul>
            </nav><!-- .private -->
        </div><!-- .grid_6 -->
    </header><!-- #branding -->
</div><!-- .container_12 -->

<div class="clear"></div>

<div id="block_nav_primary">
    <div class="container_12">
        <div class="grid_12">
            <nav class="primary">
                <ul>
                    <li ><a href="index.jsp">bigJD首页</a></li>
                    <li ><a href="user_info.jsp">个人信息</a></li>
                    <li><a href="user_update.jsp">信息修改</a></li>
                    <li><a href="user_password.jsp">密码修改</a></li>
                    <li class="curent"><a href="user_findAllAddress">收货地址管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/order!myOrder.action">我的订单</a></li>
                    <li><a href="collect!findUserAll">我的收藏</a></li>
                    <li><a href="${pageContext.request.contextPath}/cart!findMyCart.htm">购物车</a></li>
                    <li><a href="user_userBank">储蓄卡</a></li>
                </ul>
            </nav><!-- .primary -->
        </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
</div><!-- .block_nav_primary -->
<style>
    #addWin{z-index: 1000;position: fixed;top: 32%;left: 35%;background-color: white;box-shadow: 0 0 10px 1px #2ab4c4}
</style>
<div class="clear"></div>
<section id="main" class="entire_width">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title">收货地址管理</h1>
            </div><!-- .grid_12 -->

            <%--添加新地址/修改--%>
            <div class="grid_4" id="addWin" >
                <header id="title" style="position: absolute ; font-size: 16px;top: 10px;left: 10px;font-weight: bold;color: #ccc">添加新地址</header>
                <header style="font-size: 50px;font-weight: bolder; position: absolute;right: 5px;top: 8px;color: red;cursor: pointer" onclick="closeWin()" >×</header>
                <script>
                    $(function () {
                        $("#addWin").hide();
                    })
                    function closeWin() {
                        $("#addWin").slideUp(200);
                    }
                    function openWin() {
                        $("#title").text("新增");
                        $("#subValue").val("点击添加")
                        $("#actionOper").attr({action:"user_newUserAddress"});
                        $("#id").val("");
                        $("#address").val("");
                        $("#phone").val("");
                        $("#user").val("");
                        $("#addWin").slideDown(200);
                    }
                    function addressUpdate(data) {
                        $("#title").text("地址修改");
                        $("#subValue").val("点击修改")
                        $("#actionOper").attr({action:"user_updateUserAddress"});
                       var da = data.split("-");
                        $("#id").val(da[0]);
                        $("#address").val(da[1]);
                        $("#phone").val(da[2]);
                        $("#user").val(da[3]);
                        $("#addWin").slideDown(200);
                        return false;
                    }
                </script>
                <form class="registed" id="actionOper" action="user_newUserAddress" >
                    <input type="hidden" name="address.id" id="id" value="">
                    <div class="email">
                        <strong>地址:</strong><sup class="surely">*</sup><br/>
                        <input type="text" name="address.name" value="" id="address" class="" />
                    </div><!-- .email -->
                    <div class="email">
                        <strong>收货手机号:</strong><sup class="surely">*</sup><br/>
                        <input type="number" style="width: 255px;height: 33px;padding-left: 10px;border: 1px solid #ccc" name="address.tell" value="" id="phone" class="" />
                    </div><!-- .email -->
                    <div class="email">
                        <strong>收货人:</strong><sup class="surely">*</sup><br/>
                        <input type="text" name="address.receipt" value="" id="user" class="" />
                    </div><!-- .email -->
                    <div class="submit">
                        <input type="submit" id="subValue" value="点击添加" style="float: left" />
                    </div><!-- .submit -->
                </form><!-- .registed -->
            </div >
          <%--地址--%>
            <c:forEach var="address" items="${sessionScope.addresss}">
                <div class="grid_4" >
                    <form class="registed"  onsubmit='return addressUpdate("${address.id}-${address.name}-${address.tell}-${address.receipt}")'>
                        <a href="user_deleteUserAddress?address.id=${address.id}" onclick="deleteAddress(${address.id})" style="text-decoration: none;cursor: pointer;font-size: 40px;color: #ccc;position: absolute;margin: -15px 0 0 260px;">×</a>
                        <input type="hidden" name="id" value="${address.id}">
                        <div class="email">
                        <strong>地址:</strong><sup class="surely">*</sup><br/>
                        <input type="text" name="name" value="${address.name}" class="" />
                    </div><!-- .email -->
                        <div class="email">
                            <strong>收货手机号:</strong><sup class="surely">*</sup><br/>
                            <input type="text" name="name" value="${address.tell}"  class="" />
                        </div><!-- .email -->
                        <div class="email">
                            <strong>收货人:</strong><sup class="surely">*</sup><br/>
                            <input type="text" name="name" value="${address.receipt}" class="" />
                        </div><!-- .email -->
                        <div class="submit">
                            <input type="submit" value="点击修改" style="float: left" />
                        </div><!-- .submit -->

                    </form><!-- .registed -->
                </div><!-- .grid_6 -->
            </c:forEach>
            <%--//添加按钮--%>
            <div class="grid_4" >
                <form onclick="openWin()" class="registed" style="cursor: pointer;font-size: 300px;height: 320px;width: 260px;text-align: center;box-sizing: border-box;line-height: 200px;color: #e9e9e9" >
                    +
                </form><!-- .registed -->
            </div><!-- .grid_6 -->
        </div><!-- #content -->

        <div class="clear"></div>
    </div><!-- .container_12 -->
</section><!-- #main -->

<div class="clear"></div>

</body>
</html>