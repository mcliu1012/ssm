package com.mcliu.ssm.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aspire.webbas.core.exception.MyException;
import com.mcliu.ssm.web.service.LoginService;

@Controller
public class LoginController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    
    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "login")
    public String login() throws Exception {
        loginService.getAll();
//        LOGGER.error("发生异常: " + e.getMessage() , e);
//        throw new Exception("-------------test error log-------------");
        return "index";
    }
}
