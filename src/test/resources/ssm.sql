/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2015-12-17 18:53:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `MENU_ID` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `MENU_NAME` varchar(64) NOT NULL COMMENT '菜单名称',
  `MENU_KEY` varchar(100) NOT NULL COMMENT '菜单外码',
  `PARENT_ID` bigint(10) NOT NULL COMMENT '父菜单ID',
  `IMAGE_URL` varchar(128) DEFAULT NULL COMMENT '图标Url',
  `URL` varchar(128) DEFAULT NULL COMMENT '资源URL',
  `MENU_ORDER` varchar(6) DEFAULT NULL COMMENT '菜单顺序',
  `SUBSYSTEM` varchar(32) DEFAULT NULL COMMENT '子系统名称',
  `DOMAIN` varchar(32) DEFAULT NULL COMMENT '菜单所属域（admin、sp）',
  PRIMARY KEY (`MENU_ID`),
  UNIQUE KEY `idx_menu_key` (`MENU_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=1698 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('308', '系统管理', 'auth_sysmgt_admin_sysmgtall', '0', 'menu-icon fa fa-pencil-square-o', null, '900000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('309', '修改帐号信息', 'auth_sysmgt_admin_sysmgtall_indiv_modifyinfo', '308', 'icon-user', '/pages/auth/individual/modifyInfo.shtml', '10000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('310', '修改密码', 'auth_sysmgt_admin_sysmgtall_indiv_modifypwd', '308', 'icon-lock', '/pages/auth/individual/modifyPwd.shtml', '20000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('311', '设置个性化参数', 'auth_sysmgt_admin_sysmgtall_indiv_setting', '308', ' icon-magnet', '/pages/auth/individual/selfConfigSetting.shtml', '30000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('312', '组织管理', 'auth_sysmgt_admin_sysmgtall_dept_deptmsg', '308', 'icon-sitemap', '/pages/auth/dept.shtml', '40000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('313', '成员管理', 'auth_sysmgt_admin_sysmgtall_dept_staffmgt', '308', 'icon-user-md', '/pages/auth/staff.shtml', '50000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('314', '角色管理', 'auth_sysmgt_admin_sysmgtall_dept_rolemgt', '308', 'icon-group', '/pages/auth/role.shtml', '60000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('315', '组织管理日志', 'auth_sysmgt_admin_sysmgtall_orgoperationlog', '308', 'icon-table', '/pages/auth/log/queryAccountLog.jsp', '70000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('1437', '通道信息管理', 'channel_info_manager', '0', 'menu-icon fa fa-magnet', null, '1', 'fmp-cgmp', 'admin');
INSERT INTO `menu` VALUES ('1438', '通道供应商', 'channel_supplier_list', '1437', 'icon-user', '/pages/channelSupplier_list.shtml', '1', 'fmp-cgmp', 'admin');
INSERT INTO `menu` VALUES ('1439', '接入通道', 'access_channel_info_list', '1437', 'icon-user', '/pages/accessChannelInfo_list.shtml', '2', 'fmp-cgmp', 'admin');
INSERT INTO `menu` VALUES ('1440', '接入通道组', 'access_channel_group_list', '1437', 'icon-user', '/pages/accessChannelGroup_list.shtml', '3', 'fmp-cgmp', 'admin');
INSERT INTO `menu` VALUES ('1441', '通道错误日志', 'channel_error_log_list', '1437', 'icon-user', '/pages/channelErrorLog_list.shtml', '4', 'fmp-cgmp', 'admin');
INSERT INTO `menu` VALUES ('1442', '通道维护信息', 'channel_maintain_info_list', '1437', 'icon-user', '/pages/channelMaintainInfo_list.shtml', '5', 'fmp-cgmp', 'admin');
INSERT INTO `menu` VALUES ('1647', '合作伙伴管理', 'partner_manager', '0', 'menu-icon fa fa-user-md', null, '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1648', '流量下发监控', 'partner_manager_activityOverview', '1647', 'icon-user', '/pages/activityOverview.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1649', '合作伙伴列表', 'partner_manager_list', '1647', 'icon-user', '/pages/partnerInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1650', '我的信息', 'partner_manager_self', '1647', 'icon-user', '/pages/partnerInfo_self_view.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1651', '订单管理', 'order_manager', '0', 'menu-icon fa fa-credit-card', null, '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1652', '订单列表', 'order_manager_lisst', '1651', 'icon-user', '/pages/orderInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1653', '客户管理', 'customer_manager', '0', 'menu-icon fa fa-users', null, '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1654', '客户管理', 'customer_manager_zc', '1653', 'icon-user', '/pages/customerInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1655', '客户微信配置管理', 'customer_wxAccessConf', '1653', 'icon-user', '/pages/card/wxAccessConf_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1656', '记录查询', 'record_manager', '0', 'menu-icon fa fa-th-list', null, '5', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1657', '兑换记录查询', 'record_manager_xf', '1656', 'icon-user', '/pages/marketingIssued_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1658', '直充记录查询', 'record_manager_zc', '1656', 'icon-user', '/pages/directCharge_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1659', '流量分发记录', 'flow_orderinfo_list', '1656', 'icon-user', '/pages/flowOrderInfo_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1660', '流量网关日志查询', 'mobile_flow_dispatch_rec', '1656', 'icon-user', '/pages/mobileFlowDispatchRec_list.shtml', '4', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1661', '订单处理记录查询', 'auth_order_deal_record', '1656', 'icon-user', '/pages/orderDealRecord_list.shtml', '5', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1662', '产品管理', 'prodcut_manager', '0', 'menu-icon fa fa-barcode', null, '7', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1663', '产品设置', 'prodcut_manager_cp', '1662', 'icon-user', '/pages/flowProductInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1664', '流量包设置', 'prodcut_manager_llb', '1662', 'icon-user', '/pages/flowPackageInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1665', '卡片管理', 'card_manager', '0', 'menu-icon fa fa-list-ul', null, '8', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1666', '流量+卡/券管理', 'card_manager_pc', '1665', 'icon-user', '/pages/flowCardBatchInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1667', '卡片查询', 'card_manager_kp', '1665', 'icon-user', '/pages/flowCardInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1668', '接入管理', 'access_manager', '0', 'menu-icon fa fa-magnet', null, '9', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1669', '短信接入', 'sms_access', '1668', 'icon-user', '/pages/smsChannelInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1670', 'APP接入', 'app_access', '1668', 'icon-user', '/pages/flowAppInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1671', 'APP版本管理', 'app_version', '1668', 'icon-user', '/pages/versionUpgradeInfo_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1672', '活动管理', 'campaign_info_manager', '0', 'menu-icon fa fa-bullhorn', null, '10', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1673', '营销活动', 'campaign_info', '1672', 'icon-user', '/pages/act/campaignInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1674', '中奖记录', 'campaign_info_reward', '1672', 'icon-user', '/pages/act/campaignRewardInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1675', '抽奖记录', 'campaign_info_draw', '1672', 'icon-user', '/pages/act/campaignDrawDetail_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1676', '合作伙伴账单管理', 'partner_bill_manager', '0', 'menu-icon fa fa-jpy', null, '11', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1677', '账户管理', 'partner_bill_list', '1676', 'icon-user', '/pages/partnerBill_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1678', '账单查询', 'partner_bill_query_view', '1676', 'icon-user', '/pages/partnerBillQuery_view.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1679', '结算单管理', 'partner_Settlement_order_list', '1676', 'icon-user', '/pages/partnerSettlementOrder_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1680', '客户账单管理', 'customer_bill_manager', '0', 'menu-icon fa fa-usd', null, '12', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1681', '账户管理', 'customer_bill_list', '1680', 'icon-user', '/pages/customerBill_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1682', '账单查询', 'customer_bill_query_view', '1680', 'icon-user', '/pages/customerBillQuery_view.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1683', '结算单管理', 'customer_Settlement_order_list', '1680', 'icon-user', '/pages/customerSettlementOrder_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1684', '贺卡管理', 'greeting_card_manage', '0', 'menu-icon fa fa-envelope', null, '13', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1685', '祝福语管理', 'greeting_info_manage', '1684', 'icon-user', '/pages/card/greetingInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1686', '贺卡活动', 'greeting_card_act', '1684', 'icon-user', '/pages/card/greetingCardAct_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1687', '贺卡列表', 'greeting_card_info_manage', '1684', 'icon-user', '/pages/card/greetingCardInfo_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1688', '我的贺卡', 'my_greeting_card_manage', '1684', 'icon-user', '/pages/card/myGreetingCard_list.shtml', '4', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1689', '微信支付记录', 'wxPayRecord_manage', '1684', 'icon-user', '/pages/card/wxPayRecord_list.shtml', '5', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1690', '流量营销活动', 'flow_greeting_card_manage', '0', 'menu-icon fa fa-envelope', null, '14', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1691', '营销活动配置', 'greeting_card', '1690', 'icon-user', '/pages/greeting_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1692', '水果机游戏配置', 'actTemplate_list', '1690', 'icon-user', '/pages/actTemplate_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1693', '签到送流量配置', 'sign_in_conf_list', '1690', 'icon-user', '/pages/signInConf_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1694', '领取信息', 'campaign_reward_list', '1690', 'icon-user', '/pages/campaignRewardInfo_list.shtml', '4', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1695', '广告位', 'adv', '0', 'menu-icon fa fa-envelope', null, '15', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1696', '广告位类别', 'advCategory_list', '1695', 'icon-user', '/pages/act/advCategory_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('1697', '广告位信息', 'adv_info_list', '1695', 'icon-user', '/pages/act/advInfo_list.shtml', '2', 'fmp-admin', 'admin');

-- ----------------------------
-- Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_id` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_name` varchar(255) DEFAULT NULL COMMENT '订单名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '订单价格',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------

-- ----------------------------
-- Table structure for `sec_operation`
-- ----------------------------
DROP TABLE IF EXISTS `sec_operation`;
CREATE TABLE `sec_operation` (
  `OPERATION_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源操作主键',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源主键',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '操作关键字',
  `OPERATION_NAME` varchar(100) NOT NULL COMMENT '操作名称',
  `OPERATION_DESC` varchar(100) DEFAULT NULL COMMENT '操作描述',
  `DEPEND_KEY` varchar(32) DEFAULT NULL COMMENT '依赖操作KEY',
  `DEPEND_BY_KEY` varchar(500) DEFAULT NULL COMMENT '被依赖操作KEY',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(5) DEFAULT NULL COMMENT '操作的顺序',
  PRIMARY KEY (`OPERATION_ID`),
  UNIQUE KEY `SEC_OPERATION_IDX` (`RESOURCE_ID`,`OPERATION_KEY`),
  CONSTRAINT `FK_sec_operation` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `sec_resources` (`RESOURCE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8 COMMENT='资源操作';

-- ----------------------------
-- Records of sec_operation
-- ----------------------------
INSERT INTO `sec_operation` VALUES ('39', '15', 'EXCLUDE', '例外', '例外', null, null, 'exclude_portal_admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('40', '16', 'EXCLUDE', '前台鉴权例外', '登录后就可访问', null, null, 'exclude_portal_admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('41', '17', 'EXCLUDE', '例外', '例外', null, null, 'exclude_auth_admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('42', '19', 'QUERY', '修改', '修改', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('43', '20', 'QUERY', '修改', '修改', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('44', '21', 'QUERY', '查询', '查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('45', '22', 'QUERY', '组织查询', '组织查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('46', '22', 'MODIFY', '组织修改', '组织修改', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('47', '22', 'DELETE', '组织删除', '组织删除', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('48', '22', 'ROLE2DEPT', '组织添加角色', '组织添加角色', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('49', '22', 'STAFF2DEPT', '组织添加用户', '组织添加用户', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('50', '22', 'AUTH2STAFF', '组织成员授权', '组织成员授权', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('51', '23', 'QUERY', '查询', '查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('52', '23', 'ADD', '创建', '创建用户', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('53', '23', 'UPDATE', '修改', '更新用户', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('54', '23', 'DELETE', '删除', '删除用户', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('55', '23', 'LOCKSTAFF', '锁定', '查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('56', '23', 'RESETPWD', '重置密码', '重置密码', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('57', '23', 'AUTHSTAFF', '授权', '用户授权', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('58', '24', 'QUERY', '查询', '查询', null, 'ADD,MODIFY,DELETE', 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('59', '24', 'ADD', '新增角色', '新增角色', 'QUERY', null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('60', '24', 'MODIFY', '修改角色', '修改角色', 'QUERY', null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('61', '24', 'DELETE', '删除角色', '删除角色', 'QUERY', null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('62', '24', 'AUTHROLE', '角色关联权限', '角色关联权限', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('442', '153', 'EXCLUDE', '例外', '例外', null, null, 'exclude_eump_admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('443', '154', 'EXCLUDE', '后台公用ACTION例外', '后台公用ACTION登录后就可访问', null, null, 'exclude_eump_admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('444', '155', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('445', '155', 'detail', '详情', '详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('446', '155', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('447', '155', 'changestatus', '修改状态', '修改状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('448', '155', 'resetPassword', '重置密码', '重置密码', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('449', '155', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('450', '155', 'self', '个人信息', '个人信息', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('451', '156', 'order_manager_query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('452', '156', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('453', '156', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('454', '156', 'creadcard', '制卡', '制卡', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('455', '156', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('456', '156', 'changestatus', '改变订单状态', '改变订单状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('457', '156', 'pricesetting', '价格设置', '价格设置', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('458', '157', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('459', '157', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('460', '157', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('461', '157', 'changestatus', '改变客户状态', '改变客户状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('462', '157', 'detail', '详情', '查看客户详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('463', '158', 'auth_record_manager_xf_query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('464', '159', 'auth_record_manager_zc_query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('465', '160', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('466', '161', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('467', '162', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('468', '162', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('469', '162', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('470', '162', 'detail', '详情', '查看产品详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('471', '163', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('472', '163', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('473', '163', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('474', '163', 'detail', '详情', '查看流量包详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('475', '164', 'query', '批次列表', '批次列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('476', '164', 'add', '创建卡片', '创建卡片', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('477', '164', 'detail', '详情', '批次表列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('478', '164', 'updateCustomerExChange', '更改兑换信息', '更改兑换信息', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('479', '164', 'invalid', '作废', '批次作废', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('480', '164', 'active', '激活', '激活', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('481', '164', 'export', '批量导出', '批量导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('482', '165', 'query', '卡片列表', '卡片列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('483', '165', 'invalid', '作废', '作废', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('484', '165', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('485', '166', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('486', '166', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('487', '166', 'del', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('488', '167', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('489', '167', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('490', '167', 'del', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');

-- ----------------------------
-- Table structure for `sec_operation_address`
-- ----------------------------
DROP TABLE IF EXISTS `sec_operation_address`;
CREATE TABLE `sec_operation_address` (
  `ADDRESS_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问地址ID',
  `RESOURCE_ID` bigint(20) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作外码',
  `OPERATION_ADDRESS_NAME` varchar(100) DEFAULT NULL COMMENT '访问地址名称',
  `OPERATION_ADDRESS_URL` varchar(128) NOT NULL COMMENT '访问地址URL（不包含协议、IP、端口、contextpath）',
  `PARAMETER_NAME1` varchar(64) DEFAULT NULL COMMENT '参数名一',
  `PARAMETER_VALUE1` varchar(64) DEFAULT NULL COMMENT '参数值一',
  `PARAMETER_NAME2` varchar(64) DEFAULT NULL COMMENT '参数名二',
  `PARAMETER_VALUE2` varchar(64) DEFAULT NULL COMMENT '参数值二',
  `PARAMETER_NAME3` varchar(64) DEFAULT NULL COMMENT '参数名三',
  `PARAMETER_VALUE3` varchar(64) DEFAULT NULL COMMENT '参数值三',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  PRIMARY KEY (`ADDRESS_ID`),
  UNIQUE KEY `UK_OPERATION_ADDRESS_URL` (`OPERATION_ADDRESS_URL`,`PARAMETER_NAME1`,`PARAMETER_VALUE1`,`PARAMETER_NAME2`,`PARAMETER_VALUE2`,`PARAMETER_NAME3`,`PARAMETER_VALUE3`),
  KEY `FK_sec_operation_address` (`RESOURCE_ID`,`OPERATION_KEY`),
  KEY `idx_sec_operation_address` (`OPERATION_ADDRESS_URL`),
  CONSTRAINT `FK_sec_operation_address` FOREIGN KEY (`RESOURCE_ID`, `OPERATION_KEY`) REFERENCES `sec_operation` (`RESOURCE_ID`, `OPERATION_KEY`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8 COMMENT='资源操作地址';

-- ----------------------------
-- Records of sec_operation_address
-- ----------------------------
INSERT INTO `sec_operation_address` VALUES ('128', '15', 'EXCLUDE', '校验码', '/code/getCode.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('129', '15', 'EXCLUDE', '登录action', '/portal/login.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('130', '15', 'EXCLUDE', '登录页面', '/pages/login.shtml', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('131', '15', 'EXCLUDE', '退出登录', '/portal/logout.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('132', '15', 'EXCLUDE', '协议阅读action', '/portal/readContractAgreement.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('133', '15', 'EXCLUDE', '协议阅读页面', '/pages/agreement.shtml', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('134', '15', 'EXCLUDE', '404错误页面', '/pages/404.shtml', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('135', '15', 'EXCLUDE', '500错误页面', '/pages/500.shtml', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('136', '15', 'EXCLUDE', '未授权提醒页面', '/pages/noAuthority.shtml', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('137', '15', 'EXCLUDE', '页面签权url', '/auth/pageAuth.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('138', '15', 'EXCLUDE', '页面签权url', '/auth/ifmStyle.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('139', '16', 'EXCLUDE', '首页菜单请求', '/portal/menu.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('140', '16', 'EXCLUDE', '首页', '/pages/main.shtml', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('141', '16', 'EXCLUDE', '取用户信息', '/staff/findLoginStaff.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('142', '16', 'EXCLUDE', '退出登录', '/portal/logout.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('143', '16', 'EXCLUDE', '个人管理页面', '/pages/auth/individual/modifyInfo.shtml', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('144', '16', 'EXCLUDE', '查询个人资料', '/staff/findLoginStaff.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('145', '16', 'EXCLUDE', '修改个人资料', '/staff/updateStaff.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('146', '16', 'EXCLUDE', '修改个人密码页面', '/pages/auth/individual/modifyPwd.shtml', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('147', '16', 'EXCLUDE', '修改个人密码', '/staff/changePwd.ajax', null, null, null, null, null, null, 'exclude_portal_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('148', '17', 'EXCLUDE', '启动', '/root.jsp', null, null, null, null, null, null, 'exclude_auth_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('149', '17', 'EXCLUDE', '上传组件添加action', '/attachment/add.ajax', null, null, null, null, null, null, 'exclude_auth_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('150', '17', 'EXCLUDE', '上传组件添加action', '/attachment/addForMulti.ajax', null, null, null, null, null, null, 'exclude_auth_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('151', '17', 'EXCLUDE', '上传组件下载action', '/attachment/download.ajax', null, null, null, null, null, null, 'exclude_auth_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('152', '17', 'EXCLUDE', '上传组件打包下载action', '/attachment/downloadMulti.ajax', null, null, null, null, null, null, 'exclude_auth_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('153', '17', 'EXCLUDE', '上传组件列表action', '/attachment/list.ajax', null, null, null, null, null, null, 'exclude_auth_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('154', '17', 'EXCLUDE', '上传组件回退action', '/attachment/withdraw.ajax', null, null, null, null, null, null, 'exclude_auth_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('155', '19', 'QUERY', '个人管理页面', '/pages/auth/individual/modifyInfo.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('156', '19', 'QUERY', '查询个人资料', '/staff/findLoginStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('157', '19', 'QUERY', '修改个人资料', '/staff/updateStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('158', '19', 'QUERY', '查询个人扩展属性', '/staff/findStaffExtendProperties.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('159', '20', 'QUERY', '修改个人密码页面', '/pages/auth/individual/modifyPwd.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('160', '20', 'QUERY', '修改个人密码', '/staff/changePwd.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('161', '21', 'QUERY', '个性化参数修改页面', '/pages/auth/individual/selfConfigSetting.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('162', '21', 'QUERY', '个性化参数查询', '/pendTaskSetting/get.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('163', '21', 'QUERY', '个性化参数设置', '/pendTaskSetting/update.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('164', '22', 'QUERY', '组织管理页面', '/pages/auth/dept.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('165', '22', 'QUERY', '组织树查询', '/department/listDepartmentTree.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('166', '22', 'QUERY', '组织查询', '/department/findDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('167', '22', 'QUERY', '组织详情查询', '/department/findDepartmentInfo.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('168', '22', 'QUERY', '更新组织', '/department/updateDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('169', '22', 'QUERY', '删除组织', '/department/delDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('170', '22', 'MODIFY', '更新组织', '/department/updateDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('171', '22', 'DELETE', '删除组织', '/department/delDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('172', '22', 'ROLE2DEPT', '添加组织角色', '/department/updateDepartmentRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('173', '22', 'ROLE2DEPT', '查询组织角色列表', '/department/listDepartmentRoles.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('174', '22', 'STAFF2DEPT', '查询组织用户列表', '/staff/listStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('175', '22', 'STAFF2DEPT', '添加组织用户', '/staff/updateStaffDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('176', '22', 'AUTH2STAFF', '查询角色关联下用户列表', '/staff/listRoleByStaffIds.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('177', '22', 'AUTH2STAFF', '组织里用户权限修改', '/staff/updateStaffRolesDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('178', '23', 'QUERY', '成员管理页面', '/pages/auth/staff.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('179', '23', 'QUERY', '查询请求', '/staff/listStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('180', '23', 'ADD', '查询用户是否存在', '/staff/checkStaffLoginName.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('181', '23', 'ADD', '查询用户是否存在', '/staff/checkStaffMobile.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('182', '23', 'ADD', '查询用户是否存在', '/staff/checkStaffEmail.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('183', '23', 'ADD', '创建请求', '/staff/createStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('184', '23', 'ADD', '查询个人扩展属性', '/staff/findStaffExtendProperties.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('185', '23', 'UPDATE', '查询用户是否存在', '/staff/checkStaffLoginName.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('186', '23', 'UPDATE', '获取用户详情', '/staff/findStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('187', '23', 'UPDATE', '更新', '/staff/updateStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('188', '23', 'UPDATE', '查询个人扩展属性', '/staff/findStaffExtendProperties.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('189', '23', 'DELETE', '删除请求', '/staff/deleteStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('190', '23', 'LOCKSTAFF', '锁定请求', '/staff/lockStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('191', '23', 'RESETPWD', '重置密码请求', '/staff/resetPwd.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('192', '23', 'AUTHSTAFF', '获取用户详情', '/staff/findStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('193', '23', 'AUTHSTAFF', '查询用户角色列表', '/staff/listStaffRoles.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('194', '23', 'AUTHSTAFF', '更新用户角色', '/staff/updateStaffRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('195', '24', 'QUERY', '浏览角色页面', '/pages/auth/role.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('196', '24', 'QUERY', '查看', '/role/listRoles.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('197', '24', 'ADD', '查询角色助记码是否存在', '/role/checkRoleKey.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('198', '24', 'ADD', '添加', '/role/updateRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('199', '24', 'MODIFY', '查询角色助记码是否存在', '/role/checkRoleKey.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('200', '24', 'MODIFY', '查询角色详情', '/role/findRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('201', '24', 'MODIFY', '修改', '/role/updateRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('202', '24', 'DELETE', '删除角色', '/role/deleteRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('203', '24', 'AUTHROLE', '浏览角色页面', '/pages/auth/roleSetting.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('204', '24', 'AUTHROLE', '权限列表', '/role/listRoleResource.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('205', '24', 'AUTHROLE', '关联角色权限', '/role/updateRoleResource.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('796', '153', 'EXCLUDE', '上传组件action', '/attachment/add.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('797', '153', 'EXCLUDE', '上传组件action', '/attachment/list.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('798', '153', 'EXCLUDE', '上传组件action', '/attachment/withdraw.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('799', '153', 'EXCLUDE', '上传组件列表action', '/attachment/download.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('800', '153', 'EXCLUDE', '上传组件回退action', '/attachment/downloadMulti.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('801', '153', 'EXCLUDE', '上传组件类型浏览action', '/attachment/view.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('802', '154', 'EXCLUDE', '上传组件列表action', '/codeDict/query.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('803', '155', 'query', '合作伙伴列表', '/pages/partnerInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('804', '155', 'query', '查询请求', '/partnerInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('805', '155', 'detail', '合作伙伴列表', '/pages/partnerInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('806', '155', 'detail', '查询请求', '/partnerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('807', '155', 'add', '页面', '/pages/partnerInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('808', '155', 'add', '新增请求', '/partnerInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('809', '155', 'add', '获取详情请求', '/partnerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('810', '155', 'add', '查询帐户请求', '/partnerInfo/queryStaff.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('811', '155', 'add', '查询产品信息', '/flowProductInfo/getByProductType.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('812', '155', 'add', '账号唯一判断', '/partnerInfo/soloAccount.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('813', '155', 'add', '删除产品关联', '/partnerInfo/deleteBySeqId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('814', '155', 'changestatus', '修改状态请求', '/partnerInfo/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('815', '155', 'resetPassword', '重置密码', '/partnerInfo/resetPassword.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('816', '155', 'delete', '删除', '/partnerInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('817', '155', 'self', '信息展示页面', '/pages/partnerInfo_self_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('818', '155', 'self', '获取个人信息', '/partnerInfo/getSelf.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('819', '156', 'order_manager_query', '订单列表', '/pages/orderInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('820', '156', 'order_manager_query', '获取数据', '/orderInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('821', '156', 'order_manager_query', '详情页面', '/pages/orderInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('822', '156', 'order_manager_query', '详情获取', '/orderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('823', '156', 'order_manager_query', '取出订单总数', '/orderInfo/getOrderNumber.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('824', '156', 'order_manager_query', '取出产品信息', '/flowProductInfo/flowProductInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('825', '156', 'order_manager_query', '产品详情', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('826', '156', 'order_manager_query', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('827', '156', 'delete', '删除', '/orderInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('828', '156', 'add', '添加页面', '/pages/orderInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('829', '156', 'add', '详情页面', '/pages/orderInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('830', '156', 'add', '详情获取', '/orderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('831', '156', 'add', '添加或更新数据', '/orderInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('832', '156', 'add', '获取客户信息', '/orderInfo/selectByPartnerId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('833', '156', 'add', '取出产品信息', '/flowProductInfo/flowProductInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('834', '156', 'add', '产品详情', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('835', '156', 'add', '订单详情初始化', '/orderInfo/orderInfoViewInit.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('836', '156', 'add', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('837', '156', 'creadcard', '制卡', '/pages/createCard.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('838', '156', 'export', '导出', '/orderInfo/downLoadOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('839', '156', 'changestatus', '改变订单状态', '/orderInfo/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('840', '156', 'pricesetting', '价格设置', '/pages/productPriceSetting.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('841', '156', 'pricesetting', '获取详情价格信息', '/orderInfo/selectDirectChargeProdOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('842', '156', 'pricesetting', '修改详情价格信息', '/orderInfo/updateODByProdId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('843', '157', 'query', '直销终端客户列表', '/pages/customerInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('844', '157', 'query', '获取数据', '/customerInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('845', '157', 'query', '添加页面', '/pages/customerInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('846', '157', 'query', '详情页面', '/pages/customerInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('847', '157', 'query', '详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('848', '157', 'add', '添加页面', '/pages/customerInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('849', '157', 'add', '添加或更新数据', '/customerInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('850', '157', 'add', '账号检测', '/customerInfo/soloAccount.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('851', '157', 'add', '手机号检测', '/customerInfo/soloMobile.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('852', '157', 'add', '详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('853', '157', 'add', '获取合作伙伴', '/customerInfo/queryPartnerInfoAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('854', '157', 'delete', '删除', '/customerInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('855', '157', 'changestatus', '改变客户状态', '/customerInfo/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('856', '157', 'detail', '详情页面', '/pages/customerInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('857', '157', 'detail', '详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('858', '158', 'auth_record_manager_xf_query', '下发记录列表', '/pages/marketingIssued_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('859', '158', 'auth_record_manager_xf_query', '查询', '/flowExchangeLog/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('860', '158', 'auth_record_manager_xf_query', '初始化', '/flowExchangeLog/init.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('861', '158', 'auth_record_manager_xf_query', '查询客户', '/orderInfo/selectByPartnerId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('862', '159', 'auth_record_manager_zc_query', '直充记录列表', '/pages/directCharge_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('863', '159', 'auth_record_manager_zc_query', '查询', '/flowExchangeLog/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('864', '159', 'auth_record_manager_zc_query', '初始化', '/flowExchangeLog/init.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('865', '159', 'auth_record_manager_zc_query', '初始化下发总数和总价', '/flowExchangeLog/initCountAndPriceTotal.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('866', '160', 'query', '列表', '/pages/flowOrderInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('867', '160', 'query', '列表查询', '/flowOrderInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('868', '160', 'query', '详情', '/pages/flowOrderInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('869', '160', 'query', '详情查询', '/flowOrderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('870', '161', 'query', '直充记录列表', '/pages/mobileFlowDispatchRec_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('871', '161', 'query', '查询', '/mobileFlowDispatchRec/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('872', '161', 'query', '详情', '/pages/mobileFlowDispatchRec_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('873', '161', 'query', '详情查询', '/mobileFlowDispatchRec/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('874', '162', 'query', '产品设置列表', '/pages/flowProductInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('875', '162', 'query', '获取数据', '/flowProductInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('876', '162', 'add', '添加页面', '/pages/flowProductInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('877', '162', 'add', '详情获取', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('878', '162', 'add', '流量包获取', '/flowProductInfo/operatorCode.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('879', '162', 'add', '添加或更新数据', '/flowProductInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('880', '162', 'add', '判断产品名称唯一', '/flowProductInfo/soloProductName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('881', '162', 'add', '判断产品代码唯一', '/flowProductInfo/soloProductCode.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('882', '162', 'delete', '删除', '/flowProductInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('883', '162', 'detail', '详情页面', '/pages/flowProductInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('884', '162', 'detail', '详情获取', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('885', '163', 'query', '流量包设置列表', '/pages/flowPackageInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('886', '163', 'query', '获取数据', '/flowPackageInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('887', '163', 'add', '操作码查询', '/flowPackageInfo/operatorCode.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('888', '163', 'add', '添加页面', '/pages/flowPackageInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('889', '163', 'add', '添加或更新数据', '/flowPackageInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('890', '163', 'delete', '删除', '/flowPackageInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('891', '163', 'detail', '详情页面', '/pages/flowPackageInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('892', '163', 'detail', '详情获取', '/flowPackageInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('893', '164', 'query', '批次列表', '/pages/flowCardBatchInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('894', '164', 'query', '获取卡片', '/flowCardBatchInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('895', '164', 'query', '获取所有客户', '/customerInfo/finaCustomerAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('896', '164', 'add', '创建卡页面', '/pages/createCard.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('897', '164', 'add', '创建卡操作', '/flowCardInfo/createFlowCards.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('898', '164', 'add', '获取订单', '/flowCardInfo/getPlusOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('899', '164', 'add', '获取订单详情', '/flowCardInfo/getOrderDetail.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('900', '164', 'add', '获取客户详情', '/flowCardInfo/getCustomerByType.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('901', '164', 'add', '获取激活卡信息', '/flowCardInfo/getCustomerCExchangeurlInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('902', '164', 'detail', '批次详情页面', '/pages/batchCardInfo.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('903', '164', 'detail', '批次详情请求', '/flowCardBatchInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('904', '164', 'detail', '订单详情获取', '/flowCardBatchInfo/getBydetailId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('905', '164', 'detail', '客户兑换页面更新', '/flowCardBatchInfo/updatecExchangeurlInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('906', '164', 'detail', 'c卡预览页', '/pages/c_page/indexC.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('907', '164', 'detail', '获取订单', '/flowCardInfo/getPlusOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('908', '164', 'detail', '获取订单详情', '/flowCardInfo/getOrderDetail.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('909', '164', 'detail', '获取客户详情', '/flowCardInfo/getCustomerByType.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('910', '164', 'detail', '获取激活卡信息', '/flowCardInfo/getCustomerCExchangeurlInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('911', '164', 'updateCustomerExChange', '客户兑换页面更新', '/flowCardBatchInfo/updatecExchangeurlInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('912', '164', 'invalid', '作废全部', '/flowCardInfo/updateCauseAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('913', '164', 'active', '激活卡页面', '/pages/activeCard.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('914', '164', 'active', '激活卡操作', '/flowCardInfo/createFlowCards.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('915', '164', 'active', '更新激活卡信息', '/flowCardInfo/updateCustomerInfoActiveCard.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('916', '164', 'active', '获取激活卡信息', '/flowCardInfo/getCustomerFlowFlowCardBatchInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('917', '164', 'export', '导出批量', '/flowCardInfo/excelByBatchId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('918', '165', 'query', '卡片列表', '/pages/flowCardInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('919', '165', 'query', '获取卡片', '/flowCardInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('920', '165', 'query', '详情页面', '/pages/flowCardInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('921', '165', 'query', '详情获取', '/flowCardInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('922', '165', 'query', '获取所有客户', '/customerInfo/finaCustomerAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('923', '165', 'invalid', '作废', '/flowCardInfo/updateCause.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('924', '165', 'export', '导出', '/flowCardInfo/excel.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('925', '166', 'query', '列表页面', '/pages/smsChannelInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('926', '166', 'query', '列表请求', '/smsChannelInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('927', '166', 'query', '详情页面', '/pages/smsChannelInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('928', '166', 'query', '详情获取', '/smsChannelInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('929', '166', 'add', '新增页面', '/pages/smsChannelInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('930', '166', 'add', '新增请求', '/smsChannelInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('931', '166', 'add', '详情获取', '/smsChannelInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('932', '166', 'del', '删除', '/smsChannelInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('933', '167', 'query', '列表页面', '/pages/flowAppInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('934', '167', 'query', '列表请求', '/flowAppInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('935', '167', 'query', '详情页面', '/pages/flowAppInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('936', '167', 'query', '详情获取', '/flowAppInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('937', '167', 'add', '新增页面', '/pages/flowAppInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('938', '167', 'add', '新增请求', '/flowAppInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('939', '167', 'add', '详情获取', '/flowAppInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('940', '167', 'add', '订单信息获取', '/orderInfo/queryOrderInfoByCustomer.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('941', '167', 'add', '短信通道获取', '/smsChannelInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('942', '167', 'del', '删除', '/flowAppInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');

-- ----------------------------
-- Table structure for `sec_resources`
-- ----------------------------
DROP TABLE IF EXISTS `sec_resources`;
CREATE TABLE `sec_resources` (
  `RESOURCE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `RESOURCE_KEY` varchar(100) NOT NULL COMMENT '资源外码',
  `RESOURCE_NAME` varchar(100) NOT NULL COMMENT '资源名称',
  `RESOURCE_DESC` varchar(100) DEFAULT NULL COMMENT '资源描述',
  `CATEGORY_ID` bigint(20) NOT NULL COMMENT '资源分类ID',
  `AUTH_TYPE` varchar(10) NOT NULL COMMENT '鉴权类型(AUTH：鉴权，UNAUTH：不鉴权，LOGIN_AUTH：登录鉴权)',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源的顺序',
  PRIMARY KEY (`RESOURCE_ID`),
  UNIQUE KEY `UNQ_RESOURCE_KEY` (`RESOURCE_KEY`),
  KEY `FK_sec_resources` (`CATEGORY_ID`),
  CONSTRAINT `FK_sec_resources` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `sec_resource_category` (`CATEGORY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of sec_resources
-- ----------------------------
INSERT INTO `sec_resources` VALUES ('15', 'exclude_portal_admin_session', 'session例外资源', 'session例外资源', '9', 'UNAUTH', 'exclude_portal_admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('16', 'exclude_portal_admin_perm', '鉴权例外资源', '鉴权例外资源', '9', 'LOGIN_AUTH', 'exclude_portal_admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('17', 'exclude_auth_admin_session', 'session例外资源', 'session例外资源', '10', 'UNAUTH', 'exclude_auth_admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('18', 'exclude_auth_admin_perm', '鉴权例外资源', '鉴权例外资源', '10', 'LOGIN_AUTH', 'exclude_auth_admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('19', 'auth_admin_sys_individual_modifyInfo', '修改帐号信息', '修改帐号信息', '12', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('20', 'auth_admin_sys_individual_modifyPwd', '修改个人密码', '修改个人密码', '12', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('21', 'auth_admin_sys_individual_selfconfig', '个性化参数设置', '个性化参数设置', '12', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('22', 'auth_admin_sys_dept_deptManage', '组织管理', '组织管理', '13', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('23', 'auth_admin_sys_staff_staffManage', '成员管理', '成员管理', '14', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('24', 'auth_admin_sys_role_roleManage', '角色管理', '角色管理', '15', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('153', 'exclude_eump_admin_session', 'session例外资源', 'session例外资源', '90', 'UNAUTH', 'exclude_eump_admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('154', 'exclude_admin_perm', '鉴权例外资源', '鉴权例外资源', '90', 'LOGIN_AUTH', 'exclude_eump_admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('155', 'auth_partner_manager_list', '合作伙伴列表', '合作伙伴列表', '92', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('156', 'auth_order_manager_list', '订单列表', '订单列表', '93', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('157', 'auth_customer_manager_zc', '客户管理', '客户管理', '94', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('158', 'auth_record_manager_xf', '下发记录查询', '下发记录查询', '95', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('159', 'auth_record_manager_zc', '直充记录查询', '直充记录查询', '95', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('160', 'auth_flow_orderinfo_list', '流量分发记录', '流量分发记录', '95', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('161', 'auth_mobile_flow_dispatch_rec', '流量网关日志查询', '流量网关日志查询', '95', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('162', 'auth_prodcut_manager_cp', '产品设置', '产品设置', '96', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('163', 'auth_prodcut_manager_llb', '流量包设置', '流量包设置', '96', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('164', 'auth_card_manager_gl', '卡片管理', '卡片管理', '97', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('165', 'auth_card_manager_cx', '卡片查询', '卡片查询', '97', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('166', 'auth_sms_access', '短信接入', '短信接入', '98', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('167', 'auth_app_access', 'APP接入', 'APP接入', '98', 'AUTH', 'fmp-admin', 'admin', '100');

-- ----------------------------
-- Table structure for `sec_resource_category`
-- ----------------------------
DROP TABLE IF EXISTS `sec_resource_category`;
CREATE TABLE `sec_resource_category` (
  `CATEGORY_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '资源分类ID',
  `PARENT_ID` bigint(20) DEFAULT NULL COMMENT '上级资源分类ID',
  `CATEGORY_NAME` varchar(100) DEFAULT NULL COMMENT '资源分类名称',
  `CATEGORY_DESC` varchar(100) DEFAULT NULL COMMENT '资源分类描述',
  `METADATA_ID` varchar(32) DEFAULT NULL COMMENT '元数据ID',
  `CATEGORY_KEY` varchar(100) DEFAULT NULL COMMENT '资源分类外码',
  `DOMAIN` varchar(20) DEFAULT NULL COMMENT '管理域：SP、ADMIN',
  `ORDER_KEY` int(11) DEFAULT NULL COMMENT '资源分类的顺序',
  PRIMARY KEY (`CATEGORY_ID`),
  KEY `FK_sec_resource_category` (`PARENT_ID`),
  CONSTRAINT `FK_sec_resource_category` FOREIGN KEY (`PARENT_ID`) REFERENCES `sec_resource_category` (`CATEGORY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='资源分类';

-- ----------------------------
-- Records of sec_resource_category
-- ----------------------------
INSERT INTO `sec_resource_category` VALUES ('9', null, 'portal例外资源', 'portal例外资源', 'exclude_portal_admin', 'exclude_portal_admin', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('10', null, 'admin端例外资源', 'admin端例外资源', 'exclude_auth_admin', 'exclude_auth_admin', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('11', null, '系统管理', '系统管理', 'auth', 'auth_admin', 'admin', '3000');
INSERT INTO `sec_resource_category` VALUES ('12', '11', '个人管理', '个人管理', 'auth', 'auth_admin_sys_individual', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('13', '11', '组织管理', '组织管理', 'auth', 'auth_admin_sys_dept', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('14', '11', '成员管理', '成员管理', 'auth', 'auth_admin_sys_staff', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('15', '11', '角色管理', '角色管理', 'auth', 'auth_admin_sys_role', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('90', null, 'admin端例外资源', 'admin端例外资源', 'exclude_eump_admin', 'exclude_eump_admin', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('91', null, '流量营销管理平台', '流量营销管理平台', 'fmp-admin', 'manager', 'admin', '2000');
INSERT INTO `sec_resource_category` VALUES ('92', '91', '合作伙伴管理', '合作伙伴管理', 'fmp-admin', 'auth_partner_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('93', '91', '订单管理', '订单管理', 'fmp-admin', 'auth_order_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('94', '91', '客户管理', '客户管理', 'fmp-admin', 'auth_customer_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('95', '91', '记录查询', '记录查询', 'fmp-admin', 'auth_record_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('96', '91', '产品管理', '产品管理', 'fmp-admin', 'auth_prodcut_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('97', '91', '卡片管理', '产品管理', 'fmp-admin', 'auth_card_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('98', '91', '接入管理', '接入管理', 'fmp-admin', 'auth_access_manager', 'admin', '100');

-- ----------------------------
-- Table structure for `sec_role`
-- ----------------------------
DROP TABLE IF EXISTS `sec_role`;
CREATE TABLE `sec_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) NOT NULL COMMENT '角色名称',
  `ROLE_DESC` varchar(400) DEFAULT NULL COMMENT '角色描述',
  `CREATE_USER` varchar(20) NOT NULL COMMENT '角色创建者',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '角色创建时间',
  `CAN_MODIFY` int(11) NOT NULL DEFAULT '1' COMMENT '是否允许修改 1：允许 0: 不充许 缺省=1',
  `LAST_UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '角色最后修改时间',
  `ROLE_KEY` varchar(64) DEFAULT NULL COMMENT '角色外码',
  `AUTO_ASSIGN` int(1) NOT NULL DEFAULT '0' COMMENT '自动分配(0:不自动分配；1：自动分配给所有注册成员)',
  `visible` int(1) NOT NULL DEFAULT '1' COMMENT '是否在界面上可见(0：不可见；1：可见)',
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `ROLE_KEY` (`ROLE_KEY`),
  KEY `IDX_ROLE_NAME` (`ROLE_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sec_role
-- ----------------------------
INSERT INTO `sec_role` VALUES ('1', '系统管理角色', '能够维护成员和组织信息、分配角色', 'dbscript', '2015-08-04 22:00:36', '1', '2015-08-04 00:00:00', '1001', '0', '1');
INSERT INTO `sec_role` VALUES ('2', '已注册成员拥有的角色', '所有已注册成员都属于该角色', 'roleImporter', '2015-08-04 22:00:31', '0', '2015-08-04 00:00:00', '101', '1', '0');
INSERT INTO `sec_role` VALUES ('3', '组织管理角色', '组织成员拥有该角色后，自动成为组织管理员，能够维护组织成员和子组织', 'roleImporter', '2015-08-04 22:00:32', '1', '2015-08-04 00:00:00', '1002', '0', '1');
INSERT INTO `sec_role` VALUES ('4', '系统配置角色', '能够进行角色管理', 'roleImporter', '2015-08-04 22:00:33', '1', '2015-08-04 00:00:00', '1003', '0', '1');
INSERT INTO `sec_role` VALUES ('5', '合作伙伴-直充', '', 'admin', '2015-08-04 22:07:05', '1', '2015-08-04 22:07:05', 'T1001', '0', '1');
INSERT INTO `sec_role` VALUES ('6', '运营管理员', '', 'admin', '2015-08-04 22:06:52', '1', '2015-08-04 22:06:52', 'P1001', '0', '1');
INSERT INTO `sec_role` VALUES ('7', '合作伙伴-流量', '', 'admin', '2015-08-04 22:07:21', '1', '2015-08-04 22:07:21', 'T1002', '0', '1');

-- ----------------------------
-- Table structure for `sec_role_resource_operation`
-- ----------------------------
DROP TABLE IF EXISTS `sec_role_resource_operation`;
CREATE TABLE `sec_role_resource_operation` (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `RESOURCE_ID` bigint(32) NOT NULL COMMENT '资源ID',
  `OPERATION_KEY` varchar(32) NOT NULL COMMENT '资源操作关键字',
  PRIMARY KEY (`ROLE_ID`,`RESOURCE_ID`,`OPERATION_KEY`),
  KEY `FK_sec_role_resource_operation` (`RESOURCE_ID`,`OPERATION_KEY`),
  CONSTRAINT `FK_sec_role_resource_operation` FOREIGN KEY (`RESOURCE_ID`, `OPERATION_KEY`) REFERENCES `sec_operation` (`RESOURCE_ID`, `OPERATION_KEY`) ON DELETE CASCADE,
  CONSTRAINT `FK_sec_role_resource_operation_role` FOREIGN KEY (`ROLE_ID`) REFERENCES `sec_role` (`ROLE_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与资源操作';

-- ----------------------------
-- Records of sec_role_resource_operation
-- ----------------------------
INSERT INTO `sec_role_resource_operation` VALUES ('2', '20', 'QUERY');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '22', 'AUTH2STAFF');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '22', 'AUTH2STAFF');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '22', 'DELETE');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '22', 'DELETE');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '22', 'MODIFY');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '22', 'MODIFY');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '22', 'QUERY');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '22', 'QUERY');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '22', 'ROLE2DEPT');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '22', 'ROLE2DEPT');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '22', 'STAFF2DEPT');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '22', 'STAFF2DEPT');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '23', 'ADD');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '23', 'ADD');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '23', 'AUTHSTAFF');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '23', 'AUTHSTAFF');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '23', 'DELETE');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '23', 'DELETE');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '23', 'LOCKSTAFF');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '23', 'LOCKSTAFF');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '23', 'QUERY');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '23', 'QUERY');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '23', 'RESETPWD');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '23', 'RESETPWD');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '23', 'UPDATE');
INSERT INTO `sec_role_resource_operation` VALUES ('3', '23', 'UPDATE');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '24', 'ADD');
INSERT INTO `sec_role_resource_operation` VALUES ('4', '24', 'ADD');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '24', 'AUTHROLE');
INSERT INTO `sec_role_resource_operation` VALUES ('4', '24', 'AUTHROLE');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '24', 'DELETE');
INSERT INTO `sec_role_resource_operation` VALUES ('4', '24', 'DELETE');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '24', 'MODIFY');
INSERT INTO `sec_role_resource_operation` VALUES ('4', '24', 'MODIFY');
INSERT INTO `sec_role_resource_operation` VALUES ('1', '24', 'QUERY');
INSERT INTO `sec_role_resource_operation` VALUES ('4', '24', 'QUERY');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '155', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '155', 'changestatus');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '155', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '155', 'detail');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '155', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '155', 'resetPassword');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '155', 'self');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '155', 'self');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '155', 'self');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '156', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '156', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '156', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '156', 'changestatus');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '156', 'creadcard');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '156', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '156', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '156', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '156', 'export');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '156', 'export');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '156', 'order_manager_query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '156', 'order_manager_query');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '156', 'order_manager_query');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '156', 'pricesetting');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '156', 'pricesetting');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '157', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '157', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '157', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '157', 'changestatus');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '157', 'changestatus');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '157', 'changestatus');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '157', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '157', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '157', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '157', 'detail');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '157', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '157', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '157', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '158', 'auth_record_manager_xf_query');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '158', 'auth_record_manager_xf_query');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '159', 'auth_record_manager_zc_query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '159', 'auth_record_manager_zc_query');
INSERT INTO `sec_role_resource_operation` VALUES ('5', '160', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '160', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('7', '160', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '161', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '162', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '162', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '162', 'detail');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '162', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '163', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '163', 'delete');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '163', 'detail');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '163', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '164', 'active');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '164', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '164', 'detail');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '164', 'export');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '164', 'invalid');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '164', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '164', 'updateCustomerExChange');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '165', 'export');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '165', 'invalid');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '165', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '166', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '166', 'del');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '166', 'query');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '167', 'add');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '167', 'del');
INSERT INTO `sec_role_resource_operation` VALUES ('6', '167', 'query');

-- ----------------------------
-- Table structure for `sec_staff`
-- ----------------------------
DROP TABLE IF EXISTS `sec_staff`;
CREATE TABLE `sec_staff` (
  `STAFF_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '成员ID',
  `LOGIN_NAME` varchar(100) NOT NULL COMMENT '登录名',
  `DEPARTMENT_ID` bigint(16) DEFAULT NULL COMMENT '组织ID',
  `REAL_NAME` varchar(100) NOT NULL COMMENT '成员姓名',
  `PASSWORD` varchar(128) NOT NULL COMMENT '密码（经过加密）',
  `STATUS` varchar(20) NOT NULL DEFAULT 'INITIAL' COMMENT '成员状态',
  `SEX` varchar(10) DEFAULT NULL COMMENT '性别：MALE-男性；FEMALE-女性；',
  `TELEPHONE` varchar(30) DEFAULT NULL COMMENT '电话',
  `MOBILE` varchar(16) NOT NULL COMMENT '手机号码',
  `EMAIL` varchar(64) DEFAULT NULL COMMENT '邮件地址',
  `CREATE_USER` varchar(16) NOT NULL COMMENT '成员创建者',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '成员创建时间',
  `EXPIRE_DATE` timestamp NULL DEFAULT NULL COMMENT '成员帐号过期时间',
  `LAST_UPDATE_DATE` timestamp NULL DEFAULT NULL COMMENT '成员最后修改时间',
  `PASSWORD_EXPIRE_DATE` timestamp NULL DEFAULT NULL COMMENT '密码失效时间',
  `LOCK_DATE` timestamp NULL DEFAULT NULL COMMENT '用户锁定时间',
  `CITY_ID` int(11) DEFAULT NULL COMMENT '成员所在城市（参见CITY表）',
  PRIMARY KEY (`STAFF_ID`),
  UNIQUE KEY `U_LOGIN_NAME` (`LOGIN_NAME`),
  UNIQUE KEY `U_MOBILE` (`MOBILE`),
  UNIQUE KEY `U_EMAIL` (`EMAIL`),
  KEY `idx_login_name` (`LOGIN_NAME`),
  KEY `FK_sec_staff` (`DEPARTMENT_ID`),
  CONSTRAINT `FK_sec_staff` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `sec_department` (`DEPARTMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='成员';

-- ----------------------------
-- Records of sec_staff
-- ----------------------------
INSERT INTO `sec_staff` VALUES ('-999', 'admin', null, '超级管理员', 'kMoFF56UCVNogmuHBaeCzg==', 'NORMAL', 'MALE', '', '13688888888', '', 'system', '2015-08-04 22:05:11', '2016-08-03 21:55:11', '2015-08-04 21:55:11', '2016-08-03 21:55:11', null, null);
INSERT INTO `sec_staff` VALUES ('1', 'fmp-test', '4', '运营管理员', 'lL7M+BVeQNwTmwi/mbf4kw==', 'INITIAL', 'MALE', '', '13424307484', '12@1.com', 'admin', '2015-08-04 22:10:49', null, '2015-08-04 22:10:49', null, null, null);
INSERT INTO `sec_staff` VALUES ('2', 'snow85', '3', '陈', '4yD7rQoxSMp7aqbsjVFioQ==', 'NORMAL', 'MALE', null, '13510887654', 'snow85@gmail.com', 'fmp-test', '2015-08-05 10:24:47', null, '2015-08-05 10:24:47', null, null, null);
INSERT INTO `sec_staff` VALUES ('3', 'OPPO', '3', 'wf', 'lCmhZFqtgOj00eFtgCHM9w==', 'NORMAL', 'MALE', null, '13018036817', '13018036817@163.com', 'fmp-test', '2015-08-05 11:35:44', null, '2015-08-06 14:35:19', null, null, null);
INSERT INTO `sec_staff` VALUES ('4', 'VIVO', '3', 'VIVO', 'dP2aKo5aDxS2WKBLjfMEXg==', 'NORMAL', 'MALE', null, '13600157616', '13600157616@163.com', 'fmp-test', '2015-08-05 17:42:02', null, '2015-08-06 10:09:19', null, null, null);
INSERT INTO `sec_staff` VALUES ('5', 'suning', '2', '苏宁', 'y+AnSkaAaM7irlIKJdtovQ==', 'INITIAL', 'MALE', '', '18664222330', '18664222330@163.com', 'fmp-test', '2015-08-12 11:01:30', null, '2015-08-17 11:10:55', null, null, null);
INSERT INTO `sec_staff` VALUES ('6', 'gy', '3', 'eqe', 'SGgbIuW4tm8F2wANKU7Crw==', 'INITIAL', 'MALE', null, '13563609550', '1@1.com', 'fmp-test', '2015-08-06 14:23:46', null, '2015-08-17 10:11:39', null, null, null);
INSERT INTO `sec_staff` VALUES ('7', 'wangml', '3', 'wangml', 'WIHvFu0+J5WGkY85OTgfqA==', 'NORMAL', 'MALE', null, '15399705971', 'wangml@163.com', 'fmp-test', '2015-08-10 10:24:08', null, '2015-08-10 10:24:08', null, null, null);
INSERT INTO `sec_staff` VALUES ('9', 'test123', '3', 'wangml', '4nmipctwqBaX8x8bfNZ7GQ==', 'INITIAL', 'MALE', null, '15675681432', 'wml@163.com', 'fmp-test', '2015-08-14 12:01:49', null, '2015-08-17 15:22:52', null, null, null);
INSERT INTO `sec_staff` VALUES ('10', 'wyzt', '3', '威宇', 'MQyfUdMdOv4UFxGZpASggA==', 'NORMAL', 'MALE', null, '15386985621', '15386985621@163.com', 'fmp-test', '2015-08-11 11:01:53', null, '2015-08-14 14:43:58', null, null, null);
INSERT INTO `sec_staff` VALUES ('11', '15201441700', '3', '王名亮', 'TQSWqN8+iis6re/6udtiSQ==', 'NORMAL', 'MALE', null, '15201441700', 'wangml@szwisdom.cn', 'fmp-test', '2015-08-11 18:56:01', null, '2015-08-17 15:01:59', null, null, null);
INSERT INTO `sec_staff` VALUES ('12', 'lhg', '3', '李洪刚', 'zp1AWfZgifQk/9+1EbNxKw==', 'NORMAL', 'MALE', null, '18664222338', '18664222338@163.com', 'fmp-test', '2015-08-12 15:19:42', null, '2015-08-12 10:47:49', null, null, null);
INSERT INTO `sec_staff` VALUES ('13', '1', '3', 'd', 'DvApxuZn19jsIv6NJxYCaQ==', 'NORMAL', 'FEMALE', '', '13245678958', '1@163.comh', 'lhg', '2015-08-12 11:01:21', null, '2015-08-12 18:04:37', null, null, null);
INSERT INTO `sec_staff` VALUES ('14', 'nfds', '3', '南方', 'qM4SOMbmLPrPVANiQfM+6Q==', 'NORMAL', 'MALE', null, '13600157895', '13600157895@qq.com', 'fmp-test', '2015-08-14 14:51:21', null, '2015-08-14 14:51:21', null, null, null);
INSERT INTO `sec_staff` VALUES ('15', 'sss', '3', 'sss', 'l36eaQbtXl5EyC/ZE8BxrQ==', 'NORMAL', 'MALE', null, '13245678951', 'sss@qq.qq', 'fmp-test', '2015-08-17 10:14:12', null, '2015-08-17 15:43:10', null, null, null);
INSERT INTO `sec_staff` VALUES ('16', 'rhkj', '3', '瑞恒', '+H40Aw2E/9D3lMHILorvZw==', 'NORMAL', 'MALE', null, '15625299201', '15625299201@163.com', 'fmp-test', '2015-08-17 11:32:37', null, '2015-08-17 14:40:22', null, null, null);

-- ----------------------------
-- Table structure for `sec_staff_role`
-- ----------------------------
DROP TABLE IF EXISTS `sec_staff_role`;
CREATE TABLE `sec_staff_role` (
  `STAFF_ID` bigint(20) NOT NULL COMMENT '成员ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`STAFF_ID`,`ROLE_ID`),
  KEY `FK_sec_staff_role2` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员角色关系表';

-- ----------------------------
-- Records of sec_staff_role
-- ----------------------------
