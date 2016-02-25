package com.mcliu.ssm.web.service;

import com.mcliu.ssm.web.entity.SecStaffPassword;

public interface SecStaffPasswordService {
    public void addSecStaffPassword(SecStaffPassword staffPassword) throws Exception;

    public void deleteByStaffId(Long staffId) throws Exception;

    public SecStaffPassword getByStaffId(Long staffId) throws Exception;
}
