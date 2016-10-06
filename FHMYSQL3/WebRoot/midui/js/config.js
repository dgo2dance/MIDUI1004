var globalConfig = {};
//全局变量配置
(function () {
  var host = location.host, curConfig = false;
  var config = {
    local: {  // 本地
      domain: ['127.0.0.1:8080'],
      config: {
        domain: 'http://127.0.0.1:8080/FHMYSQL3',  //  api接口domain
        cookieDomain: '.f2.cn',
        host: 'wap.f2.cn'
      }
    },
    test: {  // 测试
      domain: ['twap.feekr.com'],
      config: {
        domain: 'http://twapi.feekr.com',  //  api接口domain
        cookieDomain: '.feekr.com',
        host: 'twap.feekr.com'
      }
    },
    online: {  // 线上
      domain: ['joy1joy.com'],
      config: {
        domain: 'http://joy1joy.com/FHMYSQL3',  //  api接口domain
        cookieDomain: '.feekr.com',
        host: 'wap.feekr.com'
      }
    }
  };

  $.each(config, function (k, v) {
    curConfig = v.domain.some(function (val, idx) {
      return host == val;
    });
    if(curConfig) {
      globalConfig.domain  = v.config;
      return false;
    }
  });
})();

// api接口
var api = {
  slideThumb: '/strategy/slideThumb',  //首页轮播
  indexList:'/userbasic/indexList',  //首页List展示
  personInfo:'/userbasic/personInfo',  //获取个人信息
  like:'/like/savelike',  //点赞
  love:'/love/saveLove',  //心动按钮
};


//  配置域名
(function () {
  var i;
  for(i in api) {
    api[i] = globalConfig.domain.domain + api[i];
  }
})();
