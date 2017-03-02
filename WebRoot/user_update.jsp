<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                    <li class="curent"><a href="user_update.jsp">信息修改</a></li>
                    <li><a href="user_password.jsp">密码修改</a></li>
                    <li><a href="user_findAllAddress">收货地址管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/order!myOrder.action">我的订单</a></li>
                    <li><a href="collect!findUserAll">我的收藏</a></li>
                    <li><a href="${pageContext.request.contextPath}/cart!findMyCart.htm">购物车</a></li>
                    <li><a href="user_userBank">储蓄卡</a></li>
                </ul>
            </nav><!-- .primary -->
        </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
</div><!-- .block_nav_primary -->

<div class="clear"></div>

<section id="main" class="entire_width">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title">信息修改</h1>
            </div><!-- .grid_12 -->
            <div class="grid_6" style="padding-top: 50px;" >
                <div class="list" style="text-align: center">
                    <img src="${pageContext.request.contextPath}/upload/user/${userInfo.photoUrl}" width="100px" height="100px" style="border-radius: 5px;" >
                </div>

                <form action="user_userUpdatePhoto" method="post" enctype="multipart/form-data" style="text-align: center" onsubmit="return check()">
                    <input type="file" name="userPhoto" id="userPhoto" style="margin: 20px 0 20px 0">
                    <input type="submit" value="确定修改" style="margin: 0 auto;width: 200px;font-weight: bold">
                    <script>
                        function check() {
                            if($("#userPhoto").val() != ""){
                                return true;
                            }else{
                            alert("请选择图片");
                            return false;
                            }
                        }

                    </script>
                </form>
            </div>
            <div class="grid_6" >
                <form class="registed" action="user_userUpdate" method="post">
                    <input type="hidden" name="user.id" value="${userInfo.id}">
                    <div class="email">
                        <strong>用户名:</strong><sup class="surely">*</sup><br/>
                        <input type="text" name="user.userName" id="userName" class="" value="${userInfo.userName}" readonly  />
                    </div><!-- .email -->
                    <div class="email">
                        <strong>真实姓名:</strong><sup class="surely">*</sup><br/>
                        <input type="text" name="user.realName" id="realName" class="" value="${userInfo.realName}"   />
                    </div><!-- .email -->
                    <div class="email">
                        <strong>手机号:</strong><sup class="surely">*</sup><br/>
                        <input type="number"  style="width: 255px;height: 33px;padding-left: 10px;border: 1px solid #ccc" name="user.phone" id="phone" class="" value="${userInfo.phone}"   />
                    </div><!-- .email -->

                    <div class="email" style="margin-top: 10px;">
                        <strong>性别:</strong><sup class="surely">*</sup><br/>
                        <c:if test="${userInfo.sex != '女'}">
                            <input type="radio" name="user.sex" value="男" style="width: 15px;height: 15px;" class=""  checked /><label style="font-size: 16px"> 男</label>
                            <input type="radio" name="user.sex" value="女" style="width: 15px;height: 15px;" class=""   /><label style="font-size: 16px"> 女</label>
                        </c:if>
                        <c:if test="${userInfo.sex == '女'}">
                            <input type="radio" name="user.sex" value="男" style="width: 15px;height: 15px;" class=""   /><label style="font-size: 16px"> 男</label>
                            <input type="radio" name="user.sex" value="女" style="width: 15px;height: 15px;" class=""  checked /><label style="font-size: 16px"> 女</label>
                        </c:if>
                    </div><!-- .email -->

                    <div class="submit">
                        <input type="submit" value="确定修改" />
                    </div><!-- .submit -->
                </form><!-- .registed -->
            </div><!-- .grid_6 -->
        </div><!-- #content -->

        <div class="clear"></div>
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