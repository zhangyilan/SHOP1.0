<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<html>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>

  <title>注册</title>

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
                <h2 id="site_description">在线商店的主题</h2>
            </hgroup>
        </div><!-- .grid_3 -->

        <div class="grid_3">
            <form class="search">
            </form>
        </div><!-- .grid_3 -->

        <div class="grid_6">
            <nav class="private">
                <ul>
                    <li><a href="index.jsp">主页</a></li>
                    <li class="separator">|</li>
                    <li><a href="register.jsp">注册</a></li>
                    <li class="separator">|</li>
                    <li><a href="login.jsp">登录</a></li>
                </ul>
            </nav><!-- .private -->
        </div><!-- .grid_6 -->
    </header><!-- #branding -->
</div><!-- .container_12 -->

<div class="clear"></div>

  

  <div class="clear"></div>
  
  <section id="main" class="entire_width">
    <div class="container_12">      
       <div id="content">
		<div class="grid_12">
			<h1 class="page_title">Create an Account</h1>
		</div><!-- .grid_12 -->
           <div class="grid_6 new_customers">
               <h2>New Customers</h2>
               <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
               <div class="clear"></div>
               <button class="account">Create An Account</button>
           </div><!-- .grid_6 -->


           <div class="grid_6" >
			<form class="registed" action="user_userRegister"  onsubmit="return register()">
                <h2>New Customers</h2>
				<p>If you have an account with us, please <a href="login.jsp">login.</a></p>
				<div class="email">
					<strong>userName:</strong><sup class="surely">*</sup><br/>
					<input type="text" name="user.userName" id="userName" class="" value="" onblur="isNameExist()" />
                    <span class="forgot" id="nameIsExist"></span>
				</div><!-- .email -->
                <script>
                    function isNameExist() {
                        var name = $("#userName").val();
                        if(name == ""){
                            return false;
                        }
                        $.ajax({
                            url:"${pageContext.request.contextPath}/user_nameIsExist?name="+name,
                            success:function (data) {
                                if(data == 1){
                                    $("#nameIsExist").text("用户名已存在");
                                }else{
                                    $("#nameIsExist").text("用户名可以使用");
                                }
                            }
                        })
                    }
                    function register() {
                        if($("#userName").val() == "" || $("#password").val() == "" || $("#password1").val() == ""){
                            alert("请输入账号密码");
                            return false;
                        }
                        var name = $("#userName").val();
                        if(name == ""){
                            return false;
                        }
                        var data = $("form").serialize();
                        $.ajax({
                            url:"${pageContext.request.contextPath}/user_userRegister",
                            data:data,
                            success:function (data) {
                                if(data == 1){
                                    location.href = "login.jsp";
                                }else{
                                    alert("注册失败");
                                    return false;
                                }
                            }
                        })
                        return false;
                    }
                </script>
				<div class="password">
					<strong>Password:</strong><sup class="surely">*</sup><br/>
					<input type="password" id="password" style="width: 255px;height: 33px;padding-left: 10px;border: 1px solid #ccc" name="user.password"
                           class="" value="" />
				</div><!-- .password -->
                <div class="password">
                    <strong>Password again:</strong><sup class="surely">*</sup><br/>
                    <input type="password" id="password1" style="width: 255px;height: 33px;padding-left: 10px;border: 1px solid #ccc" name="" class="" value="" />
                </div><!-- .password -->
				<div class="submit">
					<input type="submit" value="Register" />
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
    
  </footer>
 
</body>
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
</html>