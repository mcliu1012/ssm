var max = 10;
$(function() {
	$('#menu a[url]').click(function() {
	    initStatus($(this));
	    
		var url = $(this).attr("url");
		url = url + (url.lastIndexOf('?') == -1 ? '?' : '&') + (new Date()).getTime();
		initTab($(this).text(), url);
	});
	
	// 点击一级菜单时，其他兄弟菜单折叠隐藏
	$(".menu-a").click(function() {
	    $(this).parent().siblings().removeClass("open").find("ul").slideUp("fast");
	});
});

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
