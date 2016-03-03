package com.mcliu.ssm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mcliu.ssm.web.dao.SecRoleResourceOperationMapper;
import com.mcliu.ssm.web.entity.SecRoleResourceOperation;
import com.mcliu.ssm.web.service.SecRoleResourceOperationService;

public class SecRoleResourceOperationServiceImpl implements SecRoleResourceOperationService {

    @Autowired
    private SecRoleResourceOperationMapper secRoleResourceOperationMapper;
    
    @Override
    public List<SecRoleResourceOperation> getAll() throws Exception {
        return secRoleResourceOperationMapper.selectAll();
    }

}
