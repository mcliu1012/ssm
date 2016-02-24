var signUpValidator = null;
var forgotValidator = null;

$(function() {
    setInit();
    setListener();
    setValidator();
});

function setInit() {
    $("#login-form")[0].reset();
    $("#forgot-form")[0].reset();
    $("#signup-form")[0].reset();
    
    if ($.cookie("login_name")) {
        $("#login-loginname").val($.cookie("login_name"));
        $("#keepLoginName").attr("checked", "checked");
    } else {
        $("#login-loginname").val();
        $("#keepLoginName").removeAttr("checked");
    }
}

function setListener() {
    // 点击【重置】按钮
    setResetBtnClickHandler();
    // 点击【注册】按钮
    setRegistBtnClickHandler();
    // 点击【登录】按钮
    setLoginBtnClickHandler();
}


/**
 * 点击重置按钮
 */
function setResetBtnClickHandler() {
    $("#signup-reset").click(function() {
        $("#signup-loginname").focus();
    });
}

/**
 * 点击【注册】按钮
 */
function setRegistBtnClickHandler() {
    $("#signup").click(function() {
        var loginname = $("#signup-loginname").val();
        var password = $("#signup-password").val();
        var passwordConfirm = $("#signup-password-confirm").val();
        var realname = $("#signup-realname").val();
        var email = $("#signup-email").val();
        if (loginname === "") {
            $("#signup-loginname").focus();
            return;
        } else if (password === "") {
            $("#signup-password").focus();
            return;
        } else if (passwordConfirm === "") {
            $("#signup-password-confirm").focus();
            return;
        } else if (realname === "") {
            $("#signup-realname").focus();
            return;
        } else if (email === "") {
            $("#signup-email").focus();
            return;
        }
        if ($("#signup-form").valid()) {
            if (!$("#protocol-checkbox").prop("checked")) {
                $("#signup-msg").removeClass("green").addClass("red").txtCrossFade("请勾选“我已阅读并同意此用户协议”");
                return;
            }
            $.ajaxSubmit(ctxPaths + "/signup.ajax", $("#signup-form").serializeJson(), function(data) {
                if (data.success == true) {
                    $("#signup-msg").removeClass("red").addClass("green").txtCrossFade("注册成功！即将跳转到登录页面……");
                    setTimeout(function() {
                        // 重置表单
                        $("#signup-form")[0].reset();
                        // 返回登录页面
                        $(".back-to-login-link").trigger("click");
                    }, 4000);
                } else {
                    $("#signup-msg").removeClass("green").addClass("red").txtCrossFade(data.message);
                }
            }, $("#signup"));
            
        }
    });
}

function setValidator() {
    signUpValidator = $("#signup-form").validate({
        onfocusout: false, // 是否在获取焦点时验证 默认:true
        onkeyup: false, // 是否在敲击键盘时验证 默认:true
        // focusInvalid:false, // 提交表单后,未通过验证的表单(第一个或提交之前获得焦点的未通过验证的表单)会获得焦点
        // 默认:true
        focusCleanup: true, // 当未通过验证的元素获得焦点时,并移除错误提示（避免和
        // focusInvalid.一起使用）默认:false
        rules: {
            loginName: {
                required: true,
                minlength: 6,
                maxlength: 14
            },
            passwordFirst: {
                required: true,
                minlength: 6,
                maxlength: 14
            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 14,
                equalTo: "#signup-password" // #id名
            },
            realName: {
                required: true,
                minlength: 6,
                maxlength: 14
            },
            email: {
                required: true,
                email: true,
                maxlength: 128
            }
        },
        messages: {
            loginName: {
                required: "请输入用户名",
                minlength: "用户名不能少于6个字符",
                maxlength: "用户名不能超过14个字符"
            },
            passwordFirst: {
                required: "请输入密码",
                minlength: "密码不能少于6个字符",
                maxlength: "密码不能超过14个字符"
            },
            password: {
                required: "请输入密码",
                minlength: "用户名不能少于6个字符",
                maxlength: "用户名不能超过14个字符",
                equalTo: "两次输入的密码不一致"
            },
            realName: {
                required: "请输入真实姓名",
                minlength: "真实姓名不能少于6个字符",
                maxlength: "真实姓名不能超过14个字符"
            },
            email: {
                required: "请输入Email地址",
                email: "E-mail地址格式不正确",
                maxlength: "Email地址不能超过128个字符"
            }
        },
        submitHandler: function(form) {
            // $(form).ajaxSubmit();
        },
        errorPlacement: function(error, element) {
            // error.insertAfter(element.parent());
            // error.appendTo(element.parent());
            if ("" !== error[0].innerHTML) {
                $("#signup-loginname").focus();
                $("#signup-msg").removeClass("green").addClass("red").txtCrossFade(error[0].innerHTML);
            }
        }
    });
    forgotValidator = $("#forgot-form").validate({
        onfocusout: false, // 是否在获取焦点时验证 默认:true
        onkeyup: false, // 是否在敲击键盘时验证 默认:true
        // focusInvalid:false, // 提交表单后,未通过验证的表单(第一个或提交之前获得焦点的未通过验证的表单)会获得焦点
        // 默认:true
        focusCleanup: true, // 当未通过验证的元素获得焦点时,并移除错误提示（避免和
        // focusInvalid.一起使用）默认:false
        rules: {
            email: {
                email: true,
                maxlength: 128
            }
        },
        messages: {
            email: {
                email: "E-mail地址格式不正确",
                maxlength: "Email地址不能超过128个字符"
            }
        },
        submitHandler: function(form) {
            // $(form).ajaxSubmit();
            var forgotEmail = $("#forgot-email").val();
            if (forgotEmail === "") {
                $("#forgot-email").focus();
                return false;
            }
            $.ajaxSubmit(ctxPaths + "/sendEmail.ajax", $(form).serialize(), function(data) {
                if (data.success) {
                    $("#forgot-msg").removeClass("red").addClass("green").txtCrossFade("邮件发送成功......");
                    setTimeout(function() {
                        // 重置表单
                        $("#forgot-form")[0].reset();
                        // 跳转到密码修改页面
//                        $(".back-to-login-link").trigger("click");
                    }, 4000);
                } else {
                    $("#forgot-msg").removeClass("green").addClass("red").txtCrossFade(data.message);
                }
            }, $("#forgot-btn"));
            return false;
        },
        errorPlacement: function(error, element) {
            // error.insertAfter(element.parent());
            // error.appendTo(element.parent());
            if ("" !== error[0].innerHTML) {
                $("#forgot-email").focus();
                $("#forgot-msg").removeClass("green").addClass("red").txtCrossFade(error[0].innerHTML);
            }
        }
    });
}

/**
 * 点击【登录】按钮
 */
function setLoginBtnClickHandler() {
    $("#login-btn").click(function() {
        var loginNameInput = $("#login-loginname").val();
        var passwordInput = $("#login-password").val();
        if (loginNameInput === "") {
            $("#login-loginname").focus();
            return;
        } else if (passwordInput === "") {
            $("#login-password").focus();
            return;
        }
        $.ajaxSubmit("", $("#login-form").serializeJson(), function(data) {
            if (data.success) {
                // 登录成功，跳转到index页面
                window.location.href = ctxPaths;
            } else {
                // 登录失败
                $("#login-loginname").focus();
                $("#login-msg").removeClass("green").addClass("red").txtCrossFade(data.message);
            }
        }, $(this));
    });
}