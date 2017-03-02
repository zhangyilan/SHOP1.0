<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/><!-- /Added by HTTrack -->
<head>


    <title>商品列表</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
    <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">

    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/html5.js"></script>
    <script src="js/jflow.plus.js"></script>
    <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
    <script src="js/checkbox.js"></script>
    <script src="js/radio.js"></script>
    <script src="js/selectBox.js"></script>

    <script>
        $(document).ready(function () {
            $("select").selectBox();
        });
    </script>

    <script>
        $(document).ready(function () {
            $("#myController").jFlow({
                controller: ".control", // must be class, use . sign
                slideWrapper: "#jFlowSlider", // must be id, use # sign
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
        $(function () {
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
            $(window).resize();
        });
    </script>
    <script>
        $(document).ready(function () {
            $("button").click(function () {
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
                <h1 id="site_logo"><a href="index.jsp" title=""><img src="images/logo.png"
                                                                     alt="Online Store Theme Logo"/></a></h1>
                <h2 id="site_description">Online Store Theme</h2>
            </hgroup>
        </div><!-- .grid_3 -->

        <div class="grid_3">
            <form class="search">
                <input type="text" name="search" class="entry_form" value="" placeholder="Search entire store here..."/>
            </form>
        </div><!-- .grid_3 -->

        <div class="grid_6">
            <c:if test="${not empty userInfo}">
                <ul id="cart_nav">
                    <li>
                        <a class="cart_li" href="#">车 <span>$0.00</span></a>
                        <ul class="cart_cont">
                            <li class="no_border"><p>最进添加的菜单</p></li>
                            <li>
                                <a href="product_page.jsp" class="prev_cart">
                                    <div class="cart_vert"><img src="images/cart_img.png" alt="" title=""/></div>
                                </a>
                                <div class="cont_cart">
                                    <h4>汽车喷雾</h4>
                                    <div class="price">1 x $399.00</div>
                                </div>
                                <a title="close" class="close" href="#"></a>
                                <div class="clear"></div>
                            </li>

                            <li>
                                <a href="product_page.jsp" class="prev_cart">
                                    <div class="cart_vert"><img src="images/produkt_slid1.png" alt="" title=""/></div>
                                </a>
                                <div class="cont_cart">
                                    <h4>汽车喷雾</h4>
                                    <div class="price">1 x $399.00</div>
                                </div>
                                <a title="close" class="close" href="#"></a>
                                <div class="clear"></div>
                            </li>
                            <li class="no_border">
                                <a href="shopping_cart.jsp" class="view_cart">查看购物车</a>
                                <a href="checkout.jsp" class="checkout">Procced to Checkout</a>
                            </li>
                        </ul>
                    </li>
                </ul>

            </c:if>

            <nav class="private">
                <ul>
                    <c:if test="${not empty userInfo}">
                        <li><a href="user_info.jsp">${userInfo.userName}</a></li>
                        <li class="separator">|</li>
                        <li><a href="user_userLogout">注销</a></li>
                        <li class="separator">|</li>
                        <li><a href="collect!findUserAll">我的收藏</a></li>
                    </c:if>
                    <c:if test="${empty userInfo}">
                        <li><a href="login.jsp">登录</a></li>
                        <li class="separator">|</li>
                        <li><a href="register.jsp">注册</a></li>
                    </c:if>
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
                    <c:choose>
                        <c:when test="${secondId == 0}">
                            <li class="curent"><a href="index.jsp">主页</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="index.jsp">主页</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach var="data" items="${sessionScope.categoryProducts}">
                        <c:choose>
                            <c:when test="${secondId == data.id}">
                                <li class="curent"><a
                                        href="product_thirdCategoryAndProduct?id=${data.id}">${data.name}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="product_thirdCategoryAndProduct?id=${data.id}">${data.name}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav><!-- .primary -->
        </div><!-- .grid_12 -->
    </div><!-- .container_12 -->
</div><!-- .block_nav_primary -->

<div class="clear"></div>


<div class="clear"></div>

<section id="main">
    <div class="container_12">
        <%--<div id="sidebar" class="grid_3">--%>
        <%--<aside id="categories_nav">--%>
        <%--<h3>分类</h3>--%>
        <%----%>
        <%--<nav class="left_menu">--%>
        <%--<ul>--%>
        <%--<li class="current"><a href="product_thirdCategoryProduct?id=0">全部</a></li>--%>
        <%--<c:forEach var="data" items="${sessionScope.thirdcategoryProducts}">--%>
        <%--<c:choose>--%>
        <%--<c:when test="${thirdId == data.id}">--%>
        <%--<li class="current"><a href="product_thirdCategoryProduct?id=${data.id}">${data.name}</a></li>--%>
        <%--</c:when>--%>
        <%--<c:otherwise>--%>
        <%--<li ><a href="product_thirdCategoryProduct?id=${data.id}">${data.name}</a></li>--%>
        <%--</c:otherwise>--%>
        <%--</c:choose>--%>
        <%--</c:forEach>--%>
        <%--</ul>--%>
        <%--</nav><!-- .left_menu -->--%>
        <%--</aside><!-- #categories_nav -->--%>
        <%--</div><!-- .sidebar -->--%>

        <div id="content" class="grid_12">
            <h1 class="page_title">商品列表</h1>
            <div class="grid_product grid_12">
                <c:if test="${ empty productList}">
                    <h3>沒有搜索到商品！请更换关键字再试...</h3>
                </c:if>
                <c:forEach var="data" items="${productList}" varStatus="index">
                    <div class="grid_3 product" style="float: left;margin: 5px;">
                        <div class="prev">
                            <a href="product_detail?id=${data.id}">
                                    <%--//${data.imgs[0].url}--%>
                                <c:forEach var="d" items="${data.imgs}" varStatus="index">
                                    <c:if test="${index.index == 0}">
                                        <img src="${pageContext.request.contextPath}/upload/product/${d.url}" alt=""
                                             title=""/>
                                    </c:if>
                                </c:forEach>
                            </a>
                        </div><!-- .prev -->
                        <h3 class="title">${data.name}</h3>
                        <div class="cart">
                            <div class="price">
                                <div class="vert">
                                    <div class="price_new">$${data.barginPrice}</div>
                                    <div class="price_old">$${data.oldPrice}</div>
                                </div>
                            </div>
                            <a href="javascript:void(0)" onclick="" class="obn"></a>
                            <a href="javascript:void(0)" onclick="collect('${data.id}')" class="like"></a>
                            <a href="javascript:void(0)" onclick="subCart('${data.id}','${data.barginPrice}')"
                               class="bay"></a>
                        </div><!-- .cart -->
                    </div>
                    <!-- .grid_3 -->
                </c:forEach>
                <script>
                    function collect(id) {
                        var pid = id;
                        var uid = ${userInfo.id};
                        $.ajax({
                            url: "collect!addCollect?product.id=" + pid + "&user.id=" + uid,
                            success: function (data) {
                                if (data == 0) {
                                    alert("添加购收藏成功");
                                }
                            }

                        })
                    }
                    function subCart(id, barginPrice) {
                        var id = id;
                        var number = 1;
                        var barginPrice = barginPrice;
                        $.ajax({
                            url: "cart!add.action?product.id=" + id + "&number=" + number + "&product.barginPrice=" + barginPrice,
                            success: function (data) {
                                if (data == 0) {
                                    alert("添加购物车成功");
                                }
                            }

                        })
                    }
                </script>

                <div class="clear"></div>
            </div><!-- .grid_product -->
            <div class="clear"></div>

            <div class="pagination">
                <ul>
                    <c:choose>
                        <c:when test="${pageUtil.currentPage - 1 > 0}">
                            <li class="prev"><a href="product_nextPage?id=${secondId}&index=${pageUtil.currentPage -1}">
                                &#8592;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="prev"><a href="javascript:void(0);">&#8592;</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li><a href="product_nextPage?id=${secondId}&index=1"><<</a></li>
                    <li class="curent"><a href="product_nextPage?id=${secondId}&index=${i}">${pageUtil.currentPage}</a>
                    </li>
                    <li><a href="product_nextPage?id=${secondId}&index=${pageUtil.totalPage}">>></a></li>
                    <c:choose>
                        <c:when test="${pageUtil.currentPage != pageUtil.totalPage}">
                            <li class="next"><a href="product_nextPage?id=${secondId}&index=${pageUtil.currentPage+1}">
                                &#8594;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="prev"><a href="javascript:void(0);">&#8594;</a></li>
                        </c:otherwise>
                    </c:choose>
                    <li>总页数:${pageUtil.totalPage}</li>
                </ul>
            </div><!-- .pagination -->
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
                        <li><a href="contact_us.jsp">Contact As</a></li>
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
                <p class="copyright">© Breeze Store Theme, 2013. Collect from <a href="http://www.cssmoban.com/"
                                                                                 title="网页模板" target="_blank">网页模板</a> -
                    More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a></p>
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
<!-- Added by HTTrack -->
<meta http-equiv="content-type" content="text/html;charset=utf-8"/><!-- /Added by HTTrack -->
</html>