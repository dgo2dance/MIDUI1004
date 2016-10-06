<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh" class="hb-loaded">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="midui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="x5-orientation" content="portrait">
    
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/midui/css/index.css">    
    <script async="" src="<%=basePath%>/midui/js/analytics.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/template.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/utils.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/fastclick.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/swiper.jquery.min3.3.1.js"></script>
 <script type="text/javascript" src="<%=basePath%>/midui/js/jquery.lazyload.min.js"></script>
  
  
<title>觅对</title>
  
<!-- 引用控制层插件样式 -->
    <link rel="stylesheet" href="<%=basePath%>/midui/ImgLoad/control/css/zyUpload.css" type="text/css">
    
    <script type="text/javascript" src="<%=basePath%>/midui/ImgLoad/jquery-1.7.2.js"></script>
    <!-- 引用核心层插件 -->
    <script type="text/javascript" src="<%=basePath%>/midui/ImgLoad/core/zyFile.js"></script>
    <!-- 引用控制层插件 -->
    <script type="text/javascript" src="<%=basePath%>/midui/ImgLoad/control/js/zyUpload.js"></script>
    <!-- 引用初始化JS -->
    <script type="text/javascript" src="<%=basePath%>/midui/ImgLoad/demo.js"></script>


</head>
<body huaban_collector_injected="true">
 <div id="global-overlayer" class="global-overlayer" style="display: none;"></div>
 <div id="global-loading" class="global-loading" style="display: none;">
     <div class="spinner">
        <div class="rect2"></div>
        <div class="rect3"></div>
        <div class="rect4"></div>
    </div>
    <p class="loading-txt">加载中...</p>
  
</div>
<div class="global-alert">
    <div class="alert-content"></div>
</div>
 
 

<div class="wrap edit-mode myset-wrap user-wrap">
    <div class="inner-wrap">
        <header class="back-title user-header">
            <span>图片上传</span>
            <a href="<%=basePath%>/userbasic/goPersonIndex.do" class="iconfont icon-fanhui"></a>
        </header>

        <!-- <div class="set-wrap">
            <div class="upload-wrap">
            <div class="setting-avatar-wrap">
                <form onsubmit="return false" id="upload-form">
                <input id="upload-avatar" type="file" accept="image/jpeg, image/png, image/jpg">
                
                <img src="<%=basePath%>/IMGFile/${pd.HEADIMG}" id="avatar">
                
                </form>
            </div>
            <p class="edit-avatar">点击图片编辑头像</p>
        </div> -->
      <div id="demo" class="demo"></div>   
        <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
      
     </div>
        <a   class="submit-btn">开始上传</a>
    </div> 
</div>
 
<script>
     
  
</script>

</body></html>