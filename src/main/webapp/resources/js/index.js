var max = 10;
$(function() {
//	$('#menu a[url]').click(function() {
//	    initStatus($(this));
//	    
//		var url = $(this).attr("url");
//		url = url + (url.lastIndexOf('?') == -1 ? '?' : '&') + (new Date()).getTime();
//		initTab($(this).text(), url);
//	});
	
	// 点击一级菜单时，其他兄弟菜单折叠隐藏
	$(".menu-a").click(function() {
	    $(this).parent().siblings().removeClass("open").find("ul").slideUp("fast");
	});

    // 生成菜单
    var buildMenu = function(menus) {
        var buildMenuHtml = function(menus) {
            var html = [];
            $.each(menus, function(i, menu) {
                html.push('<li class="hsub">');
                html.push('<a class="dropdown-toggle" href="#"><i class="' + menu['icon'] + '"></i><span class="menu-text">' + menu.text + ' </span>');
                if (menu.leaf != true && menu.leaf != 'true') {
                    html.push('<b class="arrow fa fa-angle-down"></b>');
                }
                html.push('</a>');
                var initSubMenu = function(menu) {
                    if (menu.leaf != true && menu.leaf != 'true') {
                        var childrens = menu.children, len = childrens.length;
                        html.push('<ul class="submenu nav-show">');
                        for (var i = 0; i < len; i++) {
                            html.push('<li class="hsub">');
                            var url = childrens[i].url;
                            if (childrens[i].url) {
                                // url = url +
                                // (url.lastIndexOf('?') == -1?
                                // '?' : '&') + (new
                                // Date()).getTime();
                                html.push('<a target="mainFrame" href="javascript:;" url="' + url + '" ><i class="menu-icon fa"></i></i>' + childrens[i].text + '</a><b class="arrow"></b>');
                            } else {
                                html.push('<a class="dropdown-toggle" href="javascript:;"><i class="menu-icon fa fa-caret-right"></i>' + childrens[i].text + '<b class="arrow fa fa-angle-down"></b></a>');
                            }
                            initSubMenu(childrens[i]);
                            html.push('</li>');

                        }
                        html.push('</ul>');
                    }
                };
                initSubMenu(menu);
                html.push('</li>');
            });
            return html.join('');
        };
        var htmlFrame = buildMenuHtml(menus);
        // 追加到menu div 中
        $('#menu').empty().append(htmlFrame);
        $('#menu li:eq(0)').find('a').trigger('click');
        // 设置事件
        // 1)找到含有属性url的a标签，设置点击事件
        $('#menu a[url]').bind('click', function() {
            var url = $(this).attr("url");
            $('#menu a[url]').parent('li').removeClass("active");
            $(this).parent('li').addClass("active");
            // 在iframe中打开
            /*******************************************************************
             * if (url && url.indexOf('http') > -1){
             * $("#mainFrame").attr("src",url); }else{
             * $("#mainFrame").attr("src",url); }
             ******************************************************************/
            url = url + (url.lastIndexOf('?') == -1 ? '?' : '&') + (new Date()).getTime();
            initTab($(this).text(), url);
        });
        $('#menu a[url]:eq(0)').trigger('click');
    };
    // 添加选中效果
    // $("#menu ul li").click(function(){
    // 设置select样式，并找到同级和后代中设置为select的移除select
    // $(this).addClass("selected").siblings("li.selected").removeClass("selected").find('li.selected').removeClass("selected");
    // });

    // 从Session中取得当前登录用户
    $.ajax({
        // url: $.appendExtraParams(window.ctxPaths + '/menu.ajax'),
        url: 'getSessionStaff.ajax',
        type: 'POST',
        timeout: 30000,
        dataType: 'json',
        success: function(data) {
            if (data.success) {
                $("#index-realname").html(data.data.realName);
                // 初始化菜单
                initMenu(buildMenu);
            }
        }
    });
    
});

/**
 * 初始化菜单
 */
function initMenu(buildMenu) {
    $.ajax({
        // url: $.appendExtraParams(window.ctxPaths + '/menu.ajax'),
        url: 'menu/menu.ajax',
        type: 'POST',
        timeout: 30000,
        dataType: 'json',
        success: function(data) {
            if (data.success) {
                var menus = data.data;
                if (menus && menus.length > 0) {
                    buildMenu(menus);
                }
            }
        }
    });
}

