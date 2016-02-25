var passwordValidator = null;

$(function() {
    setInit();
    setValidator();
});

function setInit() {
    $("#password-form")[0].reset();
}

function setValidator() {
    passwordValidator = $("#password-form").validate({
        onfocusout: false, // 是否在获取焦点时验证 默认:true
        onkeyup: false, // 是否在敲击键盘时验证 默认:true
        // focusInvalid:false, // 提交表单后,未通过验证的表单(第一个或提交之前获得焦点的未通过验证的表单)会获得焦点
        // 默认:true
        focusCleanup: true, // 当未通过验证的元素获得焦点时,并移除错误提示（避免和
        // focusInvalid.一起使用）默认:false
        rules: {
            passwordFirst: {
                minlength: 6,
                maxlength: 14
            },
            password: {
                minlength: 6,
                maxlength: 14,
                equalTo: "#passwordFirst" // #id名
            }
        },
        messages: {
            passwordFirst: {
                minlength: "密码不能少于6个字符",
                maxlength: "密码不能超过14个字符"
            },
            password: {
                minlength: "用户名不能少于6个字符",
                maxlength: "用户名不能超过14个字符",
                equalTo: "两次输入的密码不一致"
            }
        },
        submitHandler: function(form) {
            // $(form).ajaxSubmit();
            var passwordFirst = $("#passwordFirst").val();
            var password = $("#password").val();
            if (passwordFirst === "") {
                $("#passwordFirst").focus();
                return false;
            } else if (password === "") {
                $("#password").focus();
                return false;
            }
            $.ajaxSubmit(ctxPaths + "/passwordReset.ajax", $(form).serialize(), function(data) {
                if (data.success) {
                    $("#password-msg").removeClass("red").addClass("green").txtCrossFade("密码修改成功，即将跳转到登录页面……");
                    setTimeout(function() {
                        // 跳转到登录页面
                        window.location.href= ctxPaths;
                    }, 4000);
                } else {
                    $("#password-msg").removeClass("green").addClass("red").txtCrossFade(data.message);
                }
            }, $("#password-btn"));
            return false;
        },
        errorPlacement: function(error, element) {
            // error.insertAfter(element.parent());
            // error.appendTo(element.parent());
            if ("" !== error[0].innerHTML) {
                $("#passwordFirst").focus();
                $("#password-msg").removeClass("green").addClass("red").txtCrossFade(error[0].innerHTML);
            }
        }
    });
}
