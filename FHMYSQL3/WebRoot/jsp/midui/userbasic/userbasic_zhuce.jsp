<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0029)http://wap.feekr.com/register -->
<html lang="zh" class="hb-loaded"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
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
</script>
<div class="inner-wrap register-wrap">
    <header class="back-title">
        <a href="javascript:history.go(-1)" class="iconfont icon-fanhui" data-history="back"></a>
        <span class="style-title">注册</span>
    </header>
    <div class="reg-container body-space-large">
        <form onsubmit="return false" class="reg-form">
            <div class="username-wrap input-wrap">
                <span class="iconfont icon-yonghu"></span>
                <input type="text" class="hide">
                <input type="text" class="account reg-input" placeholder="请输入昵称" data-type="cellphone">
            </div>
            <div class="password-wrap input-wrap">
                <span class="iconfont icon-mima"></span>
                <input type="password" class="hide">
                <input type="password" class="pwd reg-input" placeholder="请设置密码（6位数以上数字或字母）" data-type="password">
            </div>
            <button type="submit" class="reg-submit submit-btn">注册</button>
        </form>
        <div class="policy info">您已同意并愿意遵守觅对的<span class="normal policy-btn">用户协议</span>.</div>
    </div>
</div>
<!--协议-->
<div class="policy-wrap">
    <header class="back-title">
        <a href="http://wap.feekr.com/register" class="iconfont icon-fanhui go-back"></a>
        <span class="style-title">用户协议</span>
    </header>
    <div class="content body-space-large">
        <p>1. 适用范围</p>
        <p>Feekr网络（以下简称"Feekr"）根据以下服务条款为您提供服务。这些条款可由Feekr随时更新，且毋须另行通知。Feekr使用协议（以下简称"使用协议"）一旦发生变动，Feekr将在网页上公布修改内容。修改后的使用协议一旦在网页上公布即有效代替原来的使用协议。此外，当您使用Feekr特殊服务时，您和Feekr应遵守Feekr随时公布的与该服务相关的指引和规则。前述所有的指引和规则，均构成本使用协议的一部分。</p>
        <p>您在使用Feekr提供的各项服务之前，应仔细阅读本使用协议。如您不同意本使用协议及/或随时对其的修改，请您立即停止使用Feekr所提供的全部服务；您一旦使用Feekr服务，即视为您已了解并完全同意本使用协议的各项内容，包括Feekr对使用协议随时所做的任何修改，并成为Feekr用户（以下简称"用户"）。</p>
        <p>2.服务说明</p>
        <p>Feekr向用户提供网络服务，由Feekr根据实际情况提供，例如：用户可以在Feekr中制定旅游计划，查看相关旅游目的地信息，分享旅途中的趣事等，还有发布或参加各类线上及线下活动。发布并分享对文章、话题、活动、图片的评论。您了解并同意，本服务仅依其当前所呈现的状况提供，对于任何用户信息或个人化设定之时效、删除、传递错误、未予储存或其它任何问题，Feekr均不承担任何责任。Feekr保留不经事先通知为升级、维护或其它目的暂停本服务任何部分的权利。</p>
        <p>Feekr会不定期的通过站内积分，来奖励或兑换真实物品，最终解释权归Feekr所有。</p>
        <p>请用户理解，Feekr仅提供相关的网络服务，除此之外与相关网络服务有关的设备（如个人电脑、手机、及其他与接入互联网或移动网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费）均应由用户自行负担。</p>
        <p>3.用户行为</p>
        <p>用户注册成功后，便成为Feekr的合法用户，会得到一个密码和帐号。用户需采取合理措施维护其密码和帐号的安全。用户对利用该密码和帐号所进行的一切活动负全部责任；由该等活动所导致的任何损失或损害由用户承担，Feekr不承担任何责任。 用户的密码和帐号遭到未授权的使用或发生其他任何安全问题，用户应当立即通知Feekr。</p>
        <p>您同意遵守中华人民共和国相关法律法规的所有规定，如您的行为违反国家法律和法规的任何规定，有可能构成犯罪的，将被追究刑事责任，并由您承担全部法律责任。</p>
        <p>同时如果Feekr有理由认为您的任何行为，包括但不限于您的任何言论和其它行为违反或可能违反国家法律和法规的任何规定，Feekr可在任何时候不经任何事先通知终止向您提供服务。</p>
        <p>4.隐私保护</p>
        <p>保护用户隐私是Feekr的一项基本政策，当你注册或发电子邮件给我们时，我们收集你个人信息的目的是：管理网站，发送密码，就你发布的内容进行沟通，并与你保持联系。在任何时候，你都可以在"个人资料"版块更新个人信息。Feekr保证不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在Feekr的非公开内容，但下列情况除外：</p>
        <p>4.1 事先获得用户的明确授权；</p>
        <p>4.2 根据有关的法律法规要求；</p>
        <p>4.3 按照相关政府主管部门的要求；</p>
        <p>4.4 为维护社会公众的利益；</p>
        <p>4.5 为维护Feekr的合法权益。</p>
        <p>5.知识产权</p>
        <p>Feekr对网站服务所包含的受知识产权或其他法律保护的资料享有相应的权利；除用户依法享有版权内容之外，本网站的整体内容版权归Feekr所有。</p>
        <p>用户在Feekr上传或发布的内容，用户应保证其为著作权人或已取得合法授权，并且该内容不会侵犯任何第三方的合法权益，用户同意授予Feekr所有上述内容在全球范围内的免费、不可撤销的、永久的、可再许可或转让的独家使用权许可，据上述许可Feekr将有权以展示、推广及其他不为我法律所禁止的方式使用前述内容。</p>
        <p>Feekr有权利对用户在Feekr上传或发布的内容进行再编辑，并有权利再次出版发行，但如果产生收益，将通过一定渠道返还给著作权人。</p>
        <p>经由Feekr网站传送的文章及其它内容，将受到法律的保护；除该等文章及其它内容上载的用户所享有的版权，未经 Feekr明示授权许可，其他用户不得进行修改、出租、散布或衍生其他作品。</p>
        <p>Feekr所有设计图样以及其他图样、产品、程序及服务名称，均为Feekr及/或其关联公司所享有的商标、标识。任何人不得使用、复制或用作其他用途。</p>
        <p>6.免责声明</p>
        <p>Feekr对于任何自本网站而获得的他人的信息、内容或者广告宣传等任何资讯（以下统称"信息"），不保证真实、准确和完整性。如果任何单位或者个人 通过上述"信息"而进行任何行为，须自行甄别真伪和谨慎预防风险，否则，无论何种原因，本网站不对任何非与本网站直接发生的交易和/或行为承担任何直接、 间接、附带或衍生的损失和责任。</p>
        <p>Feekr有权但无义务，改善或更正本网站任何部分之任何疏漏、错误。 </p>
        <p>Feekr不保证（包括但不限于）： </p>
        <p>- 本网站适合用户的使用要求； </p>
        <p>- 本网站不受干扰，及时、安全、可靠或不出现错误；</p>
        <p>- 用户经由本网站取得的任何产品、服务或其他材料符合用户的期望。 </p>
        <p>用户使用经由本网站收听的下载的或取得的任何资料，其风险自行负担；因该等使用导致用户电脑系统损坏或资料流失，用户应负完全责任； </p>
        <p>基于以下原因而造成的利润、商业信誉、资料损失或其他有形或无形损失，Feekr不承担任何直接、间接、附带、衍生或惩罚性的赔偿： </p>
        <p>- 本网站使用或无法使用； </p>
        <p>- 经由本网站购买或取得的任何产品、资料或服务；</p>
        <p>- 用户资料遭到未授权的使用或修改；</p>
        <p>- 其他与本网站相关的事宜。 </p>
        <p>- 第三方以任何方式发布或投递欺诈性信息，或诱导用户受到经济损失。</p>
        <p>7.关于第三方链接</p>
        <p>Feekr网络服务可能会提供与其他网站或资源进行链接。对于前述网站或资源是否可以利用，Feekr网络不承担担保责任。因用户使用上述网站或资源所产生的损失或损害，Feekr也不负担任何责任。</p>
        <p>8.国际使用之特别敬告</p>
        <p>您已了解国际互联网的无国界性，同意遵守当地所有关于网上行为及内容之法律法规。您特别同意遵守有关从中国或您所在国家或地区输出信息之传输的所有适用法律法规。</p>
        <p>9.赔偿</p>
        <p>由于您通过本服务提供、发布或传送之内容、您与本服务连线、您违反本使用协议、或您侵害他人任何权利因而衍生或导致任何第三人提出任何索赔或请求，包括合理的律师费，您同意赔偿Feekr及其子公司、关联企业、高级职员、代理人、品牌共有人或其它合作伙伴及员工，并使其免受损害，并承担由此引发的全部法律责任。</p>
        <p>10.终止服务</p>
        <p>您同意Feekr基于其自行之考虑，因任何理由，包含但不限于缺乏使用，或Feekr认为您已经违反本使用协议的文字及精神，终止您的帐号或本服务之使用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本使用协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并同意，Feekr可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您的帐号及相关信息和文件被关闭或删除，Feekr对您或任何第三人均不承担任何责任。</p>
        <p>11.法律的适用和管辖</p>
        <p>本使用协议及您与Feekr之关系，均受到中华人民共和国法律管辖。您与Feekr就本服务、本使用协议或其它有关事项发生的争议，应首先友好协商解决，协商不成时应提请中国国际经济贸易仲裁委员会仲裁，仲裁裁决是终局性的，对双方均有约束力；</p>
        <p>Feekr未行使或执行本使用协议任何权利或规定，不构成对前述权利或权利之放弃；</p>
        <p>倘本使用协议之任何规定因与中华人民共和国法律抵触而无效，您依然同意应依照法律，努力使该规定所反映之当事人意向具备效力，且本使用协议其它规定仍应具有完整的效力及效果；</p>
        <p>本使用协议之标题仅供方便而设，不具任何法律或契约效果；</p>
        <p>Feekr对本使用协议享有最终解释权。</p>
    </div>
