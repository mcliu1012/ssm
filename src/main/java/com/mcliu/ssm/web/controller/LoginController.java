package com.mcliu.ssm.web.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aspire.webbas.core.web.BaseController;

@Controller
public class LoginController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String login() throws Exception {
//        LOGGER.error("发生异常: " + e.getMessage() , e);
//        throw new Exception("-------------test error log-------------");
        return "login";
    }
    
    @RequestMapping(value = "", method = RequestMethod.POST)
//    public String index(LoginUserInfo userInfo, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    public String index(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

//        logger.info("==== index START ====");
//
//        LoginUserInfo loginUserInfo = loginService.getUserByLoginName(userInfo.getLoginName());
//
//        boolean isLoginSuccess = loginService.isLoginSuccess(loginUserInfo, userInfo.getPassword());
//
//        if (isLoginSuccess) {
//            // set cookie
//            setCookie(response, userInfo);
//            // セッションを無効する, インジェクションを防止する
//            request.getSession().invalidate();
//            HttpSession session = request.getSession(true);
//            // save the user's information to session
//            session.setAttribute("userInfo", loginUserInfo);
//
//            logger.info("==== index END ====");
//            return "index";
//        } else {
//            String errorMsg = messageSource.getMessage("error.login.loginName.password", null, null);
//            model.addAttribute("error", errorMsg);
//
//            // save value
//            model.addAttribute("loginName", userInfo.getLoginName());
//            model.addAttribute("password", userInfo.getPassword());
//            model.addAttribute("keepLoginName", userInfo.getKeepLoginName());
//
//            logger.info("==== index END ====");
//            return "login";
//        }
        
        return "index";
    }
    
    @RequestMapping(value = "/signup.ajax")
    @ResponseBody
    public Map<String, Object> signup() {
        return super.success("成功");
    }
}