function initTab(title, url) {
	var $lis = $('.tabbable li'), lisLen = $lis.length;
	$tabPanes = $('.tabcontent .tab-pane'), ifmId = '_ifm'
			+ (new Date()).getTime();
	var isExist = $lis.find('a[title="' + title + '"]').length;
	// $tabPanes.find('iframe').attr('id','').attr('name','');
	if (isExist > 0) {
		// 存在相同的Tab的情况
		var _a = $lis.find('a[title="' + title + '"]'), $li = _a.closest('li'), num = $lis
				.index($li), ifm = $tabPanes.find('iframe').eq(num);
		// ifm.attr('id','mainFrame').attr('name','mainFrame');
		var urls = ifm.attr('src').split('#');
		if (urls[0] != url) {
			ifm.attr('id', ifmId);
			ifm.attr('src', url + '#' + ifmId);
		}
		_a.trigger('click');
		return;
	}
	if (lisLen < max) {
		// tabbable > li 小于10个的情况
		var _a = $('<a></a>').attr('href', 'javascript:;').attr('title', title)
				.html('<i class="fa fa-star "></i> ' + title);
		var urls = url.split('#');
		var _div = '<div class="tab-pane"><iframe width="100%" height="600" frameborder="no" style="overflow:hidden; height: 682px;" src="'
				+ (urls[0] + '#' + ifmId)
				+ '" name="mainFrame" id="'
				+ ifmId
				+ '" allowtransparency="true"></iframe></div>';
		$('.nav-tabs').append($('<li></li>').append(_a));
		$('.tabcontent').append(_div);
		initNavTabEvent();
		_a.trigger('click');
	} else {
		// tabbable > li 超出10个的情况
		var selectedInd = $lis.index($('.tabbable li.active'));
		var nextInd = (selectedInd == max - 1 ? 0 : selectedInd + 1);
		// $tabPanes.find('iframe').attr('id','').attr('name','');
		$tabPanes.find('iframe').eq(nextInd).attr('src', 'about:blank').attr(
				'id', ifmId).attr('name', 'mainFrame').attr('src',
				url + '#' + ifmId);
//		$lis.eq(nextInd).find('a').attr('title', title).text(title);
		$lis.eq(nextInd).find('a').attr('title', title).html('<i class="fa fa-star "></i> ' + title);
		$lis.eq(nextInd).trigger('click');
	}
}

function initNavTabEvent() {
	$('.nav-tabs li').unbind('click').bind('click',
	function() {
		var ind = $('.nav-tabs li').index($(this));
		$('.nav-tabs li').removeClass('active');
		$(this).addClass('active');
		$('.tabcontent .tab-pane').hide().eq(ind).show();
	}).unbind('mouseover').bind('mouseover',
	function() { // if (len == 1)return;
		if ($(this).find('div.closeitem').length > 0) {
			return;
		}
		var $closeItem = $('<div class="closeitem"> <i class="ace-icon fa fa-times red2"></i></div>');
		$(this).append($closeItem);
		$closeItem.bind('click',
		function(e) {
			e.stopPropagation();
			var _li = $(this).closest('li');
			var lis = $('.nav-tabs li'),
			ind = lis.index(_li),
			next = ind + 1;
			if (_li.hasClass('active')) {
				if (ind == lis.length - 1) {
					next = 0;
				}
				if (lis.length > 1) {
					lis.eq(next).trigger('click');
				}
			}
			$('.nav-tabs li').eq(ind).remove();
			$('.tabcontent .tab-pane').eq(ind).remove();
		});
	}).unbind('mouseout').bind('mouseout',
	function() {
		var _this = this; // if (len == 1)return;
		setTimeout(function() {
			var $closeItem = $(_this).find('div.closeitem');
			$closeItem.remove();
		},
		1000);
	});
}

function initStatus($obj) {
    $('#menu').children().removeClass('hsub open active');
    $obj.parent().parent().parent().addClass('hsub open active');
    $('#menu a[url]').parent().removeClass('active');
    $obj.parent().addClass('active');
    $('#menu ul').hide();
    $obj.parent().parent().show();
    if ($("#sidebar").hasClass("menu-min")) {
        $("#sidebar").removeClass("menu-min");
        $("#sidebar-collapse").trigger('click');
        $("#sidebar-collapse i").removeClass("fa-angle-double-right").addClass("fa-angle-double-left");
    }
}
