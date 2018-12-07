<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'messagelogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="${css}/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${js}/jquery-2.0.0.min.js"></script>
    <script language="javascript">
    	$(function(){
        $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    	$(window).resize(function(){  
        $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
        })  
            
            
             $("form :input.required").each(function () {
        //通过jquery api：$("HTML字符串") 创建jquery对象
        var $required = $("<strong class='high'>*</strong>");
        //添加到this对象的父级对象下
        $(this).parent().append($required);
    }); 
       $("form :input").blur(function(){
       
        var $parent = $(this).parent();
            $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）
            //验证姓名
            if($(this).is("#mypwd")){
                var nameVal = $.trim(this.value); 
                if(nameVal == ""){
                    var errorMsg = " 姓名非空！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
            }
             
             if($(this).is("#name")){
                var nameVal = $.trim(this.value); 
                if(nameVal == "" ){
                    var errorMsg = "请输入用户名";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
            }
       });
        $("#send").click(function(){
            $("form .required:input").trigger("blur"); 
            var numError = $("form .onError").length;
            if(numError){
                return false;
            }
        });
        
    });  
    </script>
  </head>
  
   <body style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录后台管理界面平台</span>    
    <ul>
    <li><a href="#">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    <div class="loginbody" >
    
    <span class="systemlogo" style="background-image:url('images/loginbg3.png);"></span> 
    <div class="loginbox" style="background-image:url('images/logininfo.png');">
    <h3>${message}</h3>
    <form action="${cxt}/admin/gologin" method="post"  >
    <ul>
    <li><input style="background-image:url('images/loginpassword.png');" name="adminname" type="text" class="loginuser required" id="name" /></li>
    <li><input style="background-image:url('images/loginuser.png');" name="adminpwd" type="password" class="loginpwd required" id="mypwd"/></li>
    <li><button style="background-image:url('images/buttonbg.png');" type="submit" class="loginbtn" id="send">登录</button></li>
    <label><input name="" type="checkbox" checked="checked"/>记住密码</label>
    <label><a href="#">忘记密码？</a></label></li>
    </ul>
    </form>