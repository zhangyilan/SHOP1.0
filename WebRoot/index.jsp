<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>

  <title>主页</title>

  <link rel="shortcut icon" href="favicon.ico">
  <link href="css/style.css" media="screen" rel="stylesheet" type="text/css">
  <link href="css/grid.css" media="screen" rel="stylesheet" type="text/css">

  <script src="js/jquery-1.7.2.min.js" ></script>
  <script src="js/html5.js" ></script>
  <script src="js/jflow.plus.js" ></script>
  <script src="js/jquery.carouFredSel-5.2.2-packed.js"></script>
  <style>
    .query-results{
      width: 300px;
      height: auto;
      background-color: #19ACBA;
      position: absolute;
      z-index: 999;
      font-size: 17px;
    }
    .resultCss{
      background-color: white;
      border: 1px solid #1d8d9b;
    }
    .results-list li a{
      text-decoration: none;
      color: #22666B;
    }
    #search-input{
      width: 300px;
      height: 40px;
      font-size: 20px;
      margin: 10px 0 auto;
    }
    .mousecss{
      background-color: white;
      border: 1px solid #1d8d9b;
    }
  </style>
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
      $(window).resize();
    });

  </script>
  <script>
    $(document).ready(function(){
      $("button").click(function(){
        $(this).addClass('click')
      });
      //
      /**
       * 搜索提示功能
       */
      //当前li
      var Record=0;
      var id = 0;
      $("#search-input").keyup(function (event){

        var keyNumber = event.keyCode;

        if(keyNumber==13){
          var keywords = $("#search-input").val();
          location.href="${pageContext.request.contextPath}/keyword!keywordFindProducts.action?name="+keywords;
        }
        if(keyNumber!=38 && keyNumber!=40){
          var str = $(this).val();
          //ajax提交
          var url =" ${pageContext.request.contextPath}/keyword!fuzzyQuery.action?name="+str;
          $(".results-list").text("");
          $.post(url,function (data)
          {
            for(var x=0;x<data.length;x++){
              var dataStr = data[x][1].substring(0,10);
              var result = "<li name="+data[x][0]+"><a >"+dataStr+"</a></li>";
              $(".results-list").append(result)
            }
          })
        }
        //li的个数
        var a =  $(".results-list li").length
        //按下下键
        if(keyNumber==40){
          Record++;
          if( Record == a){
            Record=0;
          }
        }
        //按下上键
        else if(keyNumber==38){
          if(Record == 0){
            Record = a;
          }
          Record--;
        }
        var ulChild =  $(".results-list").children()[Record];  //得到当前li
        var ulChildStr = ulChild.innerText;      //当前li里面的内容
        id = $(".results-list > li").eq(Record).attr("name");
        /*  $("#action").attr({action:"${pageContext.request.contextPath}/product_detail?id="+id+""});*/
        $("#search-input").val(id);
        $("#search-input").val(ulChildStr);      //将li里面的内容放入搜索框
        $(".results-list > li").removeClass("resultCss");
        $(".results-list > li").eq(Record).addClass("resultCss");

      })


    })




  </script>

</head>
<body>


<div class="container_12">
  <header id="branding">
    <div class="grid_3">
      <hgroup>
        <h1 id="site_logo" ><a href="index.jsp" title=""><img src="images/logo.png" alt="Online Store Theme Logo"/></a></h1>
        <h2 id="site_description">电器城</h2>
      </hgroup>

    </div><!-- .grid_3 -->
    <div class="grid_3">
      <input  type="text" name="id"  class="entry_form" id="search-input" value="" autocomplete="off" placeholder="搜索整个商店"/>
      <!--搜索提示框-->
      <div class="query-results">
        <ul class="results-list">

        </ul>
      </div>
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
          <c:forEach var="data" items="${sessionScope.categoryProducts}">
            <li><a href="product_thirdCategoryAndProduct?id=${data.id}">${data.name}</a></li>
          </c:forEach>
        </ul>
      </nav><!-- .primary -->
    </div><!-- .grid_12 -->
  </div><!-- .container_12 -->
</div><!-- .block_nav_primary -->

<div class="clear"></div>

<div class="container_12">
  <div class="grid_12">
    <div class="slidprev"><span>Prev</span></div>
    <div class="slidnext"><span>Next</span></div>
    <div id="slider">
      <div id="slide1">
        <img src="images/content/slide1.jpg" alt="" title="" />
        <div class="slid_text">
          <h3 class="slid_title"><span>Breeze Theme</span></h3>
          <p><span>Breeze is the 14 stylish jsp templates,</span></p>
          <p><span>which will helps you boost sales</span></p>
          <p><span>and receive good feedback from your clients.</span></p>
        </div>
      </div>

      <div id="slide2">
        <img src="images/content/slide2.jpg" alt="" title="" />
        <div class="slid_text">
          <h3 class="slid_title"><span>Flexibility</span></h3>
          <p><span>Every product, which you are selling,</span></p>
          <p><span>will look great with Breeze theme.</span></p>
        </div>
      </div>

      <div id="slide3">
        <img src="images/content/slide3.jpg" alt="" title="" />
        <div class="slid_text">
          <h3 class="slid_title"><span>Accuracy and Easiness</span></h3>
          <p><span>Breeze design is mere and accurate,</span></p>
          <p><span>so it will satisfy everybody.</span></p>
        </div>
      </div>
    </div><!-- .slider -->
    <div id="myController">
      <div class="control"><span>1</span></div>
      <div class="control"><span>2</span></div>
      <div class="control"><span>3</span></div>
    </div>


  </div><!-- .grid_12 -->
</div><!-- .container_12 -->
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >电器城</a></div>
<div class="clear"></div>


</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>
