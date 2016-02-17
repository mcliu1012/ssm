package com.mcliu.ssm.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    
    @RequestMapping(value = "login")
    public String login() throws Exception {
//        LOGGER.error("发生异常: " + e.getMessage() , e);
//        throw new Exception("-------------test error log-------------");
        return "index";
    }
}
