<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
 

  <title>Product view</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/jquery.jqzoom.css" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <script src="js/checkbox.js"></script>
  <script src="js/radio.js"></script>
  <script src="js/selectBox.js"></script>
  <script src="js/jquery.jqzoom-core.js" ></script>

  <script>
	$(document).ready(function() {
		$('.jqzoom').jqzoom({
			zoomType: 'standard',
			lens:true,
			preloadImages: true,
			alwaysOn:false
		});
	});
  </script>

  <script>
	$(document).ready(function() {
		$("select").selectBox();
	});
  </script>

  <script>
	$(document).ready(function() {
		$('#wrapper_tab a').click(function() {
			if ($(this).attr('class') != $('#wrapper_tab').attr('class') ) {
				$('#wrapper_tab').attr('class',$(this).attr('class'));
			}
			return false;
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
          $('#list_banners').carouFredSel({
		prev: '#ban_prev',
		next: '#ban_next',
		scroll: 1,
		auto: false
	  });
	  $('#thumblist').carouFredSel({
		prev: '#img_prev',
		next: '#img_next',
		scroll: 1,
		auto: false,
		circular: false,
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
	<header id="branding">
		<div class="grid_3">
			<hgroup>
				<h1 id="site_logo" ><a href="index.jsp" title=""><img src="images/logo.png" alt="Online Store Theme Logo"/></a></h1>
				<h2 id="site_description">在线商店的主题</h2>
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
						<li class="separator">|</li>
						<li><a href="collect!findUserAll">我的收藏</a></li>
							<li class="separator">|</li>
							<li><a href="${pageContext.request.contextPath}/cart!findMyCart.htm">我的购物车</a></li>
					</c:if>
					<c:if test="${empty userInfo}">
						<li> <a href="login.jsp">登录</a></li>
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
					<li class="curent"><a href="index.jsp">主页</a></li>
					<c:forEach var="data" items="${sessionScope.categoryProducts}">
						<li><a href="product_thirdCategoryAndProduct?id=${data.id}">${data.name}</a></li>
					</c:forEach>
				</ul>
			</nav><!-- .primary -->
		</div><!-- .grid_12 -->
	</div><!-- .container_12 -->
</div><!-- .block_nav_primary -->

  <div class="clear"></div>


  <section id="main">
    <div class="container_12">
       <div id="content" class="grid_12">
	      <h1 class="page_title">${product.name}</h1>
		<div class="product_page">
			<div class="grid_4 img_slid" id="products">
				<img class="sale" src="images/sale.png" alt="Sale"/>
				<div class="preview slides_container">
					<div class="prev_bg">
						<c:forEach var="data" items="${product.imgs}" varStatus="index">
							<c:if test="${index.index == 0}">
								<a href="${pageContext.request.contextPath}/upload/product/${data.url}" class="jqzoom" rel='gal1' title="">
									<img src="${pageContext.request.contextPath}/upload/product/${data.url}"  title="" alt=""/>
								</a>
							</c:if>
						</c:forEach>

					</div>
				</div><!-- .prev -->
				<ul class="pagination clearfix" id="thumblist">
					<c:forEach var="data" items="${product.imgs}" varStatus="index">
						<li><a href='javascript:void(0);'
							   rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/upload/product/${data.url}',
						   largeimage:'${pageContext.request.contextPath}/upload/product/${data.url}'}">
							<img src='${pageContext.request.contextPath}/upload/product/${data.url}' alt=""></a></li>
					</c:forEach>
				</ul>
				<div class="next_prev">
					<a id="img_prev" class="arows" href="#"><span>Prev</span></a>
					<a id="img_next" class="arows" href="#"><span>Next</span></a>
				</div><!-- . -->
			</div><!-- .grid_4 -->
			<div class="grid_5">
				<div class="entry_content">
					<p>${product.info}</p>
					<div class="ava_price">
						<div class="price">
							<div class="price_new">$${product.barginPrice}</div>
							<div class="price_old">$${product.oldPrice}</div>
						</div><!-- .price -->
					</div><!-- .ava_price -->

					<div class="block_cart">
						<div class="cart">
							<a href="javascript:void(0);" class="bay" onclick="subCart()">添加购物车</a>
							<input type="text" name="" id="number" class="number" value="1" style="text-align: center;width: 50px;" />
							<span>数量:</span>
						</div>
						<script>
							function subCart() {
								var id = ${product.id};
								var number = $("#number").val();
								var barginPrice = ${product.barginPrice};
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
						<div class="clear"></div>
					</div><!-- .block_cart -->
				</div><!-- .entry_content -->

			</div><!-- .grid_5 -->
			</div><!-- .carousel -->
		</div><!-- .product_page -->
		<div class="clear"></div>

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
