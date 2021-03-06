package com.mcliu.ssm.web.service;

import java.util.List;
import java.util.Map;

import com.aspire.webbas.core.pagination.mybatis.pager.Page;
import com.aspire.webbas.portal.common.entity.Staff;

public interface StaffService {
    public Page<Staff> pageQuery(Page<Staff> page) throws Exception;
    
    public void addStaff(Staff staff) throws Exception;

    public void deleteStaff(Long staffId) throws Exception;

    public void updateStaff(Staff staff) throws Exception;

    public void updateStaffPassword(Staff staff) throws Exception;
    
    public Staff getStaff(Long staffId) throws Exception;

    public Staff getStaffByLoginName(String loginName) throws Exception;
    
    public List<Staff> getStaffByMap(Map<String, Object> paramMap) throws Exception;

    public Staff getStaffByNameAndPassword(Staff staff) throws Exception;
    
    public void saveAndUpdate(Staff staff) throws Exception;
}
