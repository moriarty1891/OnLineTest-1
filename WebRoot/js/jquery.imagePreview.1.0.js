﻿// JavaScript Document
//copyright c by zhangxinxu 2009-10-17 
//http://www.zhangxinxu.com
/*由于大图绑定在href属性中，故一般而言，需使用a标签的href指向大图。仅支持png,gif,jpg,bmp四种格式的图片。用法是：目标.preview();
例如：<a href="xx.jpg">图片</a>
$("a").preview();就可以了
在原来的js框架基础上扩展jpeg格式和大小写不区分，可以添加参数
*/
(function($){
	$.fn.preview = function(){
		var xOffset = 10;
		var yOffset = 20;
		var w = $(window).width();
		$(this).each(function(){
			$(this).hover(function(e){
				var strShow = $(this).attr("href");
				if(strShow.length==0){//href为空
					return;
				}
				var strIndex = strShow.lastIndexOf("?");
				if(strIndex<=0){//不存在random参数
				}else{
					strShow = strShow.substring(0,strIndex);
				}
				//if(/.png$|.gif$|.jpg$|.jpeg$|.bmp$|.PNG$|.GIF$|.JPG$|.JPEG$|.BMP$/.test($(this).attr("href"))){//原文
				if(/.png$|.gif$|.jpg$|.jpeg$|.bmp$|.PNG$|.GIF$|.JPG$|.JPEG$|.BMP$/.test(strShow)){
					$("body").append("<div id='preview'><div><img src='"+$(this).attr('href')+"' /><p>"+$(this).attr('title')+"</p></div></div>");
				}else{
					$("body").append("<div id='preview'><div><p>"+$(this).attr('title')+"</p></div></div>");
				}
				$("#preview").css({
					position:"absolute",
					padding:"4px",
					border:"1px solid #f3f3f3",
					backgroundColor:"#eeeeee",
					top:(e.pageY - yOffset) + "px",
					zIndex:1000
				});
				$("#preview > div").css({
					padding:"5px",
					backgroundColor:"white",
					border:"1px solid #cccccc"
				});
				$("#preview > div > p").css({
					textAlign:"center",
					fontSize:"12px",
					padding:"8px 0 3px",
					margin:"0"
				});
				if(e.pageX < w/2){
					$("#preview").css({
						left: e.pageX + xOffset + "px",
						right: "auto"
					}).fadeIn("fast");
				}else{
					$("#preview").css("right",(w - e.pageX + yOffset) + "px").css("left", "auto").fadeIn("fast");	
				}
			},function(){
				$("#preview").remove();
			}).mousemove(function(e){
				$("#preview").css("top",(e.pageY - xOffset) + "px")
				if(e.pageX < w/2){
					$("#preview").css("left",(e.pageX + yOffset) + "px").css("right","auto");
				}else{
					$("#preview").css("right",(w - e.pageX + yOffset) + "px").css("left","auto");
				}
			});						  
		});
	};
})(jQuery);