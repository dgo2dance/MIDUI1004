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
	
	<div id="global-overlayer" class="global-overlayer overlayer-transparent" style="display: none;"></div>
<div id="global-loading" class="global-loading" style="display: none;">
    <div class="spinner">
        <div class="rect2"></div>
        <div class="rect3"></div>
        <div class="rect4"></div>
    </div>
    <p class="loading-txt">加载中...</p>
</div>
<div class="global-alert" style="z-index: 10001;">
    <div class="alert-content">+1</div>
</div>

<div class="wrap play-detail-wrap">

    <div class="inner-wrap detail-wrap">
   
 </div>
</div>
<div class="third-login-slide">
    <div class="table-mode login-list">
        <div class="table-cell">
            <a class="thirdparty douban-share" href="http://www.douban.com/recommend/?url=http%3A%2F%2Fwap.feekr.com%2Fplay%2Fdetail%3Fplay%3Dlpdtlw%3D%3D%26pv_from%3Dxbkjwflb%26from%3Ddouban&amp;name=%E6%8E%A8%E8%8D%90Feekr%E9%A3%9E%E5%B0%8F%E7%BC%96--%E5%85%89%E5%A4%B4666666--%E5%9C%A8%23%E5%8E%A6%E9%97%A8%23%E7%9A%84%E7%8E%A9%E6%B3%95%EF%BC%9A%E5%8E%A6%E9%97%A8%E5%8F%AA%E8%83%BD%E7%94%A8%E6%89%8B%E6%8A%93%E7%9A%84%E6%B5%B7%E9%B2%9C%EF%BC%8C18%E9%A3%9F%E5%90%A7HOUSE&amp;text=%E8%AF%B4%E9%81%93%E9%B9%AD%E5%B2%9B%EF%BC%8C%E6%B5%B7%E9%B2%9C%E6%98%AF%E4%B8%80%E5%AE%9A%E6%98%AF%E4%B8%8D%E8%83%BD%E9%94%99%E8%BF%87%E7%9A%84%E4%B8%80%E7%8E%AF%EF%BC%8C%E4%BB%A4%E9%83%8E%E6%BB%A1%E7%9B%AE%E7%9A%84%E6%B5%B7%E9%B2%9C%EF%BC%8C%E4%B9%9F%E6%98%AF%E8%AE%A9%E8%BF%BD%E6%B1%82%E5%AE%8C%E7%BE%8E%E7%9A%84%E6%8C%91%E7%BA%A2%E4%BA%86%E7%9C%BC%EF%BC%8C%E4%BC%BC%E4%B9%8E%E6%AF%8F%E4%B8%80%E5%AE%B6%E9%83%BD%E5%BE%88%E6%A3%92%E3%80%82%E4%BD%86..." target="_parent" title="使用豆瓣"><span class="iconfont icon-douban"></span></a>
        </div>
        <div class="table-cell">
            <a class="thirdparty zone-share" href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=http%3A%2F%2Fwap.feekr.com%2Fplay%2Fdetail%3Fplay%3Dlpdtlw%3D%3D%26pv_from%3Dxbkjwflb%26from%3Dqzone&amp;showcount=1&amp;desc=&amp;summary=%E8%AF%B4%E9%81%93%E9%B9%AD%E5%B2%9B%EF%BC%8C%E6%B5%B7%E9%B2%9C%E6%98%AF%E4%B8%80%E5%AE%9A%E6%98%AF%E4%B8%8D%E8%83%BD%E9%94%99%E8%BF%87%E7%9A%84%E4%B8%80%E7%8E%AF%EF%BC%8C%E4%BB%A4%E9%83%8E%E6%BB%A1%E7%9B%AE%E7%9A%84%E6%B5%B7%E9%B2%9C%EF%BC%8C%E4%B9%9F%E6%98%AF%E8%AE%A9%E8%BF%BD%E6%B1%82%E5%AE%8C%E7%BE%8E%E7%9A%84%E6%8C%91%E7%BA%A2%E4%BA%86%E7%9C%BC%EF%BC%8C%E4%BC%BC%E4%B9%8E%E6%AF%8F%E4%B8%80%E5%AE%B6%E9%83%BD%E5%BE%88%E6%A3%92%E3%80%82%E4%BD%86...&amp;title=%E6%8E%A8%E8%8D%90Feekr%E9%A3%9E%E5%B0%8F%E7%BC%96--%E5%85%89%E5%A4%B4666666--%E5%9C%A8%23%E5%8E%A6%E9%97%A8%23%E7%9A%84%E7%8E%A9%E6%B3%95%EF%BC%9A%E5%8E%A6%E9%97%A8%E5%8F%AA%E8%83%BD%E7%94%A8%E6%89%8B%E6%8A%93%E7%9A%84%E6%B5%B7%E9%B2%9C%EF%BC%8C18%E9%A3%9F%E5%90%A7HOUSE&amp;site=http%3A%2F%2Fwap.feekr.com%2Fplay%2Fdetail%3Fplay%3Dlpdtlw%3D%3D%26pv_from%3Dxbkjwflb%26from%3Dqzone&amp;pics=http://play01.b0.upaiyun.com/2015/10/08/021929afc8add076e54a3d1f12af2f5c68851b.jpg!100X100" target="_parent" title="使用腾讯QQ"><span class="iconfont icon-qzone"></span></a>
        </div>
        <div class="table-cell">
            <a class="thirdparty weibo-share" href="http://service.weibo.com/share/share.php?url=http%3A%2F%2Fwap.feekr.com%2Fplay%2Fdetail%3Fplay%3Dlpdtlw%3D%3D%26pv_from%3Dxbkjwflb%26from%3Dweibo&amp;appkey=1866089189&amp;title=%E6%8E%A8%E8%8D%90Feekr%E9%A3%9E%E5%B0%8F%E7%BC%96--%E5%85%89%E5%A4%B4666666--%E5%9C%A8%23%E5%8E%A6%E9%97%A8%23%E7%9A%84%E7%8E%A9%E6%B3%95%EF%BC%9A%E5%8E%A6%E9%97%A8%E5%8F%AA%E8%83%BD%E7%94%A8%E6%89%8B%E6%8A%93%E7%9A%84%E6%B5%B7%E9%B2%9C%EF%BC%8C18%E9%A3%9F%E5%90%A7HOUSE&amp;pic=http://play01.b0.upaiyun.com/2015/10/08/021929afc8add076e54a3d1f12af2f5c68851b.jpg!100X100&amp;ralateUid=2860309182&amp;language=zh_cn" target="_parent" title="使用新浪微博">
                <span class="iconfont icon-weibo"></span></a>
        </div>
    </div>
    <div class="cancel-wrap"><a href="javascript:;">取消</a></div>
