<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="style/login_style.css?ver=2" type="text/css" rel="stylesheet">
    <title>Login</title>
</head>
<body>
    <div id="login_box">
        <a href="index.jsp" id="logo"><img src="imgs/logo.png" alt="logo"></a>
        <form name="loginBox" method="post" action="login_check.jsp">
            <input name="id" type="text" placeholder="id"><br/>
            <input name="pwd" type="password" placeholder="pwd"><br/>
            <input class="btns" type="button" onclick="loginCheck()" value="login">
        </form>
        <button class="btns" id="btn">sign up</button>
    </div>

    <div id="sign_box">
        <a href="index.jsp" id="logo"><img src="imgs/logo.png" alt="logo"></a>
        <form name="signBox" method="post" action="sign_check.jsp">
            <input name="id" type="text" placeholder="id"><br/>
            <input name="pwd" type="password" placeholder="pwd"><br/>
            <input name="pwdCh" type="password" placeholder="pwd check"><br/>
            <input name="name" type="text" placeholder="name"><br/>
            <input name="email" type="text" placeholder="email"><br/>
            <input class="btns" type="button" value="sign up" onclick="signCheck()">
        </form>
    </div>
    <script>
        var sign = document.getElementById("btn");
        sign.addEventListener("click", function(){
            var signbox = document.getElementById("sign_box");
            var loginbox = document.getElementById("login_box");
            signbox.style.marginTop = "-39%";
            signbox.style.opacity = "100%"
            loginbox.style.marginTop =  "30%";
            loginbox.style.opacity = "0%";      
        });
        
        
        function loginCheck(){
        	if(document.loginBox.id.value == ""){
        		alert("???????????? ??????????????????");
        		return;
        	}
        	if(document.loginBox.pwd.value == ""){
        		alert("??????????????? ??????????????????");
        		return;
        	}
        	document.loginBox.submit();
        }
        
        function signCheck(){
    		if(document.signBox.id.value == ""){
    			alert('???????????? ??????????????????.');
    			return;
    		}
    		if(document.signBox.pwd.value == ""){
    			alert('??????????????? ??????????????????.');
    			return;
    		}
    		if(document.signBox.name.value == ""){
    			alert('????????? ??????????????????.');
    			return;
    		}
    		if(document.signBox.email.value == ""){
    			alert('???????????? ??????????????????.');
    			return;
    		}
    		if(document.signBox.pwd.value != document.signBox.pwdCh.value){
    			alert('??????????????? ???????????? ????????????.');
    			return;
    		}
    		
    		var email = document.signBox.email.value;
    		if(email.indexOf("@") < 4 || email.indexOf(".") < email.indexOf("@")
    				|| email.split('.').length - 1 > 1){
    			alert("????????? ????????? ???????????????.");
    			return;
    		}
    		alert("???????????? ??????!");
    		document.signBox.submit();
    	}
    </script>
</body>
</html>