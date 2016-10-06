<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0029)http://wap.feekr.com/register -->
<html lang="zh" class="hb-loaded">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
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
      <script src="<%=basePath%>/midui/js/jweixin-1.0.0.js"></script>
    <title>觅对</title>
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
<script type="text/html" id="nav-tpl">
    <div class="nav">
        <nav class="nav-wrap table-mode">
            {{each nav as v i}}

            <div class="table-cell">
                {{if v.current}}
                <a class=" nav-menu nav-{{i}} v-link-active" href="{{v.path}}">
                    <span class="iconfont {{v.activeIcon}}"></span>
                    <span class="nav-name">{{v.name}}</span>
                </a>
                {{else}}
                <a class="nav-menu nav-{{i}}" href="{{v.path}}">
                    <span class="iconfont {{v.icon}}"></span>
                    <span class="nav-name">{{v.name}}</span>
                </a>
                {{/if}}
            </div>
            {{/each}}
        </nav>
    </div>
</script>
<script>
    $(function () {
        var configData = {
                nav: [
                    {
                        icon: 'icon-shouyenormal',
                        name: '首页',
                        activeIcon: 'icon-shouyepressed',
                        path: '/',
                        from: 'navindex'
                    },
                    {
                        icon: 'icon-jingxuannormal',
                        name: '精选',
                        activeIcon: 'icon-jingxuanpressed',
                        path: 'http://h5.feekr.com/new/catalog',
                        from: 'navselection'
                    },
                    {
                        icon: 'icon-gongluenormal',
                        name: '攻略',
                        activeIcon: 'icon-gonglvepressed',
                        path: '/guide/strategy',
                        from: 'navguide'
                    },
                    {
                        icon: 'icon-wodenormal',
                        name: '我的',
                        activeIcon: 'icon-wodepressed',
                        path: '/user',
                        from: 'navmypage'
                    }
                ]
            },
            isNav = false,
            from;
        configData.nav = configData.nav.map(function (v, i) {
            if (location.pathname == v.path) {
                v.current = true;
                isNav = true;
            }
            return v;
        });

        if (isNav) {

            from = configData.nav.filter(function (val, idx) {
                if(val.current) {
                    return val.from
                }
            });

            configData.nav = configData.nav.map(function (v, i) {
                v.path = v.path + '?pv_from=' + from[0].from + '';
                return v;
            });

            $('body').append(template('nav-tpl', configData))
        }

    })
</script><div class="wrap table-mode">
    <div class="inner-wrap login-wrap table-cell">
        <div class="logo">
            <p class="iconfont icon-feekr"></p>
        </div>
        <form onsubmit="return false" class="login-form">
            <div class="username-wrap input-wrap">
                <span class="iconfont icon-yonghu"></span><input type="text" class="account login-input" placeholder="请输入用户名" data-type="username">
            </div>
            <div class="password-wrap input-wrap">
                <span class="iconfont icon-mima"></span><input type="password" class="pwd login-input" placeholder="请输入密码" data-type="password">
            </div>
            <button type="submit" class="login-submit">登录</button>
        </form>
        <div class="go-reg clearfix">
            <!--<a href="http://wap.feekr.com/findPwd" class="pull-left">忘记密码</a>-->
            <a href="<%=basePath%>/userbasic/goZhuce.do" class="pull-right">快速注册</a>
        </div>

<!--
        <div class="login-third-wrap">
            <div class="third-title table-mode">
                <div class="table-cell"><span class="line"></span></div>
                <div class="table-cell title">使用第三方账号登录</div>
                <div class="table-cell"><span class="line"></span></div>
            </div>
            <div class="login-list">
                <a class="thirdparty zone-login" href="http://wap.feekr.com/login/oauth/source/2&amp;return=http%3A%2F%2Fwap.feekr.com%2Fuser%3Fpv_from%3Dnavindex" target="_parent" title="使用腾讯QQ"><span class="iconfont icon-qq"></span></a>
                <a class="thirdparty weibo-login" href="http://wap.feekr.com/login/oauth/source/1&amp;return=http%3A%2F%2Fwap.feekr.com%2Fuser%3Fpv_from%3Dnavindex" target="_parent" title="使用新浪微博">
                    <span class="iconfont icon-weibo"></span></a>
            </div>
        </div>
-->

    </div>
</div>


    <!--数据统计-->
    <div style="display:none;">
        <script async="async" src="./03.Feekr_登录_files/stat.php" language="JavaScript"></script>
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
        var input = $('.login-input'),
            submit = $('.login-submit'),
            login = {},
            weixin = '<a class="thirdparty weixin-login" href="/login/weixin/source/5&return=http%3A%2F%2Fwap.feekr.com%2Fuser%3Fpv_from%3Dnavindex" target="_parent" title="使用微信"><span class="iconfont icon-weixin1"></span></a>';

        if($.isWeixin(navigator.userAgent)) {
            $('.login-list').prepend(weixin);
        }
        submit.on('click', function (e) {
            e.preventDefault();
            var username = $.trim($('.account').val());
            var pwd = $.trim($('.pwd').val());

            if (!username) {
                $.alert('帐号不能为空！');
                return;;
            }
            if (!pwd) {
                $.alert('密码不能为空！');
                return;
            }


        $.ajax({
                    type: "POST",
                    url: "<%=basePath%>/userbasic/login.do",
                    data: {
                            USERNAME: username,
                            PASSWORD: pwd      
                        },
                    dataType:'json',
                    cache: false,
                     /*beforeSend: function () {
                            $.loading({
                                text: '登录中...'
                            })
                     },*/
                    success: function(data){
                        if("1" == data.result){
                            location.href = '<%=basePath%>/userbasic/goPersonIndex.do';
                        }else{
                            $.alert('用户名或密码错误');
                        }
                      
                    },
                   error: function () {
                      $.alert('服务器出错!');
                    }
                   }); 



           /* $.getAjax({
                url: "<%=basePath%>/userbasic/login.do",
                type: 'POST',
                data: {
                    USERNAME: username,
                    PASSWORD: pwd
                },
                beforeSend: function () {
                    $.loading({
                        text: '登录中...'
                    })
                }
            }, function (res) {
                var data = res;
//                $.each(data.result.cookies, function (i, v) {
//                    var date = new Date();
//                    var time = date.getTime();
//                    date.setTime(v.expire);
//                    document.cookie = ""+ v.name +"="+ v.value +";path="+ v. path +";expires="+ date.toGMTString() +"";
//                });

                if (res.result.operation == 1) {
                    document.cookie = 'uid=' + res.result.authUid + ';domain=' + globalConfig.domain.cookieDomain + ';expires=' + $.setTime(90);
                    location.href = res.result.returnUrl;
                }

            });*/
        });
    });
</script>
</body>
</html>