</div>

<script type="text/html" id="detail-tpl">
    <header class="article-header">
        <div class="cover-thumb">
            <img src="{{HEADIMG}}" class="play-cover">
        </div>
        <div class="action clearfix">
            <a href="javascript:history.go(-1);" data-history="back" class="iconfont pull-left icon-fanhui"></a>
        </div>
    </header>
    <article class="article-wrap">
     <section class="tips">
            <h3 class="nickName">{{USERNAME}}</h3>
             <div><div class="like">{{XINDONG}}个人喜欢她  <span class="iconfont icon-xinshixin2"></span></div></div>
              <div class="clear:both"></div>
        </section>
          <section class="tips">
            <h3 class="section-title">照片墙</h3>
        </section>
        <section class="tips">
            <h3 class="section-title">基本资料</h3>

            <p class="clearfix text"><span class="title pull-left">年龄：</span><span class="detail pull-left">{{BIRTHDAY}}</span>
            </p>
            
            <p class="clearfix text"><span class="title pull-left">城市：</span><span class="detail pull-left">{{CITY}}</span>
            </p>
            
            <p class="clearfix text"><span class="title pull-left">身高：</span><span class="detail pull-left">{{HEIGHT}}</span>
            </p>
            
            <p class="clearfix text"><span class="title pull-left">学历：</span><span class="detail pull-left">{{XUELI}}</span>
            </p>
            
             <p class="clearfix text"><span class="title pull-left">收入：</span><span class="detail pull-left">{{SHOURU}}</span>
            </p>

            <p class="clearfix text"><span class="title pull-left">职业：</span><span class="detail pull-left">{{WORK2}}</span>
            </p>
        </section>
        
        <section class="guide">
            <h3 class="section-title">择偶要求</h3>

            <div class="detail text">
                不能比我下，收入10万以上
            </div>
        </section>
        
<!--
        <section class="tags">
            <div class="tags-list">
               <h3 class="section-title">标签</h3>
                <div class="tag-item">
                    <span>小众</span>
                    |<span>美食</span>
                    |<span>海鲜</span>
                    |<span>爱文艺</span>
                </div>
            </div>
        </section>
-->


    </article>
</script>


<script type="text/html" id="action-tpl">
    <div class="user-action">
        <div class="table-mode">

            <div class="table-cell like-action">
                {{if isLiked=="false"}}
                <span class="iconfont icon-zan"></span>
                {{else}}
               <span class="iconfont icon-dianzan"></span>
                {{/if}}
                <span class="count">{{if likeCount > 0}}{{likeCount}}{{/if}}</span>
            </div>

            <div class="table-cell love-action">
                {{if isLoved=="false"}}
                <span class="iconfont icon-xin"></span>
                {{else}}
                <span class="iconfont icon-xinshixin2"></span>
                {{/if}}
            </div>

        </div>
    </div>
</script>

