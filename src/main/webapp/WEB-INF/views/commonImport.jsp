<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix='spring' uri='http://www.springframework.org/tags' %>
<% String sysDate = (new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date())); %>
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>MCLIU</title>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="resources/assets/css/chosen.css">
<link rel="stylesheet" href="resources/assets/css/datepicker.css" />

<!-- <link rel="stylesheet" href="resources/assets/css/bootstrap-datetimepicker.min.css" /> -->

<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css" />
<!-- page specific plugin styles -->
<link rel="stylesheet" href="resources/assets/css/jquery-ui.min.css" />

<link rel="stylesheet" href="resources/assets/css/ui.jqgrid.css" />
<!-- text fonts -->
<link rel="stylesheet" href="resources/assets/css/ace-fonts.css" />
<!-- ace styles -->
<link rel="stylesheet" href="resources/assets/css/ace.min.css" />
<!--[if lte IE 9]>
<link rel="stylesheet" href="resources/assets/css/ace-part2.min.css" />
<![endif]-->
<link rel="stylesheet" href="resources/assets/css/ace-skins.min.css" />
<link rel="stylesheet" href="resources/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="resources/js/select2-3.5.1/select2.css" />

<link rel="stylesheet" href="resources/css/css.css" />
<!--[if lte IE 9]>
<link rel="stylesheet" href="resources/assets/css/ace-ie.min.css" />
<![endif]-->
<!-- inline styles related to this page -->
<!-- ace settings handler -->
<script src="resources/assets/js/ace-extra.min.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lte IE 8]>
<script src="resources/assets/js/html5shiv.js"></script>
<script src="resources/assets/js/respond.min.js"></script>
<![endif]-->
<!--[if !IE]>
-->
<script type="text/javascript">
        window.jQuery || document.write("<script src='resources/assets/js/jquery.min.js'>"+"<"+"/script>");
</script>
<!-- <![endif]-->
<!--[if IE]>
<script type="text/javascript">
         window.jQuery || document.write("<script src='resources/assets/js/jquery1x.min.js'>"+"<"+"/script>");</script>
<![endif]-->
<script type="text/javascript">
if('ontouchstart' in document.documentElement) document.write("<script src='resources/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");</script>
<script src="resources/assets/js/bootstrap.min.js"></script>
<!--  
-->
<script src="resources/js/select2-3.5.1/select2.min.js"></script>
<script src="resources/js/select2-3.5.1/select2_locale_zh-CN.js"></script>
<script src="resources/assets/js/jquery-ui.min.js"></script>
<script src="resources/assets/js/jquery.dataTables.min.js"></script>

<script src="resources/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="resources/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>

<script src="resources/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="resources/assets/js/date-time/locales/bootstrap-datepicker.zh-CN.js"></script>
<!--<script src="resources/assets/js/date-time/moment.min.js"></script>-->
<!-- <link rel="stylesheet" href="resources/assets/css/bootstrap-datetimepicker.min.css" /> -->

<!-- <script src="resources/assets/js/date-time/bootstrap-datetimepicker.min.js"></script> -->
<!-- <script src="resources/assets/js/date-time/locales/bootstrap-datetimepicker.zh-CN.js"></script> -->

<script src="resources/assets/js/jquery.validate.min.js"></script>
<script src="resources/assets/js/additional-methods.min.js"></script>
<script src="resources/assets/js/bootbox.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/js/custom/plupload.common.css">
<script type="text/javascript" src="resources/js/plupload-2.1.2/js/plupload.full.min.js"></script>
<!-- ace scripts -->
<script type="text/javascript" src="resources/assets/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="resources/js/template-native.js"></script>

<!--[if lte IE 8]>
  <script src="resources/assets/js/excanvas.min.js"></script>
<![endif]-->
<script src="resources/assets/js/jquery-ui.custom.min.js"></script>
<script src="resources/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="resources/assets/js/jquery.easypiechart.min.js"></script>
<script src="resources/assets/js/jquery.sparkline.min.js"></script>
<script src="resources/assets/js/flot/jquery.flot.min.js"></script>
<script src="resources/assets/js/flot/jquery.flot.pie.min.js"></script>
<script src="resources/assets/js/flot/jquery.flot.resize.min.js"></script>

<!-- ace scripts -->
<script src="resources/assets/js/ace-elements.min.js"></script>
<!-- <script src="resources/assets/js/ace.min.js"></script> -->

<!-- inline scripts related to this page -->
<script type="text/javascript"></script>

<link rel="stylesheet" href="resources/assets/css/ace.onpage-help.css" />
<link rel="stylesheet" href="resources/docs/assets/js/themes/sunburst.css" />

<script type="text/javascript"> ace.vars['base'] = '..'; </script>
<script src="resources/assets/js/ace/ace.onpage-help.js"></script>
<script src="resources/docs/assets/js/rainbow.js"></script>
<script src="resources/docs/assets/js/language/generic.js"></script>
<script src="resources/docs/assets/js/language/html.js"></script>
<script src="resources/docs/assets/js/language/css.js"></script>
<script src="resources/docs/assets/js/language/javascript.js"></script>

<script>
        document.write('<script type="text/javascript" src="resources/js/custom/jquery.common-1.0.js?'+(new Date()).getTime() + '"><\/script>');
        document.write('<script type="text/javascript" src="resources/js/custom/biz.js?'+(new Date()).getTime() + '"><\/script>');
</script>