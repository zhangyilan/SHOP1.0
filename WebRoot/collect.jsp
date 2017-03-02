<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>

    <title>个人收藏</title>


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
        .collects{
            list-style: none;
            margin-left: 20px;

        }
        .collect_list{
            float: left;
            margin-bottom: 30px;
        }
        .collect_innerBox{
            margin: 0 4px;
        }
        .delete-collect img{
            position: relative;
            left: 100px;
            top: 10px;
            width: 20px;
            height: 20px;
        }
        .collect-msg{
            position: relative;
            top: 20px;
            left: 300px;
            color: #1d8d9b;
        }
        .add-collect-msg{
            width: 150px;
            height: 50px;
            background-color:rgba(29,141,155,0.7);
            position:fixed; /*绝对定位*/
            top:50%; /*距顶部50%*/
            left:50%;
            margin:-25px 0 0 -75px;
            display: none;
            z-index: 999;
            font-size: 15px;
            text-align: center;
        }
        .add-collect-msg a{
            color: white;
            text-decoration: none;
            line-height: 50px;
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
                $(this).addClass('click');
            });
            var collectListIsNull = function () {
                var a =  $(".collects").find("div").length;

                if(a==0){
                    $(".collects").append("<h2 class='collect-msg'>没有收藏啦，快去添加吧！<h2>")
                }
            }
            //删除收藏
            $(".delete-collect").click(function () {
                var r = confirm("您确定要删除吗？");
                if(r){
                    var url = "${pageContext.request.contextPath}/collect!deleteCollect.action?collect.id="+$(this).attr("data-id");
                    $.post(url);
                    $(this).parent().parent().remove();
                    collectListIsNull();
                }
            });
            var url="${pageContext.request.contextPath}/footprint!getFootPrint.action?user.id=${sessionScope.user.id}";
            $.post(url);
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
                    <li><a href="user_findAllAddress">收货地址管理</a></li>
                    <li><a href="${pageContext.request.contextPath}/order!myOrder.action">我的订单</a></li>
                    <li class="curent"><a href="collect!findUserAll">我的收藏</a></li>
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
        <div class="grid_12">
            <h1 class="page_title">收藏</h1>

            <ul class="collects" style="margin-top: 50px;">
                <c:if test="${ empty requestScope.userCollects }">
                <h2 style="color: #1d8d9b">没有收藏，快去添加吧！</h2>
                </c:if>
                <c:forEach var="collect" items="${requestScope.userCollects}">
                <li class="collect_list">
                    <div class="grid_3 product collect_innerBox ">
                        <img class="sale" src="images/sale.png" alt="Sale"/>
                        <div class="prev">
                            <c:forEach var="data" items="${collect.product.imgs}" varStatus="index">
                                <c:if test="${index.index == 0}">
                                    <a href="product_detail?id=${data.id}">
                                        <img src="${pageContext.request.contextPath}/upload/product/${data.url}" alt="" title="" />
                                    </a>
                                </c:if>
                            </c:forEach>
                        </div><!-- .prev -->
                        <h3 class="title">商品名:<br>${collect.product.name}</h3>
                        <div class="cart">
                            <div class="price">
                                <div class="vert">
                                    <div class="price_new">现价:${collect.product.barginPrice}</div>
                                    <div class="price_old">原价：${collect.product.oldPrice}</div>
                                </div>
                            </div>
                            <a class="delete-collect" data-id="${collect.id}" ><img src="images/delete.png"></a>
                        </div><!-- .cart -->
                    </div><!-- .grid_3 -->
                    </c:forEach>
        </div><!-- .grid_12 -->
        </li>

        </ul>


        <div class="clear"></div>

        <div class="clear"></div>

        <div class="carousel" id="following">
            <div class="c_header">
                <div class="grid_10">
                    <h5>猜你喜欢:</h5>
                    <div class="add-collect-msg">
                        <a>已经是您的收藏啦！</a>
                    </div>
                </div><!-- .grid_10 -->

                <div class="grid_2">
                    <a id="next_c1" class="next arows" href="#"><span>Next</span></a>
                    <a id="prev_c1" class="prev arows" href="#"><span>Prev</span></a>
                </div><!-- .grid_2 -->
            </div><!-- .c_header -->

            <div class="list_carousel">

                <ul id="list_product" class="list_product">
                    <c:forEach var="footPrint" items="${sessionScope.userFootPrint}">
                        <li class="">
                            <div class="grid_3 product">
                                <img class="sale" src="images/sale.png" alt="Sale"/>
                                <div class="prev">
                                    <c:forEach var="data" items="${footPrint.product.imgs}" varStatus="index">
                                        <c:if test="${index.index == 0}">
                                            <a href="product_detail?id=${data.id}">
                                                <img src="${pageContext.request.contextPath}/upload/product/${data.url}" alt="" title="" />
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                </div><!-- .prev -->
                                <h3 class="title">商品名:${footPrint.product.name}</h3>
                                <div class="cart">
                                    <div class="price">
                                        <div class="vert">
                                            <div class="price_new">现价：${footPrint.product.barginPrice}</div>
                                            <div class="price_old">原价:${footPrint .product.oldPrice}</div>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0)" onclick="" class="obn"></a>
                                    <a href="javascript:void(0)" onclick="collect('${footPrint.product.id}')" class="like"></a>
                                    <a href="javascript:void(0)" onclick="subCart('${footPrint.product.id}','${footPrint.product.barginPrice}')" class="bay"></a>
                                </div><!-- .cart -->
                            </div><!-- .grid_3 -->
                        </li>
                    </c:forEach>
                    <script>
                        function collect(id) {
                            var pid = id;
                            var uid = ${userInfo.id};
                            $.ajax({
                                url:"collect!addCollect?product.id="+pid+"&user.id="+uid,
                                success:function (data) {
                                    if(data == 0){
                                        alert("添加购收藏成功");
                                    }else{
                                        if(!$(".add-collect-msg").is(':animated')) {
                                            $(".add-collect-msg").fadeIn().fadeOut(2000);
                                        }
                                    }
                                }

                            })
                        }
                        function subCart(id,barginPrice) {
                            var id = id;
                            var number = 1;
                            var barginPrice = barginPrice;
                            $.ajax({
                                url:"cart!add.action?product.id="+id+"&number="+number+"&product.barginPrice="+barginPrice,
                                success:function (data) {
                                    if(data == 0){
                                        alert("添加购物车成功");
                                    }
                                }

                            })
                        }
                    </script>
                </ul><!-- #list_product -->
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