</div>

    <!--数据统计-->
    <div style="display:none;">
        <script async="async" src="./Feekr_regedit_files/stat.php" language="JavaScript"></script>
        <script async="async">
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-74126045-1', 'auto');
            ga('send', 'pageview');
        </script>
    </div>


<script type="text/html" id="step-second-reg">
    <form onsubmit="return false" class="step-second-reg">
        <div class="username-wrap input-wrap">
            我们已发送短信验证到 {{cellphone}}
        </div>
        <div class="code-wrap input-wrap">
            <input type="text" class="sms-code reg-input" placeholder="输入验证码" data-type="code">
            <div class="code-timer">60秒</div>
        </div>
        <button type="submit" class="reg-finish-submit submit-btn">注册完成</button>
        <div class="voice-code info">没收到验证码？试试 <span class="normal voice-btn">语音验证</span></div>
    </form>
</script>

<script>
 
    $(function () {
        $.loading({
            status: false
        });
        var policy = $('.policy-wrap'),
            wrap = $('body'),
            container = $('.reg-container'),
            submitData = {};
        wrap.on('click', '.policy-btn', function () {
            policy.addClass('show');
        });
        policy.on('click', '.go-back', function (e) {
            e.preventDefault();
            policy.removeClass('show');
        });

//        验证码倒计时
        function timer(seconds, container) {
            var go = setInterval(function () {
                if (seconds > 1) {
                    seconds--;
                    container.data('getcode', 'disable');
                    container.text(seconds + '秒');
                } else {
                    container.data('getcode', 'able');
                    container.text('重新发送');
                    clearInterval(go);
                }
            }, 1000);
        }

//        注册
        wrap.on('click', '.reg-submit', function () {
            $('.reg-input').each(function (i, v) {
                var type = $(this).data('type');
                submitData[type] = $.trim($(this).val());
            });
            if (!submitData.cellphone) {
                $.alert('请填写昵称');
            } else if (!submitData.password) {
                $.alert('请设置密码');
            } /*else if (!$.validatePhoneNumber(submitData.cellphone)) {
                $.alert('请填写正确的手机号码');
            }*/ else if (submitData.password.length < 6) {
                $.alert('请设置6位数以上数字或字母的密码');
            } else {
                   var  usernameVal=submitData.cellphone; 
                   //$.alert(usernameVal);
                     $.ajax({
                            type: "POST",
                            url: '<%=basePath%>/userbasic/hasUserName.do',
                            data: {USERNAME: usernameVal},
                            dataType:'json',
                            cache: false,
                            success: function(data){
                                 if("success" == data.result){
                                     $.ajax({
                                        type: "POST",
                                        url: "<%=basePath%>/userbasic/saveZhuce.do",
                                        data: {
                                                USERNAME: submitData.cellphone, 
                                                PASSWORD: submitData.password,
                                                STATUS: '0'
                                            },
                                        dataType:'json',
                                        cache: false,
                                        success: function(data){
                                           //  $.alert('注册完成');
                                           location.href = '<%=basePath%>/userbasic/goEdit.do';
                                        },
                                       error: function () {
                                          $.alert('服务器出错!');
                                        }
                                       });  
                                 }else{
                                     $.alert('该昵称已经存在,请重新输入');
                                 }
                            }
                        });

                  
 
                 
            }
        });

//        重新获取验证码
        wrap.on('click', '.code-timer', function () {
            var isAble = $(this).data('getcode');
            if (isAble == 'able') {
                $.getAjax({
                    url: api.smsCode,
                    type: 'POST',
                    data: {
                        cellphone: submitData.cellphone
                    },
                    beforeSend: function () {
                        $.loading({
                            status: false
                        });
                    }
                }, function (res) {
                    $.alert('验证码已发送');
                    timer(60, $('.code-timer'));
                });
            }
        });

//        语音验证码
        wrap.on('click', '.voice-btn', function () {
            $.getAjax({
                url: api.voiceCode,
                type: 'POST',
                data: {
                    cellphone: submitData.cellphone
                },
                beforeSend: function () {
                    $.loading({
                        status: false
                    });
                }
            }, function (res) {
                $.alert('验证码已发送');
            });
        });

//        注册完成
        wrap.on('click', '.reg-finish-submit', function () {
            submitData.code = $.trim($('.sms-code').val());
            if (!submitData.code) {
                $.alert('请填写验证码');
            } else {
                $.getAjax({
                    url: api.register,
                    type: 'POST',
                    data: submitData
                }, function (res) {
                    document.cookie = 'uid=' + res.result.authUid + ';domain=' + globalConfig.domain.cookieDomain + ';expires=' + $.setTime(90);
                    location.href = '/user/info';
                });
            }
        });
    })
</script>
</body></html>