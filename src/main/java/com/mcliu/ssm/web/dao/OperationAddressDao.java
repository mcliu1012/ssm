package com.mcliu.ssm.web.dao;

import com.aspire.webbas.portal.common.entity.OperationAddress;
import java.util.List;
import java.util.Map;

public abstract interface OperationAddressDao {
    public abstract void insertOperationAddress(OperationAddress paramOperationAddress);

    public abstract void updateOperationAddress(OperationAddress paramOperationAddress);

    public abstract void deleteOperationAddress(OperationAddress paramOperationAddress);

    public abstract OperationAddress findOperationAddress(String paramString);

    public abstract OperationAddress findOperationAddressByInfo(OperationAddress paramOperationAddress);

    public abstract List<OperationAddress> listOperationAddress(OperationAddress paramOperationAddress);

    public abstract List<OperationAddress> listOperationAddressByLoginName(String paramString);

    public abstract Integer findOperationAddressByStaff(Map<String, Object> paramMap);

    public abstract List<OperationAddress> listOperationAddressByAuthType(String paramString);
}
