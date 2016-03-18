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
            .email-box .toolbar {
                background: #C16050;
			    border-top: 2px solid #976559;
			    padding: 9px 18px;
            }
            .email-box .back-to-login-link {
                color: #FE9;
			    font-size: 14px;
			    font-weight: bold;
			    text-shadow: 1px 0 1px rgba(0,0,0,0.25);
            }
            .agreement-body {
                max-height: 475px;
                overflow-y: scroll;
            }
            #agreementModal .modal-footer {
                padding: 6px;
            }
            #mcliu-a:hover {
			    text-decoration: none;
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
                                <h4 class="blue" id="id-company-text">&copy; <a id="mcliu-a" href="http://weibo.com/mcliu1012" target="_blank">MCLIU</a></h4>
                            </div>

                            <div class="space-6"></div>

                            <div class="position-relative">
                                <div id="login-box" class="login-box visible widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header blue lighter bigger">
                                                <i class="ace-icon fa fa-pencil green"></i> 填写登录信息
                                            </h4>

                                            <div class="space-6"></div>

                                            <form id="login-form">
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input id="login-loginname" name="loginName" value="${loginName}" class="form-control" placeholder="用户名" autofocus/>
                                                            <i class="ace-icon fa fa-user"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" id="login-password" name="password" value="${password}" class="form-control" placeholder="密码" />
                                                            <i class="ace-icon fa fa-lock"></i>
                                                        </span>
                                                    </label>

                                                    <%-- 提示信息 --%>
                                                    <div class="center" style="margin: 10px 0px 10px; min-height: 22px;">
                                                        <strong>
                                                            <span id="login-msg" style="display: none"></span>
                                                        </strong>
                                                    </div>

                                                    <div class="clearfix">
                                                        <label class="inline">
                                                            <c:set var="checkFlag" value="${'on' == keepLoginName ? 'checked' : '' }"></c:set>
                                                            <input type="checkbox" id="keepLoginName" name="keepLoginName" class="ace" checked="${checkFlag}" />
                                                            <span class="lbl"> 记住我</span>
                                                        </label>

                                                        <button type="button" id="login-btn" class="width-35 pull-right btn btn-sm btn-primary">
                                                            <i class="ace-icon fa fa-key"></i>
                                                            <span class="bigger-110">登录</span>
                                                        </button>
                                                    </div>

                                                    <div class="space-4"></div>
                                                </fieldset>
                                            </form>

                                            <div class="social-or-login center">
                                                <span class="bigger-110">其他登录方式</span>
                                            </div>

                                            <div class="space-6"></div>

                                            <div class="social-login center">
                                                <a class="btn btn-primary">
                                                    <i class="ace-icon fa fa-facebook"></i>
                                                </a>

                                                <a class="btn btn-info">
                                                    <i class="ace-icon fa fa-twitter"></i>
                                                </a>

                                                <a class="btn btn-danger">
                                                    <i class="ace-icon fa fa-google-plus"></i>
                                                </a>
                                            </div>
                                        </div><!-- /.widget-main -->

                                        <div class="toolbar clearfix">
                                            <div>
                                                <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                                    <i class="ace-icon fa fa-arrow-left"></i> 忘记密码？
                                                </a>
                                            </div>

                                            <div>还没有账号？
                                                <a href="#" data-target="#signup-box" class="user-signup-link"> 立即注册
                                                    <i class="ace-icon fa fa-arrow-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.login-box -->

                                <div id="forgot-box" class="forgot-box widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header red lighter bigger">
                                                <i class="ace-icon fa fa-key"></i> 找回密码
                                            </h4>

                                            <div class="space-6"></div>

                                            <form id="forgot-form" onsubmit="return false;">
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="email" id="forgot-email" name="email" class="form-control" placeholder="请输入邮箱地址" />
                                                            <i class="ace-icon fa fa-envelope"></i>
                                                        </span>
                                                    </label>
                                                    
                                                    <%-- 提示信息 --%>
                                                    <div class="center" style="margin: 10px 0px 10px; min-height: 22px;">
                                                        <strong><span id="forgot-msg" style="display:none;"></span></strong>
                                                    </div>

                                                    <div class="clearfix">
                                                        <button type="submit" id="forgot-btn" class="width-35 pull-right btn btn-sm btn-danger">
                                                            <i class="ace-icon fa fa-lightbulb-o"></i>
                                                            <span class="bigger-110">发送</span>
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
                                <div id="email-box" class="email-box widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header red lighter bigger">
                                                <i class="ace-icon fa fa-key"></i> 邮件已经发送！
                                            </h4>

                                            <div class="space-6"></div>

                                            <form>
                                                <fieldset>
                                                    <p>
											          我们发给您一封电子邮件,其中包含一个链接,将允许您在接下来的30分钟内重置您的密码。<br/><br/>
											          如果电子邮件在几分钟内不出现，请检查您的垃圾邮件文件夹。
											        </p>
                                                </fieldset>
                                            </form>
                                        </div><!-- /.widget-main -->

                                        <div class="toolbar center">
                                            <a href="#" style="display:none;" data-target="#email-box" class="go-to-email-box"> 跳转到邮件发送成功页面
                                                <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                            <a href="#" data-target="#login-box" class="back-to-login-link"> 返回登录
                                                <i class="ace-icon fa fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.email-box -->

                                <div id="signup-box" class="signup-box widget-box no-border">
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <h4 class="header green lighter bigger">
                                                <i class="ace-icon fa fa-users blue"></i> 新用户注册
                                            </h4>

                                            <div class="space-6"></div>
                                            <p> 请填写您的个人信息: </p>

                                            <form id="signup-form">
                                                <fieldset>
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input id="signup-loginname" name="loginName" class="form-control" placeholder="用户名" />
                                                            <i class="ace-icon fa fa-user"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" id="signup-password" name="passwordFirst" class="form-control" placeholder="密码" />
                                                            <i class="ace-icon fa fa-lock"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="password" id="signup-password-confirm" name="password" class="form-control" placeholder="确认密码" />
                                                            <i class="ace-icon fa fa-retweet"></i>
                                                        </span>
                                                    </label>
                                                    
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input id="signup-realname" name="realName" class="form-control" placeholder="真实姓名" />
                                                            <i class="ace-icon fa fa-male"></i>
                                                        </span>
                                                    </label>
                                                    
                                                    <label class="block clearfix">
                                                        <span class="block input-icon input-icon-right">
                                                            <input type="email" id="signup-email" name="email" class="form-control" placeholder="电子邮箱" />
                                                            <i class="ace-icon fa fa-envelope"></i>
                                                        </span>
                                                    </label>

                                                    <label class="block">
                                                        <input type="checkbox" id="protocol-checkbox" class="ace" checked="checked" />
                                                        <span class="lbl"> 我已阅读并同意此
                                                            <a href="#" data-toggle="modal" data-target="#agreementModal">用户协议</a>
                                                        </span>
                                                    </label>

                                                    <%-- 提示信息 --%>
                                                    <div class="center" style="margin: 10px 0px 10px; min-height: 22px;">
                                                        <strong><span id="signup-msg" style="display:none;"></span></strong>
                                                    </div>

                                                    <div class="clearfix">
                                                        <button type="reset" id="signup-reset" class="width-30 pull-left btn btn-sm">
                                                            <i class="ace-icon fa fa-refresh"></i>
                                                            <span class="bigger-110">重置</span>
                                                        </button>

                                                        <button type="button" id="signup" class="width-65 pull-right btn btn-sm btn-success">
                                                            <span class="bigger-110">注册</span>

                                                            <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                        </button>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>

                                        <div class="toolbar center">
                                            <a href="#" data-target="#login-box" class="back-to-login-link">
                                                <i class="ace-icon fa fa-arrow-left"></i> 返回登录
                                            </a>
                                        </div>
                                    </div><!-- /.widget-body -->
                                </div><!-- /.signup-box -->
                                
								<!-- 用户协议Modal -->
								<div class="modal fade" id="agreementModal" tabindex="-1" role="dialog" aria-labelledby="agreementModalLabel">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
								        <h4 class="modal-title" id="agreementModalLabel">用户注册协议</h4>
								      </div>
								      <div class="modal-body agreement-body">
								        <%@include file="agreement.jsp" %>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
								      </div>
								    </div>
								  </div>
								</div>
                                
                            </div><!-- /.position-relative -->

