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
  
 
<!-- <script src="http://code.jquery.com/mobile/1.3.1/jquery.mobile-1.3.1.min.js"></script>
<link href="<%=basePath%>/midui/css/mobiscroll.custom-2.5.0.min.css" rel="stylesheet"/>
<script src="<%=basePath%>/midui/js/mobiscroll.custom-2.5.0.min.js"  ></script> -->

<script src="<%=basePath%>/midui/mobiscroll/jquery-1.9.1.js"></script>
  
<link rel="stylesheet" href="<%=basePath%>/midui/mobiscroll/mobiscroll.custom-3.0.0-beta5.min.css" type="text/css" />
<script src="<%=basePath%>/midui/mobiscroll/mobiscroll.custom-3.0.0-beta5.min.js"></script>
<title>觅对</title>
  
    <style type="text/css">
        input {
            width: 100%;
            margin: 0 0 10px 0;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 0;
            background: #fff;
            font-family: Arial, sans-serif,verdana;
            text-shadow: none;
            color: #000;
            font-size: 15px;
            -webkit-appearance: none;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        
        .demo-main-cont {
            height: 15%;
        }
        
        .demo-iframe { 
            padding: 10px 10px 10px 10px; 
            text-shadow: none; 
        }

    </style>


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
            <span>我的资料</span>
            <a href="<%=basePath%>/userbasic/goPersonIndex.do" class="iconfont icon-fanhui"></a>
        </header>

       <div class="set-wrap">
            <div class="upload-wrap">
            <div class="setting-avatar-wrap">
                <form onsubmit="return false" id="upload-form">
                <input id="upload-avatar" type="file" accept="image/jpeg, image/png, image/jpg">
                
                <img src="<%=basePath%>/IMGFile/${pd.HEADIMG}" id="avatar">
                
                </form>
            </div>
            <p class="edit-avatar">点击图片编辑头像</p>
        </div>


         
    <section class="item">
      <div class="tips-title"><span class="iconfont icon-wodenormal"></span>昵称</div>
<input  type="hidden" id="USERBASIC_ID" class="input-info" placeholder="" maxlength="30" data-name="USERBASIC_ID" value="${pd.USERBASIC_ID}">
        <input class="input-info"  data-name="USERNAME"  maxlength="30" value="${pd.USERNAME}" readonly="true"> 
    </section>


    <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao"></span>真实姓名</div>
     <input class="input-info" placeholder="输入真实姓名" maxlength="30" data-name="REALNAME" value="${pd.REALNAME}">
    </section>

     <section class="item">
    <div class="tips-title"><span class="iconfont icon-gongwenbao"></span>性别</div>
<!--  <input class="input-info" id="SEX"  placeholder="输入性别" maxlength="30" data-name="SEX" value="${pd.SEX}"> -->
    

<div class="demo-main-cont demo-comp-select demo-display-bottom demo-theme-mobiscroll">
        <div class="demo-iframe demo-countrypicker">
        <select name="SEX" id="SEX"  data-name="SEX"  >
            <option  
              <c:if test="${pd.SEX == '男' }">selected="selected"</c:if>  
            value="男">男</option>
            <option  
             <c:if test="${pd.SEX == '女' }">selected="selected"</c:if>  
            value="女">女
            </option>
        </select>
    </div>
</div>



    </section>

    <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao"></span>生日</div>
     <input class="input-info" placeholder="输入生日" 
 data-role="datebox" 
     maxlength="30" data-name="BIRTHDAY" value="${pd.BIRTHDAY}">
  

    </section>

<section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao"></span>身高</div>
     <input class="input-info" placeholder="输入身高" maxlength="30" data-name="HIGHT" value="${pd.HIGHT}">
    </section>

 <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao"></span>学历</div>
     <input class="input-info" placeholder="输入学历" maxlength="30" data-name="XUELI" value="${pd.XUELI}">
    </section>
    
 <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao"></span>职业</div>
     <input class="input-info" placeholder="输入职业" maxlength="30" data-name="WORKS" value="${pd.WORKS}">
    </section>
    
 <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao"></span>现居地/城市</div>
     <input class="input-info" placeholder="输入城市" maxlength="30" data-name="CITY" value="${pd.CITY}">
</section>
       
 <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao">收入</span></div>
     <input class="input-info" placeholder="输入收入" maxlength="30" data-name="SHOURU" value="${pd.SHOURU}">
    </section>
    
 <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao">是否有婚姻史</span></div>
     <!-- <input class="input-info" placeholder="输入是否有婚姻史" maxlength="30" data-name="ISMARRIED" value="${pd.ISMARRIED}"> -->
      
<div class="demo-main-cont demo-comp-select demo-display-bottom demo-theme-mobiscroll">
        <div class="demo-iframe demo-countrypicker">
        <select name="ISMARRIED" id="ISMARRIED"  data-name="ISMARRIED"  >
            <option <c:if test="${pd.ISMARRIED == '否' }">selected="selected"</c:if> value="否">否</option>
            <option  <c:if test="${pd.ISMARRIED == '否' }">selected="selected"</c:if>  value="是">是</option>
        </select>
    </div>
</div>


 </section>  
       
 <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao">手机号</span></div>
     <input class="input-info" placeholder="输入手机号" maxlength="30" data-name="PHONE" value="${pd.PHONE}">
    </section>
    
 <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao">QQ</span></div>
     <input class="input-info" placeholder="输入QQ" maxlength="30" data-name="QQ" value="${pd.QQ}">
    </section>
    
  <section class="item">
     <div class="tips-title"><span class="iconfont icon-gongwenbao">微信号</span></div>
     <input class="input-info" placeholder="输入微信号" maxlength="30" data-name="WEIXIN" value="${pd.WEIXIN}">
    </section>                  
 
    <section class="item">
        <div class="tips-title"><span class="iconfont icon-huatong"></span>个人宣言</div>
        <textarea class="input-info" placeholder="输入个人宣言" maxlength="300" data-name="MYDESC" rows="4">${pd.MYDESC}</textarea>
    </section></div>
        <a  class="submit-btn">提交</a>
    </div>
</div>
 
 
  
<script>
    $(function () {
 
          $('#upload-avatar').on('change', function () {
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
                            reader.onload = function(event ) {
                              var result = this.result;
                              var img = new Image();
                              img.src = result;
                              img.onload = function() {
                                if(this.width < 180 || this.height < 180) {
                                  $.alert('图片尺寸不能小于'+ 180 +'*'+ 180 +'');
                                  return false;
                                }
                                
                          //ajax 上传图片  
                          
                         var USERBASIC_IDVAL= document.getElementById("USERBASIC_ID").value;
                            $.post("<%=basePath%>/userbasic/editDetailSave.do",{USERBASIC_ID:USERBASIC_IDVAL,headImg:event.target.result},
                                function(ret){  
                                    if(ret.result!=''){  
                                        //$.alert('读取图片成功！'+ret.result); 
                        $('#avatar').attr('src',"<%=basePath%>/IMGFile/"+ret.result);
                                    }else{  
                                        $.alert('读取异常！');  
                                    }  
                                },'json'); 
                                //头像展示
								//$('#avatar').attr('src',event.target.result);
                                // $.alert('读取图片11111！');
                              };
                            };
                            reader.onerror = function () {
                              $.alert('图片读取失败');
                            };
                        reader.readAsDataURL(file);
                      });
            });


 



        $('#SEX').mobiscroll().select({
                    theme: 'mobiscroll',   
                    lang: 'zh',            
                    display: 'bottom'    
         });
        $('#ISMARRIED').mobiscroll().select({
                    theme: 'mobiscroll',   
                    lang: 'zh',            
                    display: 'bottom'    
         });



        //生日控件
      var currYear = (new Date()).getFullYear();  
       var dateOpt = {
            preset: 'date', //日期      android-ics
            theme: 'mobiscroll', //皮肤其他参数【android-ics light】【android-ics】【ios】【jqm】【sense-ui】【sense-ui】【sense-ui】
            display: 'bottom', //显示方式 
            lang: 'zh',
            mode: 'scroller', //日期选择模式
            dateFormat: 'yy-mm-dd', // 日期格式
            setText: '确定', //确认按钮名称
            cancelText: '取消',//取消按钮名籍我
            dateOrder: 'yymmdd', //面板中日期排列格式
            dayText: '日', monthText: '月', yearText: '年', //面板中年月日文字
             startYear:currYear - 40, //开始年份
             endYear:currYear  //结束年份

        };
        $("input[data-name='BIRTHDAY']").mobiscroll().date(dateOpt); 
        //$('input:jqmData(role="datebox")').mobiscroll().date(dateOpt); 

     //选择控件
         
        var tpl,
            container = $('.set-wrap'),
            setting = {};
      
        $(document).on('click', '.submit-btn', function (e) {
            e.preventDefault();
            $('.input-info').each(function (i, v) {
                var name = $(this).data('name');
                setting[name] = $.trim($(this).val());
            });

            setting.authUid = $.getCookie('uid');
            if(!setting.REALNAME) {
                $.alert('昵称!');
            } /*else if(!setting.avatarUrl) {
                $.alert('上传头像!');
            } */else {
                    setting.SEX=document.getElementById("SEX").value;
                    setting.ISMARRIED=document.getElementById("ISMARRIED").value;
               $.getAjax({
                    url: "<%=basePath%>/userbasic/editDetailSave.do",
                    data: setting,
                    type: 'POST',
                    beforeSend: function () {
                        $.loading({
                            text: "提交中..."
                        });
                    }
                }, function (res) {
                    if("1"==res.result){
                       //$.alert('设置成功');
                       location.href = '<%=basePath%>/userbasic/goPersonIndex.do';
                       //setTimeout(function() {location.href = '/user';}, 800)
                    }else{
                        $.alert('设置出错');
                    }
                   
                });
            }
        });


    });
</script>

</body></html>