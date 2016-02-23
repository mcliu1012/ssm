var pLoginValidator = null;

$(function() {
    setListener();
    setValidator();
});

function setListener() {
    // 点击【重置】按钮
    setResetBtnClickHandler();
    // 点击【注册】按钮
    setRegistBtnClickHandler();
    // 点击【Login】按钮
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
 * 状态初始化
 */
//function setStatusInit() {
//    pLoginValidator.resetForm();
//    $("#pLoginEmailInput").focus();
//    $("#signup-form")[0].reset();
//}

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
            $.ajaxSubmit(ctxPaths + "/signup.ajax", $("#signup-form").serializeJson(), function(data) {
                if (data.success == true) {
                    $("#signup-msg").removeClass("red").addClass("green").txtCrossFade("恭喜你！注册成功");
//                    setTimeout(function() {
//                        $(".back-to-login-link").trigger("click");
//                    }, 1500);
                } else {
                    $("#signup-msg").removeClass("green").addClass("red").txtCrossFade(data.message);
                }
            }, $("#signup"));
            
        }
    });
}

function setValidator() {
    pLoginValidator = $("#signup-form").validate({
      onfocusout: false, // 是否在获取焦点时验证 默认:true
      onkeyup: false, // 是否在敲击键盘时验证 默认:true
//      focusInvalid:false, // 提交表单后,未通过验证的表单(第一个或提交之前获得焦点的未通过验证的表单)会获得焦点 默认:true
      focusCleanup:true,  // 当未通过验证的元素获得焦点时,并移除错误提示（避免和 focusInvalid.一起使用）默认:false
      rules: {
          loginName: {
              required: true,
              maxlength: 64
          },
          passwordFirst: {
              required: true,
              minlength: 2,
              maxlength: 14
          },
          password: {
              required: true,
              minlength: 2,
              maxlength: 14,
              equalTo: "#signup-password" // #id名
          },
          realname: {
              required: true,
              maxlength: 64
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
              maxlength: "不能超过64个字符"
          },
          passwordFirst: {
              required: "请输入密码",
              minlength: "密码长度不能小于2",
              maxlength: "密码长度不能大于14"
          },
          password: {
              required: "请输入密码",
              minlength: "密码长度不能小于2",
              maxlength: "密码长度不能大于14",
              equalTo: "两次输入的密码不一致"
          },
          realname: {
              required: "请输入真实姓名",
              maxlength: "不能超过64个字符"
          },
          email: {
              required: "请输入Email地址",
              email: "E-mail地址格式不正确",
              maxlength: "不能超过128个字符"
          }
      },
      submitHandler: function(form) {
//          $(form).ajaxSubmit();
      },
      errorPlacement: function(error, element) {
//          error.insertAfter(element.parent());
//          error.appendTo(element.parent());
          $("#signup-msg").removeClass("green").addClass("red").txtCrossFade(error[0].innerHTML);
      }
  });
}

/**
 * 点击【Login】按钮
 */
function setLoginBtnClickHandler() {
//    $("#signup-form").off("submit").on("submit", function() {
//        var loginNameInput = $("#loginNameInput").val();
//        var passwordInput = $("#passwordInput").val();
//        if (loginNameInput === "") {
//            $("#loginNameInput").focus();
//            return false;
//        } else if (passwordInput === "") {
//            $("#passwordInput").focus();
//            return false;
//        }
//        return true;
//    });
}