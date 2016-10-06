// 模版路由配置
template.helper('router', function (url, param) {
  var router = {
    index: '/',
    themedetail: '/theme/detail',
    themelist: '/theme',
    playdetail: '/play/detail',
    playlist: '/play',
    selectcity: '/guide/selectcity',
    newplaylist: '/guide/newplaylist',
    nearby: '/guide/nearby',
    stylelist: '/play/style',
    fxblist: '/guide/fxblist',
    userHome: '/user',
    userComment: '/user/comment',
    userNotice: '/user/notice',
    userLike: '/user/like',
    feedBack: '/user/feedback',
    userSet: '/user/setting',
    author: '/user/author',
    userFavor: '/user/favourite',
    userInfo: '/user/info',
    about: '/about',
    register: '/register',
    officialColumnHot: '/column/officialColumnHot',
    officialColumnNew: '/column/officialColumnNew',
    spColumn: '/column/spColumnArticle',
    spColumnPlay: '/column/spColumnPlay',
    article: '/column/article',
    activity: '/activity',
    activityPlay: '/activity/play',
    playEdit: '/play/edit'
  };
  return router[url];
});

//转数组到字符串
template.helper('arrToStr', function (arr) {
  return Array.isArray(arr) ? arr.join('－') : '';
});

template.helper('toBr', function (data) {
  return data.replace(/\r?\n/g, '<br />');
});

