package com.mcliu.ssm.util;

import java.util.HashMap;
import java.util.Map;

/**
 * 常量类
 */
public class Constant {
    /**
     * 运营商
     * YD: 移动
     * LT: 联通
     * DX: 电信
     */
    public static final String OPERATOR_YD = "YD";
    public static final String OPERATOR_LT = "LT";
    public static final String OPERATOR_DX = "DX";
    
    /**
     * ADMIN
     */
    public static final String ADMIN = "admin";
    
    /**
     * 支付宝标识
     */
    public static final String ALIPAY = "alipay";
    
    /**
     * 支付宝手机网站支付服务接口
     */
    public static final String ALIPAY_WAP = "alipay.wap.create.direct.pay.by.user";
    
    /**
     * 支付宝退款
     */
    public static final String ALIPAY_REFUND = "alipay_refund";
    
    /**
     * 系统菜单父节点ID
     */
    public static final Long PARENT_NODE_ID = 0L;
    
    /**
     * Session Key
     */
    public static final String COOKIE_LOGIN_NAME = "login_name";
}
