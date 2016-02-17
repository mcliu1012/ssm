package com.mcliu.ssm.web.dao;

import com.aspire.webbas.portal.common.entity.Department;
import java.util.List;
import java.util.Map;

public abstract interface DepartmentDao {
    public abstract void insertDepartment(Department paramDepartment);

    public abstract void updateDepartment(Department paramDepartment);

    public abstract void deleteDepartment(Long paramLong);

    public abstract Department findDepartment(Long paramLong);

    public abstract List<Department> listDepartment(Department paramDepartment);

    public abstract void insertDepartmentRoles(Map<String, Object> paramMap);

    public abstract void deleteDepartmentRoles(Long paramLong);

    public abstract void deleteDepartmentRolesByRoleId(Long paramLong);

    public abstract void deleteDepartmentRolesByRoleIdAndDeptId(Map<String, Object> paramMap);

    public abstract List<Department> listPathFromRootToCurrentDepartmentId(Long paramLong);

    public abstract List<Department> listSelfAndSubDepartmentByDepartmentId(Map<String, Object> paramMap);
}