<script>
    //  转文本换行
    template.helper('toBr', function (data) {
        return $.textToBr(data);
    });
    $(function () {
    
    
        var UUId = $.getURLParameter('ID'),
             detailTpl,
           
             actionTpl,
             container = $('.detail-wrap'),
             commentData = [],
             isScroll = true,
             DocHeight,
             itemData = {};
        $.getAjax({
            url: api.personInfo,
            type: 'GET',
            data: {"USERBASIC_ID": UUId}
        }, function (res) {
            var data = res;
            itemData = $.extend(true, {}, data.result);
            document.title = '-觅对';
            detailTpl = template('detail-tpl', data.result.detail);
            actionTpl = template('action-tpl', data.result.action);
            container.html(detailTpl);
            $('body').append(actionTpl);


/*
            //  第三方分享数据配置
            $.get(api.share, {id: playId, source: source, type: 'play'}, function (res) {
                var result = res.result,
                    e = encodeURIComponent,
                    wb_url = location.href,
                    wb_appkey = e(result.wb_appkey),
                    wb_title = e(result.wb_title),
                    wb_ralateUid = e(result.wb_ralateUid),
                    wb_pic = result.wb_pic + '!100X100',
                    wb_desc = e(data.result.play.playContent.substr(0, 50) + '...'),
                    wb_language = e("zh_cn"),
                    from = $.getURLParameter('from');

                wb_url = wb_url.replace('&from=weibo', '').replace('&from=douban', '').replace('&from=qzone', '');

                $('.weibo-share').attr("href", "http://service.weibo.com/share/share.php?url=" + e(wb_url + '&from=weibo') + "&appkey=" + wb_appkey + "&title=" + wb_title + "&pic=" + wb_pic + "&ralateUid=" + wb_ralateUid + "&language=" + wb_language + "");
                $('.douban-share').attr("href", "http://www.douban.com/recommend/?url=" + e(wb_url + '&from=douban') + "&name=" + wb_title + "&text=" + wb_desc + "");
                $('.zone-share').attr("href", "http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=" + e(wb_url + '&from=qzone') + "&showcount=1&desc=&summary=" + wb_desc + "&title=" + wb_title + "&site=" + e(location.href + '&from=qzone') + "&pics=" + wb_pic + "");

            });
            */

            // 判断浏览器是否可以go back
            if (document.referrer == "") {
                $('a[data-history=back]').addClass('icon-shouyenormal').attr('href', '/');
            } else {
                $('a[data-history=back]').addClass('icon-fanhui');
            }

           /*
            //  微信分享
            $.wxShare({
                debug: false,  //调式模式，设置为true后会直接在网页上弹出调试信息，用于排查问题
                appId: 'wxa4c38bbc0b46c147',
                timestamp: 1475378899,
                nonceStr: 'Jx2BXiqfgQvNMr3n',
                signature: 'c7232232b12041efe30d32a91458dd51b16cca49',
                title: data.result.play.playTitle + ' - Feekr', // 分享标题
                link: location.href,
                imgUrl: data.result.play.domain + data.result.play.cover, // 分享图标
                desc: data.result.play.playContent, // 分享描述
            });
            */
            
        });

    



//        第三方登录
        $(document).on('click', '.share-item', function () {
            $.overlayer({status: true});
            $('.third-login-slide').addClass('active');
            $(document).on('touchmove', function (e) {
                e.preventDefault();
            });
        });

        $(document).on('click', '.cancel-wrap a', function () {
            $(document).off('touchmove');
            $.overlayer({status: false});
            $('.third-login-slide').removeClass('active');
        });

//        玩法收藏
        $(document).on('click', '.collect-action', function () {
            actionFn({
                url: api.collect,
                key: 'isCollected',
                success: '已收藏',
                cancel: '已取消收藏'
            });
        });

//        点赞
        $(document).on('click', '.like-action', function () {
            actionFn({
                url: api.like,
                key: 'isLiked',
                success: '+1',
                cancel: '已取消赞'
            });
        });
        
//        点心动 
        $(document).on('click', '.love-action', function () {
            actionFn({
                url: api.love,
                key: 'isLoved',
                success: '心动成功',
                cancel: '已取消心动'
            });
        });
        
        

        function actionFn(data) {
            $.getAjax({
                url: data.url,
                data: {
                    LOVEUSER: UUId,
                    authUid: $.getCookie('uid')
                },
                beforeSend: function () {
                    $.loading({
                        status: false
                    })
                }
            }, function (res) {
                if (res.message == "true" ) {
                    itemData.action[data.key] = !itemData.action[data.key];
                    if (typeof(res.result.like)!="undefined") {
                        itemData.action.likeCount = res.result.like.count
                    }
                    actionTpl = template('action-tpl', itemData.action);
                    $('.user-action').remove();
                    $('body').append(actionTpl);
                    if (itemData.action[data.key]) {
                        $.alert(data.success)
                    } else {
                        $.alert(data.cancel)
                    }
                }
            });
        }
    });

</script>



    
</body>
</html>