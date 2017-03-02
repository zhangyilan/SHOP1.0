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
    </header><!-- #branding -->
</div><!-- .container_12 -->

<div class="clear"></div>

<section id="main" class="entire_width">
    <div class="container_12">
        <div id="content">
            <div class="grid_12">
                <h1 class="page_title">商品新增</h1>
            </div><!-- .grid_12 -->
            <form  action="product_newProduct" method="post" enctype="multipart/form-data">
            <div  class="grid_6 registed" style="padding-top: 50px;" >
                <div class="list">
                    <label>商品名：</label>
                    <input type="text" name="product.name" >
                </div>
                <div class="list">
                    <label>原价：</label>
                    <input type="number" style="width: 255px;height: 33px;padding-left: 10px;border: 1px solid #ccc;margin: 10px 0 10px 0" name="product.oldPrice">
                </div>
                <div class="list">
                    <label>促销价：</label>
                    <input type="number" style="width: 255px;height: 33px;padding-left: 10px;border: 1px solid #ccc" name="product.barginPrice">
                </div>
                <div class="list">
                    <label>详情：</label><br>
                    <textarea  name="product.info"  style="width: 300px;height: 100px"></textarea>
                </div>
                <div class="list" style="margin-top: 20px;">
                    <label>类别：</label>
                    <select name="categoryId">
                    <c:forEach var="data" items="${categoryProducts}">
                            <option  value="${data.id}"> ${data.name}</option>
                    </c:forEach>
                    </select>

                </div>
            </div><!-- .grid_6 -->
                <div class="grid_6" style="padding-top: 50px;" >
                    <div class="list" id="fileBox" style="text-align: center">
                       图片： <input type="file" name="file" onchange="addFile()"><br>
                    </div>
                </div>
                <script>
                    function addFile() {
                        var data = '图片： <input type="file" name="file" onchange="addFile()" style="margin: 5px 0 5px 0"><br>';
                        $("#fileBox").append(data);
                    }
                </script>
                <div class="grid_12" style="margin-top: 20px;">
                    <input width="500px;" type="submit" value="                              新增                                " />
                </div><!-- .grid_12 -->
             </form>
        </div><!-- #content -->

        <div class="clear"></div>
    </div><!-- .container_12 -->
</section><!-- #main -->

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