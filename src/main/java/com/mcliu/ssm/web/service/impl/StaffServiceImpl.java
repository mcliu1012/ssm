package com.mcliu.ssm.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aspire.webbas.portal.common.entity.Staff;
import com.mcliu.ssm.web.dao.StaffDao;
import com.mcliu.ssm.web.service.StaffService;

@Service("staffService")
public class StaffServiceImpl implements StaffService {

    @Autowired
    private StaffDao staffDao;

    public void addStaff(Staff staff) throws Exception {
        staffDao.insertStaff(staff);
    }

    public void updateStaff(Staff staff) throws Exception {
        staffDao.updateStaff(staff);
    }

    public void updateStaffPassword(Staff staff) throws Exception {
        staffDao.updateStaffPassword(staff);
    }

    public Staff getStaff(Long staffId) throws Exception {
        return staffDao.findStaff(staffId);
    }

    public Staff getStaffByLoginName(String loginName) throws Exception {
        return staffDao.findStaffByLoginName(loginName);
    }

    public List<Staff> getStaffByMap(Map<String, Object> paramMap) throws Exception {
        return staffDao.findStaffByMap(paramMap);
    }

    public Staff getStaffByNameAndPassword(Staff staff) throws Exception {
        return staffDao.findStaffByNameAndPassword(staff);
    }

}
