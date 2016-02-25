package com.mcliu.ssm.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    Logger logger = LoggerFactory.getLogger(AuthenticationInterceptor.class);

    // 認証チェック以外のパス
    public static String[] loginNotRequirePaths = new String[] {
            "sendEmail.ajax", "passwordReset.ajax",
            "checkLink",  "", "signup.ajax"
            };

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
           throws Exception {

        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();

        if (!isRequireLoginCheck(uri, contextPath)) {
            return true;
        }

        // 認証チェック
        HttpSession session = request.getSession();
        if (session.getAttribute("staff") != null) {
            // チェックOK
            return true;
        } else {
            // チェックNG
            String redirectPath = contextPath + "/";
            response.sendRedirect(redirectPath);
            return false;
        }
    }

    /**
     * パス認証チェック可否
     * @param uri
     * @param contextPath
     * @return boolean
     */
    private boolean isRequireLoginCheck(String uri, String contextPath) {
        for (String path : loginNotRequirePaths) {
            String contextUri = contextPath + "/" + path;
            if (contextUri.equals(uri)) {
                return false;
            }
        }
        return true;
    }
}
