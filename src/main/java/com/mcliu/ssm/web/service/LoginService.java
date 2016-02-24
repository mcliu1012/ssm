package com.mcliu.ssm.web.service;

import com.aspire.webbas.portal.common.entity.Staff;

public interface LoginService {
    /**
     * By registered Admin user information, and check the password
     *
     * @param user
     * @param password
     * @return
     * @throws Exception
     */
    public boolean isLoginSuccess(Staff staff, String inputPassword) throws Exception;

    /**
     * 更新需要改密码的用户的validateCode和outDate
     *
     * @param user
     * @throws Exception
     */
    public void updatePasswordForgetUser(Staff staff) throws Exception;

    /**
     * 重置密码
     *
     * @param loginUserInfo
     * @throws Exception
     */
    public void updatePassword(Staff staff) throws Exception;
}
