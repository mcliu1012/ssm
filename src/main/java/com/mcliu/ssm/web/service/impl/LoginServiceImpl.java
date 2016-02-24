package com.mcliu.ssm.web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aspire.webbas.portal.common.entity.Staff;
import com.mcliu.ssm.util.AESUtil;
import com.mcliu.ssm.web.service.LoginService;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

    private static Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

    public boolean isLoginSuccess(Staff staff, String inputPassword) throws Exception {
        logger.info("==== isLoginSuccess START ====");

        if (null == staff) {
            return false;
        }

        String dbPassword = staff.getPassword();

        // Encrypt the input password
        
        String codePassword = AESUtil.encrypt(inputPassword, AESUtil.KEY);
        boolean isLoginSuccessFlag = codePassword.equals(dbPassword);

        logger.info("==== isLoginSuccess END ====");
        return isLoginSuccessFlag;
    }

    /**
     * 更新需要改密码的用户的validateCode和outDate
     *
     * @param user
     * @throws Exception
     */
    @Override
    @Transactional(rollbackFor=Exception.class)
    public void updatePasswordForgetUser(Staff staff) throws Exception {
        logger.info("==== updatePasswordForgetUser START ====");

//        User user = convertLoginUserInfoToUser(loginUserInfo);
//        loginDao.updatePasswordForgetUser(user);

        logger.info("==== updatePasswordForgetUser END ====");
    }

    /**
     * 重置密码
     *
     * @param loginUserInfo
     * @throws Exception
     */
    @Override
    @Transactional(rollbackFor=Exception.class)
    public void updatePassword(Staff staff) throws Exception {
        logger.info("==== updatePassword START ====");

//        User user = convertLoginUserInfoToUser(loginUserInfo);
//        // Encrypt the input password
//        String codePassword = EncryptUtil.encrypt(user.getPassword());
//        user.setPassword(codePassword);
//        loginDao.updatePassword(user);

        logger.info("==== updatePassword END ====");
    }

}
