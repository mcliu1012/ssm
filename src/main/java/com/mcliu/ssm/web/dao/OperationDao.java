package com.mcliu.ssm.web.dao;

import com.aspire.webbas.portal.common.entity.Operation;
import java.util.List;

public abstract interface OperationDao {
    public abstract void insertOperation(Operation paramOperation);

    public abstract void deleteOperation(Operation paramOperation);

    public abstract void updateOperation(Operation paramOperation);

    public abstract Operation findOperation(Operation paramOperation);

    public abstract List<Operation> listOperation(Operation paramOperation);

    public abstract List<Operation> listResourceOperationByStaffId(Long paramLong);

    public abstract List<Operation> listResourceKeyAndOperationKeyStaffId(Long paramLong);

    public abstract List<Operation> listOperationByRoleId(Long paramLong);
}