<!--                             <div class="navbar-fixed-top align-right"> -->
<!--                                 <br /> -->
<!--                                 &nbsp; -->
<!--                                 <a id="btn-login-dark" href="#">Dark</a> -->
<!--                                 &nbsp; -->
<!--                                 <span class="blue">/</span> -->
<!--                                 &nbsp; -->
<!--                                 <a id="btn-login-blur" href="#">Blur</a> -->
<!--                                 &nbsp; -->
<!--                                 <span class="blue">/</span> -->
<!--                                 &nbsp; -->
<!--                                 <a id="btn-login-light" href="#">Light</a> -->
<!--                                 &nbsp; &nbsp; &nbsp; -->
<!--                             </div> -->
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
//              $('#btn-login-dark').on('click', function(e) {
//                 $('body').attr('class', 'login-layout');
//                 $('#id-text2').attr('class', 'white');
//                 $('#id-company-text').attr('class', 'blue');
                
//                 e.preventDefault();
//              });
//              $('#btn-login-light').on('click', function(e) {
//                 $('body').attr('class', 'login-layout light-login');
//                 $('#id-text2').attr('class', 'grey');
//                 $('#id-company-text').attr('class', 'blue');
                
//                 e.preventDefault();
//              });
//              $('#btn-login-blur').on('click', function(e) {
//                 $('body').attr('class', 'login-layout blur-login');
//                 $('#id-text2').attr('class', 'white');
//                 $('#id-company-text').attr('class', 'light-blue');
                
//                 e.preventDefault();
//              });
             
            });
        </script>
        <script src="resources/js/login.js"></script>
    </body>
</html>
