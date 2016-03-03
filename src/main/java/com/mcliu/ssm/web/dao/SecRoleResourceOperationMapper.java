package com.mcliu.ssm.web.dao;

import java.util.List;

import com.mcliu.ssm.web.entity.SecRoleResourceOperation;

public interface SecRoleResourceOperationMapper {
    List<SecRoleResourceOperation> selectAll();
    
    int deleteByPrimaryKey(SecRoleResourceOperation key);

    int insert(SecRoleResourceOperation record);

    int insertSelective(SecRoleResourceOperation record);
}