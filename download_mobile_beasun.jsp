<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="utf-8">
	<head>
		<meta content="text/html; charset=UTF-8" http-equiv="content-type" />
		<title>BEASUN APP download online</title>
		<meta name="viewport"
			content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<script src="resource/website/js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<style type="text/css">
.topfloatBox {
	width: 100%;
	padding: 15px 0px 0px 0px;
	background: url(resource/images/arrow.png) no-repeat scroll 99% 0;
	position: fixed;
	top: 0px;
	left: 0px;
	display: none;
	z-index: 999999;
}

.topfloat {
	background: #000;
	opacity: 0.8;
	color: #fff;
	padding: 10px;
}
</style>
		<script language="javascript" type="text/javascript"> 
			$(function(){
				var type=navigator.appName
				if (type=="Netscape"){
				var lang = navigator.language
				}
				else{
				var lang = navigator.userLanguage
				}
				//取得浏览器语言的前两个字母
				var lang = lang.substr(0,2)
				if (lang == "en"){
					$("#tishi_1").html("Click the upper right corner.");
					$("#tishi_2").html("Choose to open in the browser, you can install"); 
				}
				if(!isWeiXin()){
			    	checkOS();
			    }
				/* $.ajax({
							type:'get',
							url:"${ctx}/client/online/lastDownloadYs.jhtml",
							data:"",
							dataType:'text',
							success:function(v){
							var data = eval('(' + v + ')');
							$("#android_url").val(data.android_url);
							$("#ios_url").val(data.ios_url);
							if(!isWeiXin()){
						    	checkOS();
						    }
						},
						error:function(){
							return;
						}		
						});
				 */
			});
		function checkOS() 
		{ 
			//默认的地址 
			var website = 'http://band.hesvitband.com/cn/download.jsp'; 
			//var website = 'http://172.16.166.23:8089/hesvitband/download_mobile_beasun.jsp';
			//如果检测到是Android系统需要跳转的地址 
			var androidUrl = $("#android_url").val(); 
			var androidUrl_weixin = 'http://a.app.qq.com/o/simple.jsp?pkgname=com.launch.bracelet'; 
			//如果检测到是iphone/ipod需要跳转的地址 
		/* 	var iphoneUrl = $("#ios_url").val(); 
		 	var iphoneUrl_weixin = 'http://a.app.qq.com/o/simple.jsp?pkgname=com.launch.bracelet';
		 	 */
		 	
		 	var iphoneUrl = 'itms-services://?action=download-manifest&url=https://dn-cnlaunch.qbox.me/hesvitbracelet_beasun_1.0.2.plist'; 
			var iphoneUrl_weixin = 'http://mp.weixin.qq.com/mp/redirect?url=https://dn-cnlaunch.qbox.me/hesvitbracelet_beasun_1.0.2.plist';
		 	
			//var iphoneUrl_weixin = 'http://mp.weixin.qq.com/mp/redirect?url='+iphoneUrl; 
			//windows phone跳转地址 
			var A = navigator.userAgent.toLocaleLowerCase();
			var a = A.indexOf("micromessenger") > -1;
			
		    window.location.href = A.indexOf("iphone") > -1 || A.indexOf("ipad") > -1 ? 
		    		(a ? iphoneUrl_weixin : iphoneUrl) : 
		    			(A.indexOf("android") > -1 ? (a ? androidUrl_weixin : androidUrl) : website); 
		} 
		
		function isWeiXin(){
		    var ua = window.navigator.userAgent.toLowerCase();
		    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
		        return true;
		    }else{
		        return false;
		    }
		}
		function toDownload(){
		    if(isWeiXin()){
		        $(".topfloatBox").show();
				$(".bottomfloatBox").show();
		    }else{
		    	checkOS();
		    }
		}
</script>

