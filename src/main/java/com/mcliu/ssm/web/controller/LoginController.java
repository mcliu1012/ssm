package com.mcliu.ssm.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aspire.webbas.core.web.BaseController;
import com.aspire.webbas.portal.common.entity.Staff;
import com.aspire.webbas.portal.common.entity.Staff.Sex;
import com.aspire.webbas.portal.common.entity.Staff.Status;
import com.mcliu.ssm.util.AESUtil;
import com.mcliu.ssm.util.Constant;
import com.mcliu.ssm.web.service.LoginService;
import com.mcliu.ssm.web.service.StaffService;

@Controller
public class LoginController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    
    @Autowired
    private LoginService loginService;

    @Autowired
    private StaffService staffService;
    
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String login(Model model, HttpServletRequest request) throws Exception {
        LOGGER.debug("==== login start ====");

        String retPage = null;
        HttpSession session = request.getSession();
        if (session.getAttribute("staff") != null) {
            // Already logged in
            retPage = "index";
        } else {
            // Never logged in
            retPage = "login";
        }
        
        LOGGER.debug("==== login end ====");
        return retPage;
    }
    
    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> index(Staff staff, String keepLoginName, HttpServletRequest request, HttpServletResponse response) throws Exception {

        LOGGER.debug("========== index START ==========");

        Staff staffDB = staffService.getStaffByLoginName(staff.getLoginName());

        boolean isLoginSuccess = loginService.isLoginSuccess(staffDB, staff.getPassword());

        if (isLoginSuccess) {
            // set cookie
            setCookie(response, staff, keepLoginName);
            // セッションを無効する, インジェクションを防止する
            request.getSession().invalidate();
            HttpSession session = request.getSession(true);
            // save the user's information to session
            session.setAttribute("staff", staffDB);

            LOGGER.debug("==== index END ====");
            return super.success("success");// index
        } else {
            LOGGER.debug("========== index END ==========");
            return super.fail("用户名或密码错误，请重新输入");
        }
    }
    
    /**
     * 注册新用户
     * 
     * @param staff 用户信息
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/signup.ajax")
    @ResponseBody
    public Map<String, Object> signup(Staff staff) throws Exception {
        LOGGER.debug("==========signup start==========");
        
        StringBuffer errorMessage = new StringBuffer();
        if (!isParamCheck(staff, errorMessage)) {
            LOGGER.error("注册失败，原因：{}", errorMessage.toString());
            return super.fail(errorMessage.toString());
        }
        staff.setMobile("");
        staff.setDepartmentId(null);
        staff.setPassword(AESUtil.encrypt(staff.getPassword(), AESUtil.KEY));
        staff.setCreateDate(new Date());
        staff.setStatus(Status.NORMAL);
        staff.setSex(Sex.MALE);
        staff.setCreateUser(staff.getLoginName());
        staffService.addStaff(staff);
        
        LOGGER.debug("==========signup end==========");
        return super.success("注册成功");
    }
    
    private boolean isParamCheck(Staff staff, StringBuffer errorMessage) throws Exception {
        // 用户名
        if (StringUtils.isEmpty(staff.getLoginName())) {
            errorMessage.append("请输入用户名");
            return false;
        }
        // Email
        if (StringUtils.isEmpty(staff.getEmail())) {
            errorMessage.append("请输入电子邮箱地址");
            return false;
        }
        // Email格式验证
        if (!staff.getEmail().matches("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*")) {
            errorMessage.append("E-mail地址格式不正确");
            return false;
        }
        // 是否重复注册验证
        Staff staff2 = staffService.getStaffByLoginName(staff.getLoginName());
        if (null != staff2) {
            errorMessage.append("该用户名已注册，请重新填写或直接登录");
            return false;
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("email", staff.getEmail());
        List<Staff> staffs = staffService.getStaffByMap(map);
        if (!staffs.isEmpty()) {
            errorMessage.append("该Email已注册，请重新填写");
            return false;
        }
        return true;
    }

    @RequestMapping(value = "/sendEmail.ajax")
    @ResponseBody
    public Map<String, Object> sendEmail() {
        return super.success("成功");
    }
    
    /**
     * Set Cookie
     */
    private void setCookie(HttpServletResponse response, Staff staff, String keepLoginName) {
        if (StringUtils.isNotEmpty(keepLoginName)) {
            // Save the login name
            Cookie loginNameCookie = new Cookie(Constant.COOKIE_LOGIN_NAME, staff.getLoginName());
            // HTTPS
//            loginNameCookie.setSecure(true);
            final int cookieMaxAge = 30 * 24 * 60 *60;
            loginNameCookie.setMaxAge(cookieMaxAge);
            response.addCookie(loginNameCookie);
        } else {
            // delete login name
            Cookie loginNameCookie = new Cookie(Constant.COOKIE_LOGIN_NAME, null);
            loginNameCookie.setMaxAge(0);
            response.addCookie(loginNameCookie);
        }
    }
    
    /**
     * logout
     *
     */
    @RequestMapping(value = "/logout.ajax")
    public String logout(HttpServletRequest request) {
        LOGGER.debug("==== logout START  ====");

        // セッションを削除、ログイン画面へ遷移する。
        request.getSession().invalidate();

        LOGGER.debug("==== logout END  ====");
        return "redirect:/";
    }

    /**
     * 从Session中取得当前登录用户
     */
    @RequestMapping(value = "/getSessionStaff.ajax")
    @ResponseBody
    public Map<String, Object> getSessionStaff(HttpServletRequest request) {
        LOGGER.debug("==== getSessionStaff START  ====");
        
        HttpSession session = request.getSession();
        if (session.getAttribute("staff") != null) {
            LOGGER.debug("==== getSessionStaff END  ====");
            return super.success(session.getAttribute("staff"));
        } else {
            LOGGER.debug("==== getSessionStaff END  ====");
            return super.fail("session失效");
        }
    }
    
}
