package com.mcliu.ssm.web.dao;

import com.mcliu.ssm.web.entity.SecStaffPassword;

public interface SecStaffPasswordMapper {
    int deleteByPrimaryKey(Long seqId);

    int deleteByStaffId(Long staffId);

    int insert(SecStaffPassword record);

    int insertSelective(SecStaffPassword record);

    SecStaffPassword selectByPrimaryKey(Long seqId);

    SecStaffPassword selectByStaffId(Long staffId);

    int updateByPrimaryKeySelective(SecStaffPassword record);

    int updateByPrimaryKey(SecStaffPassword record);
}