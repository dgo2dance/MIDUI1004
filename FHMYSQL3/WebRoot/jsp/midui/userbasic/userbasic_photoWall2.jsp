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
 
  <link rel="stylesheet" href="<%=basePath%>/midui/assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="<%=basePath%>/midui/assets/css/admin.css">
<script src="<%=basePath%>/midui/assets/js/handlebars.min.js"></script>
<script src="<%=basePath%>/midui/assets/js/amazeui.min.js"></script>


<title>觅对</title>
  
   
</head>
<body huaban_collector_injected="true">
 <div id="global-overlayer" class="global-overlayer" style="display: none;"></div>
 <div id="global-loading" class="global-loading" style="display: none;">
      
  
</div>
<div class="global-alert">
    <div class="alert-content"></div>
</div>
 
  
<div class="wrap edit-mode myset-wrap user-wrap">
    <div class="inner-wrap">
        <header class="back-title user-header">
            <span>图片墙</span>
            <a href="<%=basePath%>/userbasic/goPersonIndex.do" class="iconfont icon-fanhui"></a>
        </header>

        <%--<div class="set-wrap">
            <div class="upload-wrap">
            <div class="setting-avatar-wrap">
                 <img src="<%=basePath%>/IMGFile/${pd.HEADIMG}" id="avatar">
             </div>
        </div>
  --%>
  
  <!-- am-gallery-overlay ： 悬浮框， am-gallery-default: 放大返回     am-avg-sm-4 ： 一行显示4个-->
	  <section class="item">
	  
     
      <c:choose>
          <c:when test="${not empty varList}">
              <ul data-am-widget="gallery" class="am-gallery am-avg-sm-4
        am-avg-md-3 am-avg-lg-4  am-gallery-default
        am-gallery-overlay   am-gallery-imgbordered"  data-am-gallery="{ pureview: true }" >
                        <c:forEach items="${varList}" var="var" varStatus="vs">
                              <li>
                                  <div class="am-gallery-item" id="1">
                                      <a href="<%=basePath%>/IMGFile/${var.PHOTOPATH}" class="">
                                        <img src="<%=basePath%>/IMGFile/${var.PHOTOPATH}"  alt="." 
                                        data-rel="<%=basePath%>/IMGFile/${var.PHOTOPATH}"
                                        />
                                        <h3 class="am-gallery-title">
                                         <a>
                                           <input type="checkbox"  name='delete' value="${var.PHOTO_ID}"/>
                                         </a>  
                                        </h3>
                                        <%--
                                          <h3 class="am-gallery-title">远方 有一个地方 那里种有我们的梦想</h3>
                                          <div class="am-gallery-desc">2375-09-26</div>
                                      --%>
                                      </a>
                                  </div>
                             </li>
                        
                        </c:forEach>
                 </ul>
                <div>
                   <a class="submit-btn">删除</a>
                </div>
               </c:when>
              <c:otherwise>
                  <h3 align="center">暂无图片信息</h3>
                   
              </c:otherwise>
            </c:choose>
 

      </section>
  
  </div>
       
         
 <%--<ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
    am-avg-md-3 am-avg-lg-4 am-gallery-default" data-am-gallery="{ pureview: true }" >
      <li>
        <div class="am-gallery-item">
            <a href="http://s.amazeui.org/media/i/demos/bing-1.jpg" class="">
              <img src="http://s.amazeui.org/media/i/demos/bing-1.jpg"  alt="远方 有一个地方 那里种有我们的梦想"/>
                <h3 class="am-gallery-title">远方 有一个地方 那里种有我们的梦想</h3>
                <div class="am-gallery-desc">2375-09-26</div>
            </a>
        </div>
      </li>
       
   </ul>  --%>
	  
   
</div>
  
<script>
       $(document).on('click', '.submit-btn', function (e) {
              var chk_value =[];    
              $('input[name="delete"]:checked').each(function(){    
                  chk_value.push($(this).val());    
              });    
             //$.alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);  
             if(chk_value.length==0) {
                   $.alert('请选择图片!');
              } else {
                  var deleteCHK= chk_value.join(",");    
                   //$.alert(deleteCHK);
                   $.getAjax({
                        url: "<%=basePath%>/photo/deleteByWall.do",
                        data: {DATA_IDS:deleteCHK},
                        type: 'POST',
                        beforeSend: function () {
                            $.loading({
                                text: "操作中..."
                            });
                        }
                    }, function (res) {
                        if("200"==res.result){
                        //  $.alert('删除成功');
                          //location.href = '<%=basePath%>/userbasic/goPhotoWall.do'
                          setTimeout(function() {location.href = '<%=basePath%>/userbasic/goPhotoWall.do';},500)
                        }else{
                            $.alert('删除出错');
                        }
                       
                    });
              }
          });
            
</script>

</body></html>