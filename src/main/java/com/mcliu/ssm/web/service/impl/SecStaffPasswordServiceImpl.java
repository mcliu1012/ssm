package com.mcliu.ssm.web.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcliu.ssm.web.dao.SecStaffPasswordMapper;
import com.mcliu.ssm.web.entity.SecStaffPassword;
import com.mcliu.ssm.web.service.SecStaffPasswordService;

@Service("secStaffPasswordService")
public class SecStaffPasswordServiceImpl implements SecStaffPasswordService {

    private static Logger logger = LoggerFactory.getLogger(SecStaffPasswordServiceImpl.class);
    
    @Autowired
    private SecStaffPasswordMapper secStaffPasswordMapper;

    public void addSecStaffPassword(SecStaffPassword staffPassword) throws Exception {
        secStaffPasswordMapper.insert(staffPassword);
    }

    public SecStaffPassword getByStaffId(Long staffId) throws Exception {
        return secStaffPasswordMapper.selectByStaffId(staffId);
    }

    public void deleteByStaffId(Long staffId) throws Exception {
        secStaffPasswordMapper.deleteByStaffId(staffId);
    }
}