$(function () {
  // 300ms延时fixed
  FastClick.attach(document.body);

  // 判断浏览器是否可以go back
  if (document.referrer == "") {
    $('a[data-history=back]').addClass('icon-shouyenormal').attr('href', '/');
  } else {
    $('a[data-history=back]').addClass('icon-fanhui');
  }

  //        移除定位
  $(document).on('click', '[data-target=clear]', function () {
    sessionStorage.removeItem("type");
    sessionStorage.removeItem("top");
    sessionStorage.removeItem("listData");
  });

  $.extend({
    //  封装ajax
    getAjax: function (data, callback) {
      $.ajax({
        url: data.url,
        type: data.type,
        data: data.data,
        dataType:'json',
        beforeSend: function () {
          $.loading({
            status: data.status,
            text: data.loadingText,
            closeLayer: data.closeLayer
          });

          if (typeof data.beforeSend == 'function' && data.beforeSend) {
            data.beforeSend();
          }
        },
        success: function (res) {
          var result = res;
          var redirect = data.redirect || location.href;
          $.loading({
            status: false
          });
           
          if (result.statusCode == '200') {
            if (typeof callback == 'function' && callback) {
              callback(result);
              $("img.lazy").lazyload({
                effect: "fadeIn",
                threshold: 400
              }).removeClass('lazy');
            }
          } else if (result.statusCode == '401') {
            location.href = "/";
          } else if(result.statusCode == '402') {
            //location.href = '/login?return=' + encodeURIComponent(redirect);
            location.href = '<%=basePath%>/userbasic/goLogin.do';
          } else if(result.statusCode == '40201') {
            location.href = '/login/weixin/source/5?return=' + encodeURIComponent(redirect);
          } else if(result.statusCode == '40202') {
            location.href = encodeURIComponent(result.url);
          }
          else {
            if(result.errorCode && result.errorCode.message) {
              $.alert(result.errorCode.message);
            } else {
              $.alert('服务器出错');
            }
          }
        },
        error: function () {
          $.alert('服务器出错!');
        }
      })
    },
    //  全屏loading
    loading: function (config) {
      var
          loading = $('#global-loading'),
          opts = config || '',
          tpl = $('<div id="global-loading" class="global-loading">' +
              '<div class="spinner">' +
              '<div class="rect2"></div>' +
              '<div class="rect3"></div>' +
              '<div class="rect4"></div>' +
              '</div>' +
              '</div>');

      if (typeof opts.status == 'boolean' && !opts.status) {
        loading.hide();
        $.overlayer();
      } else {
        if (loading.size() > 0) {
          $.overlayer({
            status: true,
            closeLayer: opts.closeLayer
          });

          if (!!opts.text) {
            $('.loading-txt').text(opts.text);
          }
          loading.show();
        } else {
          $.overlayer({
            status: true,
            closeLayer: opts.closeLayer
          });
          if (!!opts.text) {
            tpl.append('<p class="loading-txt">' + opts.text + '</p>');
          }
          $('body').append(tpl);
        }
      }
    },
    //  遮罩
    overlayer: function (config) {
      var sets = config || '',
          tpl = '<div id="global-overlayer" class="global-overlayer"></div>',
          layer = $('#global-overlayer');
      if (sets.status) {
        if (layer.size() > 0) {
          layer.show();
        } else {
          $('body').append(tpl);
        }

        if (sets.closeLayer) {
          layer.addClass('overlayer-transparent');
        } else {
          layer.removeClass('overlayer-transparent');
        }
      } else {
        layer.hide();
      }
    },
    //  提示
    alert: function (msg) {
      $.overlayer({
        status: true,
        closeLayer: true
      });
      $('.alert-content').text(msg);
      $('.global-alert').css('z-index', 100000).delay(300).addClass('alert-show');
      setTimeout(function () {
        $('.global-alert').removeClass('alert-show').css('z-index', 10001);
        $.overlayer();
      }, 800)
    },
    getURLParameter: function (name) {
      return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [, ""])[1].replace(/\+/g, '%20')) || null;
    },

    //    textarea换行转换
    textToBr: function (val) {
      return val.replace(/\r?\n/g, '<br />');
    },

    //url参数转object
    paramsToObj: function () {
      var search = location.search.substring(1);
      return JSON.parse('{"' + decodeURI(search).replace(/"/g, '\\"').replace(/&/g, '","').replace(/=/g, '":"') + '"}');
    },

    // pushstate
    getHistory: function (data) {
      var url = location.href;

      var param = $.map(data, function (v, k) {
        return k + '=' + v
      }).join('&');

      if (history.pushState) {
        history.pushState(data, '', url.split('?')[0] + '?' + param);
      }
    },

    //微信分享
    wxShare: function (config) {
      wx.config({
        debug: false,  //调式模式，设置为ture后会直接在网页上弹出调试信息，用于排查问题
        appId: config.appId,
        timestamp: config.timestamp,
        nonceStr: config.nonceStr,
        signature: config.signature,
        jsApiList: [  //需要使用的网页服务接口
          'checkJsApi',  //判断当前客户端版本是否支持指定JS接口
          'onMenuShareTimeline', //分享给好友
          'onMenuShareAppMessage' //分享到朋友圈
        ]
      });
      wx.ready(function () {   //ready函数用于调用API，如果你的网页在加载后就需要自定义分享和回调功能，需要在此调用分享函数。//如果是微信游戏结束后，需要点击按钮触发得到分值后分享，这里就不需要调用API了，可以在按钮上绑定事件直接调用。因此，微信游戏由于大多需要用户先触发获取分值，此处请不要填写如下所示的分享API
        wx.onMenuShareTimeline({  //例如分享到朋友圈的API
          title: config.title, // 分享标题
          link: config.link, // 分享链接
          imgUrl: config.imgUrl, // 分享图标
          success: function () {
            // 用户确认分享后执行的回调函数
//                alert('success!');
            if(config.success && typeof config.success == 'function') {
              config.success();
            }
          },
          cancel: function () {
            // 用户取消分享后执行的回调函数
//                alert('cancel');
            if(config.cancel && typeof config.cancel == 'function') {
              config.cancel();
            }
          }
        });
        wx.onMenuShareAppMessage({
          title: config.title, // 分享标题
          desc: config.desc, // 分享描述
          link: config.link, // 分享链接
          imgUrl: config.imgUrl, // 分享图标
          type: 'link', // 分享类型,music、video或link，不填默认为link
          dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
          success: function () {
//                alert('success');
            // 用户确认分享后执行的回调函数
            if(config.success && typeof config.success == 'function') {
              config.success();
            }

          },
          cancel: function () {
//                alert('cancel');
            // 用户取消分享后执行的回调函数
            if(config.cancel && typeof config.cancel == 'function') {
              config.cancel();
            }
          }
        });
      });
      wx.error(function (res) {
        alert(res.errMsg);  //打印错误消息。及把 debug:false,设置为debug:true就可以直接在网页上看到弹出的错误提示
      });
    },
    //    加载更多（分页）
    getMorePage: function (opts, callback) {
      var isScroll = true,
          DocHeight,
          page = opts.initPage,
          diffHeight = opts.position || 800,
          container = opts.container || $(window),
          scrollTrigger = false;

      if (typeof opts.store == 'undefined' || opts.store == true) {
        sessionStorage.page = page;
      }
      container.on('scroll', function () {
        if (isScroll && page <= +opts.pageCount) {
          DocHeight = $(document).height();

          if (container == opts.container) {
            scrollTrigger = container.height() + container.scrollTop() > container[0].scrollHeight - diffHeight;
          } else {
            scrollTrigger = $(window).scrollTop() + document.documentElement.clientHeight > DocHeight - diffHeight;
          }

          if (scrollTrigger) {
            isScroll = false;
            opts.data.page = page;
            $.getAjax({
              url: opts.url,
              method: 'GET',
              data: opts.data,
              status: false,
              beforeSend: function () {
                $('.loading-notice').inlineLoading({
                  text: '加载中...'
                })
              }
            }, function (res) {

              $('.loading-notice').inlineLoading({
                status: 'close'
              });

              page++;
              isScroll = true;
              if (typeof opts.store == 'undefined' || opts.store == true) {
                sessionStorage.page = page;
              }
              if (callback && typeof callback == 'function') {
                callback(res, page);
              }
            });
          }
        }
      });
    },
//    ajax返回定位
    ajaxBack: function (config, callback) {
      var store = sessionStorage,
          storeData, tpl, totalCount, page = 1;
      //        sessionStorage存储列表数据
      $(document).on('click', 'a[data-target=ajax]', function (e) {
        e.preventDefault();
        var url = $(this).attr('href');

        store.listData = JSON.stringify(storeData);
//            获取当前列表位置
        store.top = $(this).offset().top;
        store.type = config.type;
        location.href = url;
      });
      //  判断是否有本地存储
      if (store.type == config.type) {
        storeData = JSON.parse(store.listData);
        totalCount = Math.ceil(+storeData.totalCount / config.count);
        tpl = template(config.tpl, storeData);
        config.container.html(tpl);
        $.loading({
          status: false
        });

        $("img.lazy").lazyload({
          effect: "fadeIn",
          threshold: 200
        }).removeClass('lazy');

        $('html, body').scrollTop(store.top - 100);

        if (callback && callback.initCallback && typeof callback.initCallback == 'function') {
          callback.initCallback(storeData);
        }

        $.getMorePage({
          url: config.url,
          initPage: store.page,
          pageCount: totalCount,
          data: config.data
        }, function (res) {
          var data = res;
          tpl = template(config.tpl, data.result);
          config.container.append(tpl);

          storeData[config.ajaxData] = storeData[config.ajaxData].concat(data.result[config.ajaxData]);

          if (callback && callback.initCallback && typeof callback.initCallback == 'function') {
            callback.initCallback(res.result);
          }
        });
      } else {
        config.data.page = page;
        $.getAjax({
          url: config.url,
          type: "GET",
          data: config.data
        }, function (res) {
          var data = res;
          page++;
          totalCount = Math.ceil(+data.result.totalCount / config.count);

          tpl = template(config.tpl, data.result);
          config.container.html(tpl);

          storeData = $.extend(true, {}, data.result);

          if (callback && callback.initCallback && typeof callback.initCallback == 'function') {
            callback.initCallback(res.result);
          }

          $.getMorePage({
            url: config.url,
            initPage: page,
            pageCount: totalCount,
            data: config.data
          }, function (res) {
            var data = res;
            tpl = template(config.tpl, data.result);
            config.container.append(tpl);

            storeData[config.ajaxData] = storeData[config.ajaxData].concat(data.result[config.ajaxData]);
            if (callback && callback.initCallback && typeof callback.initCallback == 'function') {
              callback.initCallback(res.result);
            }
          });
        });
      }
    },
    //   回复评论
    replyComment: function (opts, callback) {
      var tpl = '<div class="modal-layer"><div class="reply-comment-wrap">' +
          '<div class="close-comment">' +
          '<div class="reply-title"><span class="iconfont icon-bianji "></span>发表评论</div>' +
          '<span class="iconfont close icon-guanbi"></span></div>' +
          '<section class="reply-content">' +
          '<textarea class="reply-input" placeholder="写点什么..." maxlength="200" rows="3"></textarea>' +
          '</section>' +
          '<a href="" class="reply-btn">发布</a>' +
          '</div></div>';

      //如果存在dom则移除
      if ($('.modal-layer').size() > 0) {
        $('.modal-layer').remove();
      }
      //初始化
      $('body').append(tpl);

      setTimeout(function () {
        $('.reply-comment-wrap').addClass('active');
      }, 300);

      // placeholder
      if (opts.data.replyUser) {
        $('.reply-input').attr('placeholder', '@' + opts.data.replyUser);
      } else {
        $('.reply-input').attr('placeholder', '写点什么...');
      }

      //关闭
      $('.close-comment .iconfont').on('click', function () {
        $('.reply-comment-wrap').removeClass('active').delay(400).queue(function () {
          $('.modal-layer').remove();
        })
      });

      //发布
      $('.reply-btn').on('click', function (e) {
        e.preventDefault();
        var comment = $.trim($('.reply-input').val());
        if (!comment) {
          $.alert(' 评论不能为空！');
          return false;
        }
        //过滤emoji
        comment = comment.replace(/([\uE000-\uF8FF]|\uD83C[\uDF00-\uDFFF]|\uD83D[\uDC00-\uDDFF])/g, '')
        if (!comment) {
          $.alert('不支持表情！');
          return false;
        }
        opts.data['comment'] = comment;
        $.getAjax({
          url: api.commentReply,
          type: 'POST',
          data: opts.data,
          status: false,
          beforeSend: function () {
            $('.reply-comment-wrap').removeClass('active').delay(200).queue(function () {
              $('.modal-layer').remove();
            });
          }
        }, function (res) {
          $.alert('发布成功');
          var data = res;

          if (callback && typeof callback == 'function') {
            callback(data)
          }
        });
      });

    },

    //获取cookie
    getCookie: function(name) {
      match = document.cookie.match(new RegExp(name + '=([^;]+)'));
      if (match) return match[1];
    },

    // 设置过期时间
    setTime: function(day) {
      var exp = new Date();
      exp.setTime(exp.getTime() + day*24*60*60*1000);
      return exp.toGMTString();
    },

    // 手机号码验证
    validatePhoneNumber: function (num) {
      var re = /^(\+86)?1[34578]\d{9}$/;
      return re.test(num);
    },
    // 手机号码验证
    isWeixin: function (ua) {
      var re = /MicroMessenger/ig;
      return re.test(ua);
    }
  });

  $.fn.extend({
    // 内联loading 用于ajax分页加载等
    inlineLoading: function (opts) {
      var
          defaults = {
            text: '加载中...',
            status: 'open'
          },
          sets = $.extend({}, defaults, opts),
          tpl = $('<div id="global-inline-loading" class="global-inline-loading global-loading">' +
              '<div class="spinner">' +
              '<div class="rect2"></div>' +
              '<div class="rect3"></div>' +
              '<div class="rect4"></div>' +
              '</div>' +
              '</div>'),
          loading = $('#global-inline-loading');
      if (sets.text) {
        $('<span>' + sets.text + '</span>').appendTo(tpl);
      }

      return this.each(function () {

        if (sets.status == 'close') {
          $(this).hide();
        } else {
          if ($(this).find(loading).size() > 0) {
            $(this).show();
          } else {
            $(this).html(tpl);
          }
        }
      });
    },
    //上传图片
    uploadPic: function (opts, callback) {
      var
          defaults = {
            spaceName: '', //又拍云空间名
            form: '',  //表单DOM
            minWidth: 0, //最小图片宽度
            minHeight: 0, //最小图片高度
            maxSize: 20 // 最大上传图片，默认20M
          },
          sets = $.extend({}, defaults, opts);

      function upload(data) {
        var fd = new FormData(sets.form[0]);
        fd.append('file', data.elem[0].files[0]);
        fd.append('policy', data.sign.policy);
        fd.append('signature', data.sign.signature);
        $.ajax({
          url: data.sign.url,
          data: fd,
          processData: false,
          contentType: false,
          type: 'POST',
          beforeSend: function () {
            $.loading({
              status: true,
              text: '上传中...'
            });
          },
          success: function (res) {
            var result = $.parseJSON(res);
            result.domain = data.sign.domain;
            if (result.code == '200') {
              if (callback && typeof callback == 'function') {
                callback(result);
                $.loading({
                  status: false
                });
              }
            }
          },
          error: function () {
            $.loading({
              status: false
            });
            $.alert('上传失败！');
          }
        });
      }

      return this.each(function () {
        var elem = $(this);
        elem.on('change', function () {
          //html5读取文件
          if(!this.files.length) return;
          var files = Array.prototype.slice.call(this.files);
          $.each(files, 
        	
          function (i ,file) {
	            if (!/\/(?:jpeg|png|jpg)/i.test(file.type)) {
	              $.alert('图片格式不正确');
	              return false;
	            }
	            if(file.size/(1024*1024) > sets.maxSize) {
	              $.alert('图片大于'+ sets.maxSize +'M');
	              return false;
	            }
	            var reader = new FileReader();
	            reader.readAsDataURL(file);
	            
	            reader.onload = function() {
	            
	             var result = this.result;
	              var img = new Image();
	              img.src = result;
	
	              img.onload = function() {
	            	  
	                if(this.width < sets.minWidth || this.height < sets.minHeight) {
	                  $.alert('图片尺寸不能小于'+ sets.minWidth +'*'+ sets.minHeight +'');
	                  return false;
	                }
	                //获取又拍云token
	                $.getAjax({
	                  //url: api.sign,
	                  url: "<%=basePath%>/userbasic/headImgSave.do",
	                  data: {spaceName: sets.spaceName},
	                  beforeSend: function () {
	                    $.loading({
	                      status: false
	                    })
	                  }
	                }, function (res) {
	                  var data = res.result;
	                  data.elem = elem;
	                  /*setTimeout(function () {
	                    //上传到又拍云
	                    upload(data);
	                  }, 300)*/
	                });
	              };
	            };
	            reader.onerror = function () {
	              $.alert('图片读取失败');
	            };
            reader.readAsDataURL(file);
          });
        });
      });
    }
  });
});
