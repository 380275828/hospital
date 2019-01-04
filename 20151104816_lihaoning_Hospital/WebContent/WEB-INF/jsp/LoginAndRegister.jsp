<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户登录注册</title>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	  <link rel="stylesheet" href="css/jigsaw.css">
	  <style>
	  	
	  	  #msg {
      width: 100%;
      line-height: 40px;
      font-size: 14px;
      text-align: center;
    }
	  </style>
	  
	  <script>
	  function sub(){
		  document.getElementById("form").submit();
	  }
	  
	  
	  
	  function $(id){
		           return document.getElementById(id)
		         }
		  
		        function check(){
		           var boo=$('user_pass1').value==$('user_pass2').value;
		            if (boo) {
		                 return true;
		           }else{
	               alert('用户名密码错误')
		           }
	 
		        }
	  
</script>
	  
</head>
<body>
	<div class="jq22-container" style="padding-top:100px">
		<div class="login-wrap">
			<div class="login-html">
				<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">登陆</label>
				<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">注册</label>
				<div class="login-form">
					<form id="form" action="LoginController" method="post">
					<div class="sign-in-htm">
						<div class="group">
							<label for="user" class="label">账号</label>
							<input id="User_Iphone" name="User_Iphone" placeholder="手机号" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="User_Password" type="password" class="input" name="User_Password">
						</div>
						<div class="group">
							<div class="container">
							    <div id="captcha" style="position: relative"  ></div>
								<div id="msg"></div>
							</div>
						</div>
						<div class="group">
							<input id="check" type="checkbox" class="check" checked>
							<label for="check"><span class="icon"></span>保持登陆</label>
						</div>						
						<div class="group">
							<input type="button" class="button" value="登陆" onClick="sub() ">
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<a href="index">首页</a><br/>
							<br/>
							<a href="#forgot">忘记密码?</a>
						</div>
					</div>
					</form>
					<form action="RegisterController" method="post">
					<div class="sign-up-htm">
						<div class="group">
							<label for="user" class="label">用户名</label>
							<input id="User_Name" name="User_Name" type="text" class="input">
						</div>
						<div class="group">
							<label for="pass" class="label">密码</label>
							<input id="User_Password" name="User_Password"type="password" class="input" class="onlyNumAlpha" >
						</div>
						<div class="group">
							<label for="pass" class="label">重复密码</label>
							<input id="User_Password1" name="User_Password1" type="password" class="input"  onblur="check()"class="onlyNumAlpha" >
						</div>
						<div class="group">
							<label for="pass" class="label">手机号</label>
							<input id="User_Iphone" name="User_Iphone" type="text" class="input">
						</div>
						<div class="group">
							<a href="index.html"><input type="submit" class="button" value="注册"></a>
						</div>
						<div class="hr"></div>
						<div class="foot-lnk">
							<label for="tab-1">已注册?</label>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>	
	<script src="js/jigsaw.js"></script>

</body>
</html>