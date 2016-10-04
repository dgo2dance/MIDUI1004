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
    <link rel="apple-touch-icon-precomposed" href="http://img.feekr.com/image/ios/feekr_57.png">
    
     <link rel="stylesheet" type="text/css" href="<%=basePath%>/midui/css/index.css">    
    <script async="" src="<%=basePath%>/midui/js/analytics.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/template.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/utils.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/fastclick.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/swiper.jquery.min3.3.1.js"></script>
    <script type="text/javascript" src="<%=basePath%>/midui/js/jquery.lazyload.min.js"></script>  
      <script src="<%=basePath%>/midui/js/jweixin-1.0.0.js"></script>
    <title>觅对</title>
    </head>
<body >
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
  
 
<div class="inner-wrap user-info-wrap">
    <header class="back-title">
        <span class="style-title">填写资料</span>
    </header>

 
     <div class="info-container">
        <form id="info-form" onsubmit="return false">
            <div class="upload-wrap avatar-upload">
                <div class="iconfont icon-xiangji"></div>
           <img src="./04.Feekr_编辑头像_files/saved_resource" alt="" class="avatar">
           <input type="file" class="upload-btn" accept="image/jpeg, image/png, image/jpg">
            </div>
            <p class="upload-tips">点击图片编辑头像</p>
            <input type="text" placeholder="输入一个独一无二的昵称" data-type="nickname" class="nickname" value="">
        </form>
         <a href="<%=basePath%>/userbasic/goPersonIndex.do" class="go-feekr">开启觅对之旅</a>
    </div>
</div>

     
<div id="result" name="result"></div>  
    <!--数据统计-->
    <div style="display:none;">
          <script async="async">
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-74126045-1', 'auto');
            ga('send', 'pageview');
        </script>
    </div>


<script>
    $(function () {
        $.loading({
            status: false
        });
        var avatar = $('.avatar'),
            nickname = $('.nickname');
        var submitData = {
            nickname: $.trim(nickname.val()),
            avatar: avatar.data('url')
        };

        if(submitData.nickname){
            $('.go-feekr').data('able', 'able').addClass('active');
        } else {
            $('.go-feekr').data('able', 'disable').removeClass('active');
        }
        
        if(submitData.avatar) {
            avatar.addClass('active');
        }

//头像预览

    $('.upload-btn').on('change', function () {
          //html5读取文件
          if(!this.files.length) return;
          var files = Array.prototype.slice.call(this.files);
          $.each(files, 
         function (i ,file) {
                if (!/\/(?:jpeg|png|jpg)/i.test(file.type)) {
                  $.alert('图片格式不正确');
                  return false;
                }
                if(file.size/(1024*1024) > 10) {
                  $.alert('图片大于'+ 10 +'M');
                  return false;
                }
                var reader = new FileReader();
                reader.readAsDataURL(file);
               reader.onload = function() {
                
                  var result = this.result;
                  var img = new Image();
                  img.src = result;
                  img.onload = function() {
                      
                    if(this.width < 180 || this.height < 180) {
                      $.alert('图片尺寸不能小于'+ 180 +'*'+ 180 +'');
                      return false;
                    }   
                    $.alert('读取图片11111！');
                        
                     $('.go-feekr').data('able', 'able').addClass('active');
                  };
                };
                reader.onerror = function () {
                  $.alert('图片读取失败');
                };
            reader.readAsDataURL(file);
          });
        });






//        头像上传
        /*$('.upload-btn').uploadPic({
            spaceName: 'photo02',
            form: $('#info-form'),
            minWidth: 180,
            minHeight: 180
        }, function (res) {
            submitData.avatar = res.url;
            avatar.attr('src', res.domain + res.url + '!180X180').addClass('active');
        });*/

//        昵称
        nickname.on('keyup', function () {
            var v = $.trim($(this).val());
            if (v) {
                submitData.nickname = v;
                $('.go-feekr').data('able', 'able').addClass('active');
            } else {
                $('.go-feekr').data('able', 'disable').removeClass('active');
            }
        });

//        提交
        $('.go-feekr').on('click', function (e) {
            e.preventDefault();
            var isAble = $(this).data('able');
            if (!submitData.nickname) {
                $.alert('请填写昵称');
                return false;
            }
            if (isAble == 'able') {
                submitData.authUid = $.getCookie('uid');
                $.getAjax({
                    url: api.submitUserInfo,
                    type: 'POST',
                    data: submitData
                }, function (res) {
                    location.href = res.result.returnUrl;
                });
            }
        });
    });
</script>
</body>
</html>