$(document).on('afterloadmember', function(o, username) {
	var _mvq = window._mvq || [];
	window._mvq = _mvq;
	_mvq.push(['$setAccount', 'm-28592-0']);

	_mvq.push(['$setGeneral', '', '', /*用户名*/ username, /*用户id*/ '']);
	_mvq.push(['$logConversion']);
	(function() {
		var mvl = document.createElement('script');
		mvl.type = 'text/javascript';
		mvl.async = true;
		mvl.src = ('https:' == document.location.protocol ? 'https://static-ssl.mediav.com/mvl.js' : 'http://static.mediav.com/mvl.js');
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(mvl, s);
	})();
});

//聚合咨询统计
if($('#ntkf_chat_entrance').length > 0) {
	$('#ntkf_chat_entrance').click(function() {
		var _mvq = window._mvq || [];
		window._mvq = _mvq;
		_mvq.push(['$setAccount', 'm-28592-0']);

		_mvq.push(['$setGeneral', 'consult', '', /*用户名*/ username, /*用户id*/ '']);
		_mvq.push(['$logConversion']);
	});
}