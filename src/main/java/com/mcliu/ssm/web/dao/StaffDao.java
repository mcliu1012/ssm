package com.mcliu.ssm.web.dao;

import com.aspire.webbas.core.pagination.mybatis.pager.Page;
import com.aspire.webbas.portal.common.entity.SecStaffDepartmentRoleKey;
import com.aspire.webbas.portal.common.entity.Staff;
import com.aspire.webbas.portal.common.entity.StaffExtendProperty;
import java.util.List;
import java.util.Map;

public abstract interface StaffDao {
    public abstract void insertStaff(Staff paramStaff);

    public abstract void updateStaff(Staff paramStaff);

    public abstract void updateStaffPassword(Staff paramStaff);

    public abstract void deleteStaff(Long paramLong);

    public abstract void removeStaff(Long paramLong);

    public abstract Staff findStaff(Long paramLong);

    public abstract List<Staff> findStaffByMap(Map<String, Object> paramMap);

    public abstract Staff findStaffByLoginName(String paramString);

    public abstract Staff findStaffByNameAndPassword(Staff paramStaff);

    public abstract void insertStaffExtendProperties(StaffExtendProperty paramStaffExtendProperty);

    public abstract void deleteStaffExtendProperties(Long paramLong);

    public abstract List<StaffExtendProperty> listStaffExtendProperties(Long paramLong);

    public abstract List<Staff> listStaff(Page<Staff> paramPage);

    public abstract void insertStaffRoles(Map<String, Object> paramMap);

    public abstract void deleteStaffRoles(Long paramLong);

    public abstract void deleteStaffRolesByRoleId(Long paramLong);

    public abstract void deleteStaffRolesByStaffIdAndRoleId(Map<String, Object> paramMap);

    public abstract void deleteStaffRolesByDepartmentIdAndRoleId(Map<String, Object> paramMap);

    public abstract void deleteStaffRolesByDepartmentIdAndNotInStaffIds(Map<String, Object> paramMap);

    public abstract void insertStaffRolesByKey(Map<String, String> paramMap);

    public abstract List<Staff> listStaffByRole(Long paramLong);

    public abstract void clearStaffDepartment(Long paramLong);

    public abstract void updateStaffDepartment(Map<String, String> paramMap);

    public abstract void updateStaffDepartmentByStaffIds(Map<String, Object> paramMap);

    public abstract List<SecStaffDepartmentRoleKey> listRoleByStaffIds(Map<String, Object> paramMap);

    public abstract void updateStaffExtendProperties(StaffExtendProperty paramStaffExtendProperty);
}
