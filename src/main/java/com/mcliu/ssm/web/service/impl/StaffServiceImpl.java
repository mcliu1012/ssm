package com.mcliu.ssm.web.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aspire.webbas.core.pagination.mybatis.pager.Page;
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

    public void deleteStaff(Long staffId) throws Exception {
        staffDao.deleteStaff(staffId);
    }
    
    @Transactional
    public void saveAndUpdate(Staff staff) throws Exception {
        if (null != staff.getStaffId()) {// 判断有没有传主键，如果传了为更新，否则为新增
            this.updateStaff(staff);
        } else {
            this.addStaff(staff);
        }
    }

    public Page<Staff> pageQuery(Page<Staff> page) throws Exception {
        List<Staff> list = staffDao.listStaff(page);
        page.setDatas(list);
        return page;
    }
    
}
