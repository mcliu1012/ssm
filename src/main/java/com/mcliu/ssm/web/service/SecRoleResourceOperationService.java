package com.mcliu.ssm.web.service;

import java.util.List;

import com.mcliu.ssm.web.entity.SecRoleResourceOperation;

public interface SecRoleResourceOperationService {
    public List<SecRoleResourceOperation> getAll() throws Exception;
}