<style>
.dl_code{ text-align:center;margin-top:20px;}
.dl_wenzi{font-size: 19px;  font-weight: 600;  color: #666; margin-top:20px;}
.dl_erweima,.dl_wenzi,.dl_btn{ position:absolute; top:-5000px;}
.dl_erweima img{ border: 10px solid #1CBBA9;  width: 160px; margin-top:20px;}
.hesvitbandbtn01 a {  display: inline-block;  width: 150px;  height: 40px;  line-height: 40px;  background: url(resource/images/download_ios.png) no-repeat scroll 5px 0 #01B098;  border: none;  color: #fff;  margin: 10px 0;  text-decoration: none;  padding-left: 13px;}
.hesvitbandbtn02 a {  display: inline-block;  width: 150px;  height: 40px;  line-height: 40px;  background: url(resource/images/download_android.png) no-repeat scroll 5px 0 #01b09e;  border: none;  color: #fff;  margin: 10px 0;  text-decoration: none;  padding-left: 13px;}
.dl_btn{ text-align:center;}

@-webkit-keyframes bounceInDown {
	0%,100%,60%,75%,90% {
		-webkit-transition-timing-function: cubic-bezier(.215,.61,.355,1);
		transition-timing-function: cubic-bezier(.215,.61,.355,1);
	}

	0% {
		opacity: 0;
		-webkit-transform: translate3d(0,-3000px,0);
		transform: translate3d(0,-3000px,0);
	}

	60% {
		opacity: 1;
		-webkit-transform: translate3d(0,25px,0);
		transform: translate3d(0,25px,0);
	}

	75% {
		-webkit-transform: translate3d(0,-10px,0);
		transform: translate3d(0,-10px,0);
	}

	90% {
		-webkit-transform: translate3d(0,5px,0);
		transform: translate3d(0,5px,0);
	}

	100% {
		-webkit-transform: none;
		transform: none;
	}
}

@keyframes bounceInDown {
	0%,100%,60%,75%,90% {
		-webkit-transition-timing-function: cubic-bezier(.215,.61,.355,1);
		transition-timing-function: cubic-bezier(.215,.61,.355,1);
	}

	0% {
		opacity: 0;
		-webkit-transform: translate3d(0,-3000px,0);
		transform: translate3d(0,-3000px,0);
		-ms-transform: translate3d(0,-3000px,0);
	}

	60% {
		opacity: 1;
		-webkit-transform: translate3d(0,25px,0);
		transform: translate3d(0,25px,0);
		-ms-transform: translate3d(0,25px,0);
	}

	75% {
		-webkit-transform: translate3d(0,-10px,0);
		transform: translate3d(0,-10px,0);
		-ms-transform: translate3d(0,-10px,0);
	}

	90% {
		-webkit-transform: translate3d(0,5px,0);
		transform: translate3d(0,5px,0);
		-ms-transform: translate3d(0,5px,0);
	}

	100% {
		-webkit-transform: none;
		transform: none;
		-ms-transform: none;
	}
}
.bounceInDown {
	-webkit-animation-name: bounceInDown;
	animation-name: bounceInDown;
}
@-webkit-keyframes bounceIn {
	0%,100%,20%,40%,60%,80% {
		-webkit-transition-timing-function: cubic-bezier(.215,.61,.355,1);
		transition-timing-function: cubic-bezier(.215,.61,.355,1);
	}

	0% {
		opacity: 0;
		-webkit-transform: scale3d(.3,.3,.3);
		transform: scale3d(.3,.3,.3);
	}

	20% {
		-webkit-transform: scale3d(1.1,1.1,1.1);
		transform: scale3d(1.1,1.1,1.1);
	}

	40% {
		-webkit-transform: scale3d(.9,.9,.9);
		transform: scale3d(.9,.9,.9);
	}

	60% {
		opacity: 1;
		-webkit-transform: scale3d(1.03,1.03,1.03);
		transform: scale3d(1.03,1.03,1.03);
	}

	80% {
		-webkit-transform: scale3d(.97,.97,.97);
		transform: scale3d(.97,.97,.97);
	}

	100% {
		opacity: 1;
		-webkit-transform: scale3d(1,1,1);
		transform: scale3d(1,1,1);
	}
}

@keyframes bounceIn {
	0%,100%,20%,40%,60%,80% {
		-webkit-transition-timing-function: cubic-bezier(.215,.61,.355,1);
		transition-timing-function: cubic-bezier(.215,.61,.355,1);
	}

	0% {
		opacity: 0;
		-webkit-transform: scale3d(.3,.3,.3);
		transform: scale3d(.3,.3,.3);
		-ms-transform: scale3d(.3,.3,.3);
	}

	20% {
		-webkit-transform: scale3d(1.1,1.1,1.1);
		transform: scale3d(1.1,1.1,1.1);
		-ms-transform: scale3d(1.1,1.1,1.1);
	}

	40% {
		-webkit-transform: scale3d(.9,.9,.9);
		transform: scale3d(.9,.9,.9);
		-ms-transform: scale3d(.9,.9,.9);
	}

	60% {
		opacity: 1;
		-webkit-transform: scale3d(1.03,1.03,1.03);
		transform: scale3d(1.03,1.03,1.03);
		-ms-transform: scale3d(1.03,1.03,1.03);
	}

	80% {
		-webkit-transform: scale3d(.97,.97,.97);
		transform: scale3d(.97,.97,.97);
		-ms-transform: scale3d(.97,.97,.97);
	}

	100% {
		opacity: 1;
		-webkit-transform: scale3d(1,1,1);
		transform: scale3d(1,1,1);
		-ms-transform: scale3d(1,1,1);
	}
}

.bounceIn {
	-webkit-animation-name: bounceIn;
	animation-name: bounceIn;
	-webkit-animation-duration: .75s;
	animation-duration: .75s;
}
@-webkit-keyframes bounceInLeft {
	0%,100%,60%,75%,90% {
		-webkit-transition-timing-function: cubic-bezier(.215,.61,.355,1);
		transition-timing-function: cubic-bezier(.215,.61,.355,1);
	}

	0% {
		opacity: 0;
		-webkit-transform: translate3d(-3000px,0,0);
		transform: translate3d(-3000px,0,0);
	}

	60% {
		opacity: 1;
		-webkit-transform: translate3d(25px,0,0);
		transform: translate3d(25px,0,0);
	}

	75% {
		-webkit-transform: translate3d(-10px,0,0);
		transform: translate3d(-10px,0,0);
	}

	90% {
		-webkit-transform: translate3d(5px,0,0);
		transform: translate3d(5px,0,0);
	}

	100% {
		-webkit-transform: none;
		transform: none;
	}
}

@keyframes bounceInLeft {
	0%,100%,60%,75%,90% {
		-webkit-transition-timing-function: cubic-bezier(.215,.61,.355,1);
		transition-timing-function: cubic-bezier(.215,.61,.355,1);
	}

	0% {
		opacity: 0;
		-webkit-transform: translate3d(-3000px,0,0);
		transform: translate3d(-3000px,0,0);
		-ms-transform: translate3d(-3000px,0,0);
	}

	60% {
		opacity: 1;
		-webkit-transform: translate3d(25px,0,0);
		transform: translate3d(25px,0,0);
		-ms-transform: translate3d(25px,0,0);
	}

	75% {
		-webkit-transform: translate3d(-10px,0,0);
		transform: translate3d(-10px,0,0);
		-ms-transform: translate3d(-10px,0,0);
	}

	90% {
		-webkit-transform: translate3d(5px,0,0);
		transform: translate3d(5px,0,0);
		-ms-transform: translate3d(5px,0,0);
	}

	100% {
		-webkit-transform: none;
		transform: none;
		-ms-transform: none;
	}
}

.bounceInLeft {
	-webkit-animation-name: bounceInLeft;
	animation-name: bounceInLeft;
}
.dl_logo{ -webkit-animation:bounceInDown 1500ms 20ms ease  normal;animation:bounceInDown 1500ms 20ms ease  normal;}
.dl_btn{ -webkit-animation:bounceInDown 2000ms 2s ease  normal;animation:bounceInDown 2000ms 2s ease  normal;}
.dl_erweima{ -webkit-animation:bounceIn 2000ms 1s ease  normal;animation:bounceIn 2000ms 1s ease  normal;}
.dl_wenzi{ -webkit-animation:bounceInLeft 2000ms 1.5s ease  normal;animation:bounceInLeft 2000ms 1.5s ease  normal}
</style>

<script>
	function dl_erweima(){
		document.getElementById('dl_erweima').style.position = "initial";
	}
	function dl_wenzi(){
	document.getElementById('dl_wenzi').style.position = "initial";
	}

	function dl_btn(){
	document.getElementById('dl_btn').style.position = "initial";
	}
		setTimeout('dl_erweima()',1100);
		setTimeout('dl_wenzi()',1600);
		setTimeout('dl_btn()',2100);	
	
</script>
	</head>
	<body>
		<input type="hidden" id="android_url" value="http://band.hesvit.com/beasun/beasun_1.0.0.apk" />
		<input type="hidden" id="ios_url"  value="http://band.hesvit.com/beasun/beasun_1.0.0.ipa" />
		<div class="dl_code" >
		        <!-- 放入贝尔顺logo -->
      			<!-- <div id="dl_logo" class="dl_logo bounceInDown"><img src="resource/website/images/logo_ys.png" style="width:100%;"></div> -->
				<div id="dl_erweima" class="dl_erweima bounceIn"><img src="resource/images/beansun.png"></div>
				<p  id="dl_wenzi" class="dl_wenzi bounceInLeft">下载</p>
				<div id="dl_btn" class="dl_btn bounceInDown2">
					<div class="hesvitbandbtn01">
						<a href="javascript:void(0);" onClick="toDownload()">iOS </a>
					</div>
					<div class="hesvitbandbtn02">
						<a href="javascript:void(0);" onClick="toDownload()">Android </a>
					</div>
				</div>
		</div>	
		<div class="topfloatBox">
			<div class="topfloat">
				<p style="text-align: right; font-size: 12px; color: #fde968;" id="tishi_1">
					点击右上角
				</p>
				<p style="text-align: center; font-size: 18px; color: #fde968; line-height: 30px;" id="tishi_2">
					选择"在浏览器中打开"，即可安装
				</p>
				<p style="text-align: center; font-size: 12px;">
				</p>
			</div>
		</div>
	</body>
</html>
