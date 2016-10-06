<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
 <html lang="zh" class="hb-loaded"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="x5-orientation" content="portrait">
     
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/midui/css/index.css">    
    <script src="<%=basePath%>/midui/js/analytics.js"></script>
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
</script>    <div class="wrap user-wrap">
        <div class="inner-wrap">
            <header class="back-title user-header">
                <span>个人中心</span>
            </header>
            <div class="user-home nav-space">
               <a class="user-info table-mode" href="#">
            <div class="table-cell">
                 <img src="./images/ava.jpg" class="avatar">
             </div>
            <div class="table-cell txt-left">
                <p class="nickname">${pd.REALNAME}</p>
                
            </div>
            <div class="table-cell iconfont icon-right-jiantou"></div>
        </a>
        
        <div class="menu-group">
            
            <a class="user-menu table-mode" href="<%=basePath%>/userbasic/goEditDetail.do">
                <div class="table-cell iconfont icon-email txt-right"></div>
                <div class="table-cell menu-name txt-left">我的资料
                </div>
                <div class="table-cell iconfont icon-right-jiantou"></div>
            </a>
            
            <a class="user-menu table-mode" href="<%=basePath%>/userbasic/goPhotoWall.do">
                <div class="table-cell iconfont icon-wujiaoxingkong1 txt-right"></div>
                <div class="table-cell menu-name txt-left">照片墙
                </div>
                <div class="table-cell iconfont icon-right-jiantou"></div>
            </a>
            
            <a class="user-menu table-mode" href="<%=basePath%>/userbasic/goPhotoLoad.do">
                <div class="table-cell iconfont icon-wujiaoxingkong1 txt-right"></div>
                <div class="table-cell menu-name txt-left">图片墙上传
                </div>
                <div class="table-cell iconfont icon-right-jiantou"></div>
            </a>
            
        </div>
        
        <div class="menu-group">
            
             <a class="user-menu table-mode" href="http://wap.feekr.com/user/feedback?id=37306">
                <div class="table-cell iconfont icon-fankui txt-right"></div>
                <div class="table-cell menu-name txt-left">我心动过的人
                    
                </div>
                <div class="table-cell iconfont icon-right-jiantou"></div>
            </a>

                 <a class="user-menu table-mode" href="http://wap.feekr.com/user/feedback?id=37306">
                <div class="table-cell iconfont icon-fankui txt-right"></div>
                <div class="table-cell menu-name txt-left">心动过我的人
                    
                </div>
                <div class="table-cell iconfont icon-right-jiantou"></div>
                 </a>


            <a class="user-menu table-mode" href="http://wap.feekr.com/user/feedback?id=37306">
                <div class="table-cell iconfont icon-fankui txt-right"></div>
                <div class="table-cell menu-name txt-left">反馈
                    
                </div>
                <div class="table-cell iconfont icon-right-jiantou"></div>
            </a>


            <a class="user-menu table-mode" href="http://wap.feekr.com/user/setting?id=37306">
                <div class="table-cell iconfont icon-Set_up txt-right"></div>
                <div class="table-cell menu-name txt-left">设置
                    
                </div>
                <div class="table-cell iconfont icon-right-jiantou"></div>
            </a>
            
        </div>
        </div>
        </div>
    </div>

    <script type="text/html" id="user-tpl">
        <a class="user-info table-mode" href="{{'author' | router }}?id={{user.authorId}}&pv_from=mypage">
            <div class="table-cell">
                {{if user.avatarUrl}}
                <img src="{{user.avatarDomain}}{{user.avatarUrl}}!180X180" class="avatar">
                {{else}}
                <img src="http://res.ifeekr.com/wap/avatar/fxb-avatar-180X180.jpg" class="avatar">
                {{/if}}
            </div>
            <div class="table-cell txt-left">
                <p class="nickname">{{user.nickname}}</p>
                {{if user.type == 'fxb'}}
                <p class="fxb">飞小编</p>
                {{/if}}
            </div>
            <div class="table-cell iconfont icon-right-jiantou"></div>
        </a>
        {{each menu as v i}}
        <div class="menu-group">
            {{each v as val idx}}
            <a class="user-menu table-mode" href="{{val.link}}?id={{user.authorId}}">
                <div class="table-cell iconfont {{val.icon}} txt-right"></div>
                <div class="table-cell menu-name txt-left">{{val.name}}
                    {{if val.name=="消息" && !!message}}<span class="msg-count">{{message}}</span>{{/if}}
                </div>
                <div class="table-cell iconfont icon-right-jiantou"></div>
            </a>
            {{/each}}
        </div>
        {{/each}}
    </script>

    <script>
        $(function () {
            var menu = [
                    [{
                        icon: 'icon-email',
                        name: '消息',
                        link: '/user/comment'
                    },
                        {
                            icon: 'icon-wujiaoxingkong1',
                            name: '收藏',
                            link: '/user/favourite'
                        }],
                    [{
                        icon: 'icon-Set_up',
                        name: '设置',
                        link: '/user/setting'
                    }, {
                        icon: 'icon-fankui',
                        name: '反馈',
                        link: '/user/feedback'
                    }]
                ],
                container = $('.user-home');
/*
            $.getAjax({
                url: api.userHome,
                data: {authUid: $.getCookie('uid')}
            }, function (res) {
                var data = res.result,
                    avatar;
                data.menu = menu;
                container.html(template('user-tpl', data));
            });*/
        })
    </script>

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


<div class="nav">
        <nav class="nav-wrap table-mode">
             <div class="table-cell">
                
                <a class="nav-menu nav-0" href="<%=basePath%>/userbasic/goIndex.do">
                    <span class="iconfont icon-shouyenormal"></span>
                    <span class="nav-name">首页</span>
                </a>
                
            </div>
            

           

            <div class="table-cell">
                <a class=" nav-menu nav-3 v-link-active" href="<%=basePath%>/userbasic/goPersonIndex.do">
                    <span class="iconfont icon-wodepressed"></span>
                    <span class="nav-name">我的</span>
                </a>
                
            </div>
            
        </nav>
    </div>

    </body>

    </html>