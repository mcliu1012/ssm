package com.mcliu.ssm.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.aspire.webbas.core.web.BaseController;
import com.aspire.webbas.portal.common.entity.Staff;

public class BaseActionController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(BaseActionController.class);

    /**
     * 取得当前登录用户信息
     */
    public Staff getCurrentLogin() {
        HttpSession session = getSession();
        if (session.getAttribute("staff") != null) {
            LOGGER.debug("==== getSessionStaff END  ====");
            return (Staff)session.getAttribute("staff");
        } else {
            LOGGER.error("==== getSessionStaff END  session失效 ====");
            return null;
        }
    }

    public HttpServletRequest getRequest() {
        if (null != RequestContextHolder.getRequestAttributes()) {
            return ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        } else {
            return null;
        }
    }

    public HttpSession getSession() {
        return getRequest().getSession();
    }
}
