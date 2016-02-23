package com.mcliu.ssm.web.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
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
    
    @RequestMapping(value = "/signup.ajax")
    @ResponseBody
    public Map<String, Object> signup() {
        return super.success("成功");
    }
}
