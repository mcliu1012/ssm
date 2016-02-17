package com.mcliu.ssm.web.dao;

import com.aspire.webbas.core.pagination.mybatis.pager.Page;
import com.aspire.webbas.portal.common.entity.Role;
import com.aspire.webbas.portal.common.entity.RoleResourceOperation;
import java.util.List;
import java.util.Map;

public abstract interface RoleDao {
    public abstract void insertRole(Role paramRole);

    public abstract void deleteRole(Long paramLong);

    public abstract void updateRole(Role paramRole);

    public abstract Role findRole(Long paramLong);

    public abstract Role findRoleByKey(String paramString);

    public abstract Role findRoleByName(String paramString);

    public abstract List<Role> listRole(Page<Role> paramPage);

    public abstract List<Role> listStaffRoles(Long paramLong);

    public abstract List<Role> listDepartmentRoles(Long paramLong);

    public abstract void insertRoleResourceOperation(RoleResourceOperation paramRoleResourceOperation);

    public abstract void deleteRoleResourceOperation(Map<String, Object> paramMap);

    public abstract void deleteRoleResourceOperationById(Long paramLong);
}
