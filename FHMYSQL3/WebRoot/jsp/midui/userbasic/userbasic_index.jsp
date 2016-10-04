<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	 <base href="<%=basePath%>">
	 <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <meta name="x5-orientation" content="portrait">
   
    <link rel="stylesheet" type="text/css" href="midui/css/index.css">    
    <script async="" src="midui/js/analytics.js"></script>
    <script type="text/javascript" src="midui/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="midui/js/template.js"></script>
    <script type="text/javascript" src="midui/js/config.js"></script>
    <script type="text/javascript" src="midui/js/utils.js"></script>
    <script type="text/javascript" src="midui/js/fastclick.js"></script>
    <script type="text/javascript" src="midui/js/swiper.jquery.min3.3.1.js"></script>
    <script type="text/javascript" src="midui/js/jquery.lazyload.min.js"></script>  
      <script src="midui/js/jweixin-1.0.0.js"></script>
    <title>觅对</title>
		
	</head>
<body>
	
	
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
</script>    

        <div class="inner-wrap home-wrap theme-mode nav-space">
     
        <div class="slide-wrap swiper-container swiper-container-horizontal" data-target="clear">

            <div class="swiper-wrapper" style="transform: translate3d(-3200px, 0px, 0px); transition-duration: 300ms;">
            
            </div>
            <div class="swiper-pagination swiper-pagination-bullets"><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet"></span><span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span></div>
        </div>
        <div class="list-wrap body-space">
            <div class="item-container">
        <div class="date-title">
            <p class="regular-font">今日</p>
            <p class="sub-title">觅对，每天为你推荐</p>
        </div>
        
        
        <div class="column-item-wrap">
            <div class="column-info">
                <a href="http://wap.feekr.com/column/article?id=k5lqmw==&amp;pv_from=symrtj" class="column-item column-section" data-target="ajax">
                    <img data-original="http://newscover.b0.upaiyun.com/2016/09/14/23220627e80d38fba2f3d4359b87b8f0943749.jpg!600X400" alt="" class="" src="midui/images/06.jpg" style="display: block;">
                </a>
             
            </div>
             
                <div class="nickname">WILL</div>
                <a href="#">
                <div class="avatar"><img src="midui/images/mi_heart@4x.png">
                </div>
                </a>
            
                <div style="clear:both"></div>
                <div class="title regular-font tags">
                <span>23岁</span>
                 <span>180cm</span>
                 <span>本科</span>
                 <span>郑州</span>
                </div>
           
        </div>

        
        
        <div class="date-title">
            <p class="regular-font">昨日</p>

            <p class="sub-title">时间，一刻也不等人</p>
        </div>
        
        
       
        <div class="column-item-wrap">
            <div class="column-info">
                <a href="http://wap.feekr.com/column/article?id=k5lqmw==&amp;pv_from=symrtj" class="column-item column-section" data-target="ajax">
                    <img data-original="http://newscover.b0.upaiyun.com/2016/09/14/23220627e80d38fba2f3d4359b87b8f0943749.jpg!600X400" alt="" class="" src="midui/images/06.jpg" style="display: block;">
                </a>
             
            </div>
             
                <div class="nickname">WILL LIKE</div>
                <a href="#">
                <div class="avatar"><img src="midui/images/mi_heart@3x.png">
                </div>
                </a>
            
                <div style="clear:both"></div>
                <div class="title regular-font tags">
                <span>23岁</span>
                 <span>180cm</span>
                 <span>本科</span>
                 <span>郑州</span>
                </div>
           
        </div>
        
        
        <div class="date-title">
            <p class="regular-font">往期推荐</p>
        </div>
        
        
         <div class="column-item-wrap">
            <div class="column-info">
                <a href="http://wap.feekr.com/column/article?id=k5lqmw==&amp;pv_from=symrtj" class="column-item column-section" data-target="ajax">
                    <img data-original="http://newscover.b0.upaiyun.com/2016/09/14/23220627e80d38fba2f3d4359b87b8f0943749.jpg!600X400" alt="" class="" src="midui/images/06.jpg" style="display: block;">
                </a>
            </div>
             
                <div class="nickname">WILL LIKE</div>
                <a href="#">
                <div class="avatar"><img src="midui/images/mi_heart@4x.png">
                </div>
                </a>
            
                <div style="clear:both"></div>
                <div class="title regular-font tags">
                <span>23岁</span>
                 <span>180cm</span>
                 <span>硕士</span>
                 <span>郑州</span>
                </div>
        </div>
    
        
        </div>
            <div class="loading-notice" style="display: none;"><div id="global-inline-loading" class="global-inline-loading global-loading"><div class="spinner"><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div></div><span>加载中...</span></div></div>
        </div>
    </div>
    <script type="text/html" id="slidepic-tpl">
        {{each slideItem as v i}}
        <a class="item swiper-slide" href="{{v.url}}">
            <img
                data-src="{{v.thumb}}"
                class="thumb-slide swiper-lazy" alt="">

            <div class="swiper-lazy-preloader">
                <div class="global-inline-loading global-loading">
                    <div class="spinner">
                        <div class="rect2"></div>
                        <div class="rect3"></div>
                        <div class="rect4"></div>
                    </div>
                </div>
            </div>
        </a>
        {{/each}}
    </script>
   
    <script>
        $(function () {
            var
                slideTpl,
                slideContainer = $('.swiper-wrapper'),
                recommendTpl,
                recommendContainer = $('.item-container'),
                page = 1,
                win = $(window),
                DocHeight,
                isScroll = true;
                
                //轮播 
                  var data={};
                  data.result = {
                    "slideItem": [
                    {
                      "url":"#",
                      "thumb":"midui/images/01.jpg"
                    },
                     {
                      "url":"#",
                      "thumb":"midui/images/01.jpg"
                    },
                     {
                      "url":"#",
                      "thumb":"midui/images/01.jpg"
                    }
                ]};
                slideTpl = template('slidepic-tpl', data.result);
                slideContainer.html(slideTpl);
                var swiper = new Swiper('.slide-wrap', {
                    pagination: '.swiper-pagination',
                    loop: true,
                    preloadImages: false,
                    lazyLoading: true,
                    autoplay: 3000,
                    autoplayDisableOnInteraction: false
                });
                
            var store = sessionStorage,
                storeData;
                
                
        //  滚动加载更多
            function loadMore(p) {
                win.on('scroll', function () {
                    if (isScroll) {
                        DocHeight = $(document).height();
                        if ($(window).scrollTop() + document.documentElement.clientHeight > DocHeight - 600) {
                            isScroll = false;
                            $.getAjax({
                                url: api.selection,
                                data: {page: store.page},
                                status: false,
                                beforeSend: function () {
                                    $('.loading-notice').inlineLoading({
                                        text: '加载中...'
                                    });
                                }
                            }, function (res) {
                                var data = res;
                                $('.loading-notice').inlineLoading({
                                    status: 'close'
                                });

                                if (data.result.recommend.ago.length > 0 && data.result.page) {
                                    recommendTpl = template('ago-tpl', data.result);
                                    recommendContainer.append(recommendTpl);
                                    store.page = data.result.page;
                                    isScroll = true;
                                    storeData.recommend.ago = storeData.recommend.ago.concat(data.result.recommend.ago);

                                    $("img.lazy").lazyload({
                                        effect: "fadeIn",
                                        threshold: 200
                                    }).removeClass('lazy');

                                } else {
                                    isScroll = false;
                                }
                            });
                        }
                    }
                });
            }

            //        sessionStorage存储列表数据
            $(document).on('click', 'a[data-target=ajax]', function (e) {
                e.preventDefault();
                var url = $(this).attr('href');

                store.listData = JSON.stringify(storeData);
//            获取当前列表位置
                store.top = $(this).offset().top;
                store.type = "index";
                location.href = url;
            });
            //  判断是否有本地存储
            if (store.type == "index") {
                storeData = JSON.parse(store.listData);
                recommendTpl = template('recommend-tpl', storeData);
                recommendContainer.html(recommendTpl);

                $.loading({
                    status: false
                });

                $("img.lazy").lazyload({
                    effect: "fadeIn",
                    threshold: 200
                }).removeClass('lazy');

                setTimeout(function () {
                    $('html, body').scrollTop(store.top - 100);
                }, 300);

            } else {
                $.getAjax({
                    url: api.selection
                }, function (res) {
                    var data = res;
                    storeData = $.extend(true, {}, data.result);
                    storeData.recommend.ago = [];
                    recommendTpl = template('recommend-tpl', data.result);
                    recommendContainer.html(recommendTpl);
                    store.page = data.result.page;
                    $("img.lazy").lazyload({
                        effect: "fadeIn",
                        threshold: 200
                    }).removeClass('lazy');
                });
            }
            loadMore();
        });
    </script>


<div class="nav">
        <nav class="nav-wrap table-mode">
            <div class="table-cell">
                <a class=" nav-menu nav-0 v-link-active" href="01.Feekr_首页.html">
                    <span class="iconfont icon-shouyepressed"></span>
                    <span class="nav-name">首页</span>
                </a>
            </div>
            
            <div class="table-cell">
                
                <a class="nav-menu nav-3" href="05.Feekr_个人中心.html">
                    <span class="iconfont icon-wodenormal"></span>
                    <span class="nav-name">我的</span>
                </a>
                
            </div>
            
        </nav>
    </div>
    
</body>
</html>