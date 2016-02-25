package com.mcliu.ssm.web.controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aspire.webbas.core.web.BaseController;
import com.aspire.webbas.portal.common.entity.Staff;
import com.aspire.webbas.portal.common.entity.Staff.Sex;
import com.aspire.webbas.portal.common.entity.Staff.Status;
import com.mcliu.ssm.util.AESUtil;
import com.mcliu.ssm.util.Constant;
import com.mcliu.ssm.util.MD5Util;
import com.mcliu.ssm.util.mail.MailSenderInfo;
import com.mcliu.ssm.util.mail.SimpleMailSender;
import com.mcliu.ssm.web.entity.SecStaffPassword;
import com.mcliu.ssm.web.service.LoginService;
import com.mcliu.ssm.web.service.SecStaffPasswordService;
import com.mcliu.ssm.web.service.StaffService;

@Controller
public class LoginController extends BaseController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);
    
    @Autowired
    private LoginService loginService;

    @Autowired
    private StaffService staffService;

    @Autowired
    private SecStaffPasswordService secStaffPasswordService;
    
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
    public Map<String, Object> sendEmail(String email, HttpServletRequest request) throws Exception {
        LOGGER.debug("==== sendEmail START ====");

        Map<String, Object> map= new HashMap<String, Object>();
        map.put("email", email);
        List<Staff> staffs = staffService.getStaffByMap(map);
        if (staffs.isEmpty()) {
            return super.fail("该邮箱还未注册，请更换后重试");
        }

        // 生成邮箱内的链接并发送邮件
        // 生成邮箱内的链接
        String secretKey = UUID.randomUUID().toString(); // 密钥
        Timestamp outDate = new Timestamp(System.currentTimeMillis() + 30 * 60 * 1000);// 30分钟后过期
        
        // 追加sec_staff_password表
        SecStaffPassword staffPassword = new SecStaffPassword();
        staffPassword.setStaffId(staffs.get(0).getStaffId());
        staffPassword.setValidateCode(secretKey);
        staffPassword.setOutDate(outDate);
        secStaffPasswordService.addSecStaffPassword(staffPassword);

        LOGGER.debug("loginName ====> " + staffs.get(0).getLoginName());
        long date = outDate.getTime() / 1000 * 1000;// 忽略毫秒数  mySql 取出时间是忽略毫秒数的
        String key = staffs.get(0).getLoginName() + "$" + date + "$" + secretKey;
        LOGGER.debug("key ====>" + key);
//        String digitalSignature = EncryptUtil.encrypt(key);// 数字签名
        String digitalSignature = MD5Util.MD5(key);// 数字签名

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":"
                + request.getServerPort() + path + "/";
        String resetPassHref = basePath + "checkLink?sid="
                + digitalSignature + "&loginName=" + staffs.get(0).getLoginName();
        String emailContent = "请勿回复本邮件.点击下面的链接,重设密码<br/><a href="
                + resetPassHref + " target='_BLANK'>" + resetPassHref
                + "</a> <br/>或者    <a href=" + resetPassHref
                + " target='_BLANK'>点击我重新设置密码</a>"
                + "<br/>提示 : 本邮件超过30分钟,链接将会失效，需要重新申请'找回密码'。"
                + "<br/>Thanks,<br/>来自MCLIU。";

        // 发送邮件
        // 这个类主要是设置邮件
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.126.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);
        mailInfo.setUserName("mailsender1012@126.com");
        mailInfo.setPassword("password");// 您的邮箱密码
        mailInfo.setFromAddress("mailsender1012@126.com");
        mailInfo.setToAddress(email);
        mailInfo.setSubject("[MCLIU] 请重置你的密码");
        mailInfo.setContent(emailContent);
        // 这个类主要来发送邮件
        SimpleMailSender.sendHtmlMail(mailInfo);// 发送html格式

        LOGGER.debug("==== sendEmail END ====");
        return super.success("邮件发送成功");
    }
    
    /**
     * 点击邮件中的链接
     *
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "checkLink", method = RequestMethod.GET)
    public String checkLink(Model model, @RequestParam String sid, @RequestParam String loginName,
                HttpServletRequest request) throws Exception {
        LOGGER.debug("==== checkLink START ====");

        LOGGER.debug("sid ====>" + sid);

        if (StringUtils.isEmpty(sid) || StringUtils.isEmpty(loginName)) {
            model.addAttribute("error", "邮件链接不完整");
            return "redirect:/";
        }

        Staff staff = staffService.getStaffByLoginName(loginName);
        if (null == staff) {
            model.addAttribute("error", "邮件链接有误，未找到该用户");
            return "redirect:/";
        }

        SecStaffPassword staffPassword = secStaffPasswordService.getByStaffId(staff.getStaffId());
        if (null == staffPassword) {
            model.addAttribute("error", "非法操作");
            return "redirect:/";
        }
        Date outDate = staffPassword.getOutDate();
        LOGGER.debug("outDate ====>" + outDate);
        if (outDate.getTime() <= System.currentTimeMillis()) { // 表示已经过期
            model.addAttribute("error", "邮件链接失效，请重新申请找回密码");
            return "redirect:/";
        }

        String key = staff.getLoginName() + "$" + outDate.getTime() / 1000 * 1000 + "$" + staffPassword.getValidateCode();// 数字签名

        LOGGER.debug("key link ====>" + key);
        String digitalSignature = MD5Util.MD5(key);// 数字签名

        LOGGER.debug("digitalSignature ====>" + digitalSignature);
        if (!digitalSignature.equals(sid)) {
            model.addAttribute("error", "数字签名不匹配");
            return "redirect:/";
        }
        // 链接验证通过 转到修改密码页面
        HttpSession session = request.getSession(true);
        // save the user's information to session
        session.setAttribute("staff", staff);
        model.addAttribute("loginName", staff.getLoginName());

        LOGGER.debug("==== checkLink END ====");
        return "passwordReset";
    }
    
    /**
     * 重置密码
     */
    @ResponseBody
    @RequestMapping(value = "passwordReset.ajax", method = RequestMethod.POST)
    public Map<String, Object> passwordReset(Staff staff, HttpServletRequest request) throws Exception {
        LOGGER.debug("==== passwordReset START ====");
        if (StringUtils.isEmpty(staff.getLoginName())) {
            LOGGER.error("找不到需要修改密码的用户");
            return super.fail("找不到需要修改密码的用户");
        }
        
        // セッションを削除
        request.getSession().invalidate();

        StringBuffer errorMessage = new StringBuffer();
        if (!isParamCheckPassword(staff, errorMessage)) {
            HttpSession session = request.getSession(true);
            // save the user's information to session
            session.setAttribute("userInfo", staff);
            return super.fail(errorMessage.toString());
        }
        // 验证通过，重置密码
        Staff staffDB = staffService.getStaffByLoginName(staff.getLoginName());
        staffDB.setPassword(AESUtil.encrypt(staff.getPassword(), AESUtil.KEY));
        staffService.updateStaffPassword(staffDB);
        secStaffPasswordService.deleteByStaffId(staffDB.getStaffId());

        LOGGER.debug("==== passwordReset END ====");
        return super.success("密码重置成功");
    }
    
    private boolean isParamCheckPassword(Staff staff, StringBuffer errorMessage) throws Exception {
        // Password
        if (StringUtils.isEmpty(staff.getPassword())) {
            errorMessage.append("请输入密码(S)");
            return false;
        }
        if (staff.getPassword().length() < 6) {
            errorMessage.append("密码长度不能小于6(S)");
            return false;
        }
        if (staff.getPassword().length() > 14) {
            errorMessage.append("密码长度不能大于14(S)");
            return false;
        }
        return true;
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
