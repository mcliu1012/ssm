<!DOCTYPE html>
<html lang="en">
    <head>
<!--        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> -->
<!--        <meta charset="utf-8" /> -->
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link rel="icon" href="/resources/favicon/icon.ico" type="image/vnd.microsoft.icon">
        <link rel="shortcut icon" href="/resources/favicon/icon.ico" type="image/vnd.microsoft.icon">
        <%@include file="/root.jsp" %>
        <%@include file="commonImport.jsp" %>
        <%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <title>SSM后台管理系统</title>
<!-- <%--       <c:url value="/" var="baseUrl" /> --%> -->
        <style>
            html {
                background-color: transparent;
            }
        </style>
    </head>

    <body class="login-layout blur-login">
        <div class="main-container">
            <div class="main-content">
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1">
                        <div class="login-container">
                            <div class="center">
                                <h1>
                                    <i class="ace-icon fa fa-globe green"></i>
                                    <span class="red">SSM</span>
                                    <span class="white" id="id-text2">后台管理系统</span>
                                </h1>
                                <h4 class="blue" id="id-company-text">&copy; MCLIU</h4>
                            </div>

                            <div class="space-6"></div>

                            <div class="position-relative">
                                <div id="forgot-box" class="forgot-box visible widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header red lighter bigger">
                                                <i class="ace-icon fa fa-key"></i> 密码重置
                                            </h4>

                                            <div class="space-6"></div>

                                            <form id="password-form" onsubmit="return false;">
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" id="passwordFirst" name="passwordFirst" class="form-control" placeholder="密码" />
                                                            <i class="ace-icon fa fa-lock"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" id="password" name="password" class="form-control" placeholder="确认密码" />
                                                            <i class="ace-icon fa fa-retweet"></i>
                                                        </span>
                                                    </label>
                                                    
                                                    <%-- 提示信息 --%>
                                                    <div class="center" style="margin: 10px 0px 10px; min-height: 22px;">
                                                        <strong>
                                                            <span id="password-msg" style="display:none;"></span>
                                                        </strong>
                                                    </div>

                                                    <div class="clearfix">
                                                        <input type="hidden" name="loginName" value="${loginName }" />
                                                        <button type="submit" id="password-btn" class="width-35 pull-right btn btn-sm btn-danger">
                                                            <i class="ace-icon fa fa-lightbulb-o"></i>
                                                            <span class="bigger-110">修改</span>
                                                        </button>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div><!-- /.widget-main -->

                                        <div class="toolbar center">
                                            <a href="#" data-target="#login-box" class="back-to-login-link"> 返回登录
                                                <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.forgot-box -->

                            </div><!-- /.position-relative -->

                            <div class="navbar-fixed-top align-right">
                                <br />
                                &nbsp;
                                <a id="btn-login-dark" href="#">Dark</a>
                                &nbsp;
                                <span class="blue">/</span>
                                &nbsp;
                                <a id="btn-login-blur" href="#">Blur</a>
                                &nbsp;
                                <span class="blue">/</span>
                                &nbsp;
                                <a id="btn-login-light" href="#">Light</a>
                                &nbsp; &nbsp; &nbsp;
                            </div>
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.main-content -->
        </div><!-- /.main-container -->

        <!-- basic scripts -->

        <!-- inline scripts related to this page -->
        <script type="text/javascript">
            jQuery(function($) {
             $(document).on('click', '.toolbar a[data-target]', function(e) {
                e.preventDefault();
                var target = $(this).data('target');
                $('.widget-box.visible').removeClass('visible');//hide others
                $(target).addClass('visible');//show target
             });
            });
            
            
            
            //you don't need this, just used for changing background
            jQuery(function($) {
             $('#btn-login-dark').on('click', function(e) {
                $('body').attr('class', 'login-layout');
                $('#id-text2').attr('class', 'white');
                $('#id-company-text').attr('class', 'blue');
                
                e.preventDefault();
             });
             $('#btn-login-light').on('click', function(e) {
                $('body').attr('class', 'login-layout light-login');
                $('#id-text2').attr('class', 'grey');
                $('#id-company-text').attr('class', 'blue');
                
                e.preventDefault();
             });
             $('#btn-login-blur').on('click', function(e) {
                $('body').attr('class', 'login-layout blur-login');
                $('#id-text2').attr('class', 'white');
                $('#id-company-text').attr('class', 'light-blue');
                
                e.preventDefault();
             });
             
            });
        </script>
        <script src="resources/js/passwordReset.js"></script>
    </body>
</html>
