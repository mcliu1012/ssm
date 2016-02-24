/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-02-24 18:10:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for menu
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
) ENGINE=InnoDB AUTO_INCREMENT=9724 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('9664', '系统管理', 'auth_sysmgt_admin_sysmgtall', '0', 'menu-icon fa fa-pencil-square-o', null, '900000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('9665', '修改帐号信息', 'auth_sysmgt_admin_sysmgtall_indiv_modifyinfo', '9664', 'icon-user', '/pages/auth/individual/modifyInfo.shtml', '10000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('9666', '修改密码', 'auth_sysmgt_admin_sysmgtall_indiv_modifypwd', '9664', 'icon-lock', '/pages/auth/individual/modifyPwd.shtml', '20000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('9667', '设置个性化参数', 'auth_sysmgt_admin_sysmgtall_indiv_setting', '9664', ' icon-magnet', '/pages/auth/individual/selfConfigSetting.shtml', '30000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('9668', '组织管理', 'auth_sysmgt_admin_sysmgtall_dept_deptmsg', '9664', 'icon-sitemap', '/pages/auth/dept.shtml', '40000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('9669', '成员管理', 'auth_sysmgt_admin_sysmgtall_dept_staffmgt', '9664', 'icon-user-md', '/pages/auth/staff.shtml', '50000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('9670', '角色管理', 'auth_sysmgt_admin_sysmgtall_dept_rolemgt', '9664', 'icon-group', '/pages/auth/role.shtml', '60000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('9671', '组织管理日志', 'auth_sysmgt_admin_sysmgtall_orgoperationlog', '9664', 'icon-table', '/pages/auth/log/queryAccountLog.jsp', '70000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('9672', '合作伙伴管理', 'partner_manager', '0', 'menu-icon fa fa-user-md', null, '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9673', '流量下发监控', 'partner_manager_activityOverview', '9672', 'icon-user', '/pages/activityOverview.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9674', '合作伙伴列表', 'partner_manager_list', '9672', 'icon-user', '/pages/partnerInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9675', '我的信息', 'partner_manager_self', '9672', 'icon-user', '/pages/partnerInfo_self_view.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9676', '订单管理', 'order_manager', '0', 'menu-icon fa fa-credit-card', null, '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9677', '订单列表', 'order_manager_lisst', '9676', 'icon-user', '/pages/orderInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9678', '客户管理', 'customer_manager', '0', 'menu-icon fa fa-users', null, '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9679', '客户管理', 'customer_manager_zc', '9678', 'icon-user', '/pages/customerInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9680', '客户微信配置管理', 'customer_wxAccessConf', '9678', 'icon-user', '/pages/card/wxAccessConf_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9681', '记录查询', 'record_manager', '0', 'menu-icon fa fa-th-list', null, '5', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9682', '兑换记录查询', 'record_manager_xf', '9681', 'icon-user', '/pages/marketingIssued_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9683', '直充记录查询', 'record_manager_zc', '9681', 'icon-user', '/pages/directCharge_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9684', '流量分发记录', 'flow_orderinfo_list', '9681', 'icon-user', '/pages/flowOrderInfo_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9685', '流量分发记录(财务)', 'flow_orderinfofinance_list', '9681', 'icon-user', '/pages/flowOrderInfoFinance_list.shtml', '4', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9686', '流量网关日志查询', 'mobile_flow_dispatch_rec', '9681', 'icon-user', '/pages/mobileFlowDispatchRec_list.shtml', '5', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9687', '订单处理记录查询', 'auth_order_deal_record', '9681', 'icon-user', '/pages/orderDealRecord_list.shtml', '6', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9688', '产品管理', 'prodcut_manager', '0', 'menu-icon fa fa-barcode', null, '7', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9689', '产品设置', 'prodcut_manager_cp', '9688', 'icon-user', '/pages/flowProductInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9690', '流量包设置', 'prodcut_manager_llb', '9688', 'icon-user', '/pages/flowPackageInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9691', '卡片管理', 'card_manager', '0', 'menu-icon fa fa-list-ul', null, '8', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9692', '流量+卡/券管理', 'card_manager_pc', '9691', 'icon-user', '/pages/flowCardBatchInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9693', '卡片查询', 'card_manager_kp', '9691', 'icon-user', '/pages/flowCardInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9694', '接入管理', 'access_manager', '0', 'menu-icon fa fa-magnet', null, '9', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9695', '短信接入', 'sms_access', '9694', 'icon-user', '/pages/smsChannelInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9696', 'APP接入', 'app_access', '9694', 'icon-user', '/pages/flowAppInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9697', 'APP版本管理', 'app_version', '9694', 'icon-user', '/pages/versionUpgradeInfo_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9698', '活动管理', 'campaign_info_manager', '0', 'menu-icon fa fa-bullhorn', null, '10', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9699', '营销活动', 'campaign_info', '9698', 'icon-user', '/pages/act/campaignInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9700', '中奖记录', 'campaign_info_reward', '9698', 'icon-user', '/pages/act/campaignRewardInfo_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9701', '抽奖记录', 'campaign_info_draw', '9698', 'icon-user', '/pages/act/campaignDrawDetail_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9702', '合作伙伴账单管理', 'partner_bill_manager', '0', 'menu-icon fa fa-jpy', null, '11', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9703', '账户管理', 'partner_bill_list', '9702', 'icon-user', '/pages/partnerBill_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9704', '账单查询', 'partner_bill_query_view', '9702', 'icon-user', '/pages/partnerBillQuery_view.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9705', '结算单管理', 'partner_Settlement_order_list', '9702', 'icon-user', '/pages/partnerSettlementOrder_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9706', '客户账单管理', 'customer_bill_manager', '0', 'menu-icon fa fa-usd', null, '12', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9707', '账户管理', 'customer_bill_list', '9706', 'icon-user', '/pages/customerBill_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9708', '账单查询', 'customer_bill_query_view', '9706', 'icon-user', '/pages/customerBillQuery_view.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9709', '结算单管理', 'customer_Settlement_order_list', '9706', 'icon-user', '/pages/customerSettlementOrder_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9710', '贺卡管理', 'greeting_card_manage', '0', 'menu-icon fa fa-envelope', null, '13', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9711', '祝福语管理', 'greeting_info_manage', '9710', 'icon-user', '/pages/card/greetingInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9712', '贺卡活动', 'greeting_card_act', '9710', 'icon-user', '/pages/card/greetingCardAct_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9713', '贺卡列表', 'greeting_card_info_manage', '9710', 'icon-user', '/pages/card/greetingCardInfo_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9714', '我的贺卡', 'my_greeting_card_manage', '9710', 'icon-user', '/pages/card/myGreetingCard_list.shtml', '4', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9715', '微信支付记录', 'wxPayRecord_manage', '9710', 'icon-user', '/pages/card/wxPayRecord_list.shtml', '5', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9716', '流量营销活动', 'flow_greeting_card_manage', '0', 'menu-icon fa fa-envelope', null, '14', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9717', '营销活动配置', 'greeting_card', '9716', 'icon-user', '/pages/greeting_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9718', '水果机游戏配置', 'actTemplate_list', '9716', 'icon-user', '/pages/actTemplate_list.shtml', '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9719', '签到送流量配置', 'sign_in_conf_list', '9716', 'icon-user', '/pages/signInConf_list.shtml', '3', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9720', '领取信息', 'campaign_reward_list', '9716', 'icon-user', '/pages/campaignRewardInfo_list.shtml', '4', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9721', '广告位', 'adv', '0', 'menu-icon fa fa-envelope', null, '15', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9722', '广告位类别', 'advCategory_list', '9721', 'icon-user', '/pages/act/advCategory_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9723', '广告位信息', 'adv_info_list', '9721', 'icon-user', '/pages/act/advInfo_list.shtml', '2', 'fmp-admin', 'admin');

-- ----------------------------
-- Table structure for order_info
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
-- Table structure for sec_department
-- ----------------------------
DROP TABLE IF EXISTS `sec_department`;
CREATE TABLE `sec_department` (
  `DEPARTMENT_ID` bigint(16) NOT NULL AUTO_INCREMENT COMMENT '组织ID',
  `DEPARTMENT_NAME` varchar(100) NOT NULL COMMENT '组织名称',
  `DEPARTMENT_DESC` varchar(100) DEFAULT NULL COMMENT '组织描述',
  `PARENT_ID` bigint(16) DEFAULT NULL COMMENT '父级组织',
  `EMAIL` varchar(50) DEFAULT NULL COMMENT '组织的邮件',
  `ADDRESS` varchar(200) DEFAULT NULL COMMENT '组织地址',
  `ADD_SUB` varchar(1) NOT NULL DEFAULT '1' COMMENT '是否可以创建下级组织',
  `CREATE_USER` varchar(20) NOT NULL COMMENT '组织创建者',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '组织创建时间',
  `LAST_UPDATE_DATE` timestamp NULL DEFAULT NULL COMMENT '组织最后修改时间',
  `DOMAIN` varchar(10) DEFAULT 'SYS_ADMIN' COMMENT '管理域：SP、SYS_ADMIN',
  PRIMARY KEY (`DEPARTMENT_ID`),
  KEY `FK_sec_department` (`PARENT_ID`),
  CONSTRAINT `FK_sec_department` FOREIGN KEY (`PARENT_ID`) REFERENCES `sec_department` (`DEPARTMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='组织';

-- ----------------------------
-- Records of sec_department
-- ----------------------------
INSERT INTO `sec_department` VALUES ('-999', '根组织', '所有组织的根', null, 'xx@xx.com', 'xx', '0', 'system', '2015-08-04 21:55:11', '2015-08-04 21:55:11', '');
INSERT INTO `sec_department` VALUES ('-998', '威宇智通', '所有威宇智通的根组织', '-999', 'xx@xx.com', 'xx', '1', 'system', '2015-08-04 22:05:50', '2015-08-04 22:05:50', 'SYS_ADMIN');
INSERT INTO `sec_department` VALUES ('1', '合作伙伴', '', '-998', '', '', '1', 'admin', '2015-08-04 22:09:02', '2015-08-04 22:09:02', 'SP');
INSERT INTO `sec_department` VALUES ('2', '合作伙伴-直充', '', '1', '', '', '1', 'admin', '2015-08-04 22:09:24', '2015-08-04 22:09:24', 'SP');
INSERT INTO `sec_department` VALUES ('3', '合作伙伴-流量', '', '1', '', '', '1', 'admin', '2015-08-04 22:09:40', '2015-08-04 22:09:40', 'SP');
INSERT INTO `sec_department` VALUES ('4', '运营管理员', '', '-998', '', '', '1', 'admin', '2015-08-04 22:10:01', '2015-08-04 22:10:01', 'SYS_ADMIN');

-- ----------------------------
-- Table structure for sec_department_role
-- ----------------------------
DROP TABLE IF EXISTS `sec_department_role`;
CREATE TABLE `sec_department_role` (
  `DEPARTMENT_ID` bigint(16) NOT NULL COMMENT '组织ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`DEPARTMENT_ID`,`ROLE_ID`),
  KEY `FK_sec_department_role2` (`ROLE_ID`),
  CONSTRAINT `FK_sec_department_role` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `sec_department` (`DEPARTMENT_ID`),
  CONSTRAINT `FK_sec_department_role2` FOREIGN KEY (`ROLE_ID`) REFERENCES `sec_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织角色关联表';

-- ----------------------------
-- Records of sec_department_role
-- ----------------------------
INSERT INTO `sec_department_role` VALUES ('-998', '1');
INSERT INTO `sec_department_role` VALUES ('4', '1');
INSERT INTO `sec_department_role` VALUES ('4', '3');
INSERT INTO `sec_department_role` VALUES ('4', '4');
INSERT INTO `sec_department_role` VALUES ('1', '5');
INSERT INTO `sec_department_role` VALUES ('2', '5');
INSERT INTO `sec_department_role` VALUES ('4', '6');
INSERT INTO `sec_department_role` VALUES ('1', '7');
INSERT INTO `sec_department_role` VALUES ('3', '7');

-- ----------------------------
-- Table structure for sec_operation
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
) ENGINE=InnoDB AUTO_INCREMENT=25249 DEFAULT CHARSET=utf8 COMMENT='资源操作';

-- ----------------------------
-- Records of sec_operation
-- ----------------------------
INSERT INTO `sec_operation` VALUES ('25090', '7567', 'get', '流量下发监控', '流量下发监控', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25091', '7568', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25092', '7568', 'detail', '详情', '详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25093', '7568', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25094', '7568', 'changestatus', '修改状态', '修改状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25095', '7568', 'resetPassword', '重置密码', '重置密码', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25096', '7568', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25097', '7568', 'self', '个人信息', '个人信息', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25098', '7569', 'order_manager_query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25099', '7569', 'detail', '详情', '详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25100', '7569', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25101', '7569', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25102', '7569', 'modify', '修改', '修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25103', '7569', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25104', '7569', 'changestatus', '改变订单状态', '改变订单状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25105', '7569', 'pricesetting', '价格设置', '价格设置', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25106', '7570', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25107', '7570', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25108', '7570', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25109', '7570', 'changestatus', '改变客户状态', '改变客户状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25110', '7570', 'detail', '详情', '查看客户详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25111', '7571', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25112', '7571', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25113', '7571', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25114', '7571', 'detail', '详情', '查看客户微信配置详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25115', '7572', 'auth_record_manager_xf_query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25116', '7573', 'auth_record_manager_zc_query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25117', '7574', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25118', '7574', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25119', '7575', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25120', '7575', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25121', '7576', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25122', '7576', 'excel', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25123', '7577', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25124', '7577', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25125', '7577', 'download', '下载', '下载', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25126', '7578', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25127', '7578', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25128', '7578', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25129', '7578', 'detail', '详情', '查看产品详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25130', '7579', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25131', '7579', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25132', '7579', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25133', '7579', 'detail', '详情', '查看流量包详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25134', '7580', 'query', '批次列表', '批次列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25135', '7580', 'add', '创建卡片', '创建卡片', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25136', '7580', 'detail', '详情', '批次表列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25137', '7580', 'updateCustomerExChange', '更改兑换信息', '更改兑换信息', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25138', '7580', 'invalid', '作废', '批次作废', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25139', '7580', 'active', '激活', '激活', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25140', '7580', 'export', '批量导出', '批量导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25141', '7581', 'query', '卡片列表', '卡片列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25142', '7581', 'invalid', '作废', '作废', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25143', '7581', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25144', '7582', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25145', '7582', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25146', '7582', 'del', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25147', '7583', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25148', '7583', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25149', '7583', 'del', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25150', '7583', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25151', '7583', 'changestatus', '修改接入状态', '修改接入状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25152', '7584', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25153', '7584', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25154', '7584', 'del', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25155', '7585', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25156', '7585', 'detail', '详情', '详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25157', '7585', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25158', '7585', 'del', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25159', '7585', 'changeStatus', '修改状态', '修改状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25160', '7586', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25161', '7586', 'detail', '详情', '详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25162', '7586', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25163', '7587', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25164', '7587', 'detail', '详情', '详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25165', '7587', 'excel', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25166', '7588', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25167', '7588', 'detail', '详情', '详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25168', '7588', 'accountDetail', '账户明细', '账户明细', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25169', '7588', 'accountChange', '账户充值和信用额度调整', '账户充值和信用额度调整', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25170', '7589', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25171', '7589', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25172', '7590', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25173', '7590', 'changeStatus', '调整结算单状态', '调整结算单状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25174', '7590', 'changeAdjustBalance', '调整金额', '调整金额', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25175', '7590', 'downLoadSettlementOrder', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25176', '7591', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25177', '7591', 'accountDetail', '账户明细', '账户明细', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25178', '7591', 'accountChange', '账户充值和信用额度调整', '账户充值和信用额度调整', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25179', '7592', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25180', '7592', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25181', '7593', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25182', '7593', 'changeStatus', '调整结算单状态', '调整结算单状态', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25183', '7593', 'changeAdjustBalance', '调整金额', '调整金额', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25184', '7593', 'downLoadSettlementOrder', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25185', '7594', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25186', '7594', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25187', '7594', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25188', '7594', 'detail', '详情', '查看客户详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25189', '7595', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25190', '7595', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25191', '7595', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25192', '7595', 'detail', '详情', '查看客户详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25193', '7596', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25194', '7596', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25195', '7596', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25196', '7596', 'detail', '详情', '查看客户详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25197', '7597', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25198', '7597', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25199', '7597', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25200', '7597', 'detail', '详情', '查看客户详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25201', '7598', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25202', '7598', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25203', '7598', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25204', '7598', 'detail', '详情', '查看客户详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25205', '7599', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25206', '7599', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25207', '7599', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25208', '7599', 'detail', '详情', '查看活动详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25209', '7600', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25210', '7601', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25211', '7601', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25212', '7602', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25213', '7602', 'export', '导出', '导出', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25214', '7603', 'query', '水果机游戏列表', '水果机游戏列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25215', '7603', 'add', '水果机新增/修改', '水果机新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25216', '7604', 'query', '签到送流量列表', '签到送流量列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25217', '7604', 'add', '签到新增/修改', '签到新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25218', '7605', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25219', '7605', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25220', '7605', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25221', '7605', 'detail', '详情', '查看活动详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25222', '7606', 'query', '查看', '查看', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25223', '7606', 'add', '新增', '新增', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25224', '7606', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25225', '7606', 'detail', '详情', '查看活动详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25226', '7607', 'EXCLUDE', '例外', '例外', null, null, 'exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_operation` VALUES ('25227', '7608', 'EXCLUDE', '后台公用ACTION例外', '后台公用ACTION登录后就可访问', null, null, 'exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_operation` VALUES ('25228', '7609', 'QUERY', '修改', '修改', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25229', '7610', 'QUERY', '修改', '修改', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25230', '7611', 'QUERY', '查询', '查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25231', '7612', 'QUERY', '组织查询', '组织查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25232', '7612', 'MODIFY', '组织修改', '组织修改', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25233', '7612', 'DELETE', '组织删除', '组织删除', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25234', '7612', 'ROLE2DEPT', '组织添加角色', '组织添加角色', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25235', '7612', 'STAFF2DEPT', '组织添加用户', '组织添加用户', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25236', '7612', 'AUTH2STAFF', '组织成员授权', '组织成员授权', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25237', '7613', 'QUERY', '查询', '查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25238', '7613', 'ADD', '创建', '创建用户', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25239', '7613', 'UPDATE', '修改', '更新用户', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25240', '7613', 'DELETE', '删除', '删除用户', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25241', '7613', 'LOCKSTAFF', '锁定', '查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25242', '7613', 'RESETPWD', '重置密码', '重置密码', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25243', '7613', 'AUTHSTAFF', '授权', '用户授权', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25244', '7614', 'QUERY', '查询', '查询', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25245', '7614', 'ADD', '新增角色', '新增角色', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25246', '7614', 'MODIFY', '修改角色', '修改角色', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25247', '7614', 'DELETE', '删除角色', '删除角色', null, null, 'auth', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('25248', '7614', 'AUTHROLE', '角色关联权限', '角色关联权限', null, null, 'auth', 'admin', '100');

-- ----------------------------
-- Table structure for sec_operation_address
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
) ENGINE=InnoDB AUTO_INCREMENT=72412 DEFAULT CHARSET=utf8 COMMENT='资源操作地址';

-- ----------------------------
-- Records of sec_operation_address
-- ----------------------------
INSERT INTO `sec_operation_address` VALUES ('71956', '7567', 'get', '流量下发监控', '/pages/activityOverview.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71957', '7567', 'get', '看板内容', '/businessBoard/initReportForm.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71958', '7567', 'get', 'top5数据', '/businessBoard/initData.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71959', '7568', 'query', '合作伙伴列表', '/pages/partnerInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71960', '7568', 'query', '查询请求', '/partnerInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71961', '7568', 'detail', '合作伙伴列表', '/pages/partnerInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71962', '7568', 'detail', '查询请求', '/partnerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71963', '7568', 'detail', '初始化账户信息', '/partnerInfo/initBalance.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71964', '7568', 'detail', '初始化产品协议订单历史记录', '/orderDealRecord/getOrderDealRecord.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71965', '7568', 'detail', '下载', '/orderDealRecord/download.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71966', '7568', 'add', '页面', '/pages/partnerInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71967', '7568', 'add', '新增请求', '/partnerInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71968', '7568', 'add', '获取详情请求', '/partnerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71969', '7568', 'add', '查询帐户请求', '/partnerInfo/queryStaff.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71970', '7568', 'add', '查询产品信息', '/flowProductInfo/getByProductType.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71971', '7568', 'add', '账号唯一判断', '/partnerInfo/soloAccount.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71972', '7568', 'add', '删除产品关联', '/partnerInfo/deleteBySeqId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71973', '7568', 'changestatus', '修改状态请求', '/partnerInfo/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71974', '7568', 'resetPassword', '重置密码', '/partnerInfo/resetPassword.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71975', '7568', 'delete', '删除', '/partnerInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71976', '7568', 'self', '信息展示页面', '/pages/partnerInfo_self_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71977', '7568', 'self', '获取个人信息', '/partnerInfo/getSelf.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71978', '7568', 'self', '初始化账户信息', '/partnerInfo/initBalance.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71979', '7568', 'self', '初始化产品协议订单历史记录', '/orderDealRecord/getOrderDealRecord.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71980', '7568', 'self', '下载', '/orderDealRecord/download.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71981', '7569', 'order_manager_query', '订单列表', '/pages/orderInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71982', '7569', 'order_manager_query', '获取数据', '/orderInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71983', '7569', 'order_manager_query', '详情页面', '/pages/orderInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71984', '7569', 'order_manager_query', '详情获取', '/orderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71985', '7569', 'order_manager_query', '取出订单总数', '/orderInfo/getOrderNumber.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71986', '7569', 'order_manager_query', '取出产品信息', '/flowProductInfo/flowProductInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71987', '7569', 'order_manager_query', '产品详情', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71988', '7569', 'order_manager_query', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71989', '7569', 'order_manager_query', '客户详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71990', '7569', 'detail', '详情页面', '/pages/orderInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71991', '7569', 'detail', '详情获取', '/orderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71992', '7569', 'detail', '订单详情初始化', '/orderInfo/orderInfoViewInit.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71993', '7569', 'detail', '初始化客户订单历史记录', '/orderDealRecord/getOrderDealRecord.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71994', '7569', 'detail', '下载', '/orderDealRecord/download.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71995', '7569', 'delete', '删除', '/orderInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71996', '7569', 'add', '添加页面', '/pages/orderInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71997', '7569', 'add', '详情页面', '/pages/orderInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71998', '7569', 'add', '详情获取', '/orderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('71999', '7569', 'add', '添加或更新数据', '/orderInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72000', '7569', 'add', '获取客户信息', '/orderInfo/selectByPartnerId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72001', '7569', 'add', '取出产品信息', '/flowProductInfo/flowProductInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72002', '7569', 'add', '产品详情', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72003', '7569', 'add', '订单详情初始化', '/orderInfo/orderInfoViewInit.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72004', '7569', 'add', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72005', '7569', 'add', '校验当前客户是否允许下发计费', '/orderInfo/checkAllowBillIssued.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72006', '7569', 'add', '客户详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72007', '7569', 'modify', '添加页面', '/pages/orderInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72008', '7569', 'modify', '详情页面', '/pages/orderInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72009', '7569', 'modify', '详情获取', '/orderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72010', '7569', 'modify', '添加或更新数据', '/orderInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72011', '7569', 'modify', '获取客户信息', '/orderInfo/selectByPartnerId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72012', '7569', 'modify', '取出产品信息', '/flowProductInfo/flowProductInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72013', '7569', 'modify', '产品详情', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72014', '7569', 'modify', '订单详情初始化', '/orderInfo/orderInfoViewInit.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72015', '7569', 'modify', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72016', '7569', 'modify', '校验当前客户是否允许下发计费', '/orderInfo/checkAllowBillIssued.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72017', '7569', 'modify', '客户详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72018', '7569', 'export', '导出', '/orderInfo/downLoadOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72019', '7569', 'changestatus', '改变订单状态', '/orderInfo/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72020', '7569', 'pricesetting', '价格设置', '/pages/productPriceSetting.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72021', '7569', 'pricesetting', '获取详情价格信息', '/orderInfo/selectDirectChargeProdOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72022', '7569', 'pricesetting', '修改详情价格信息', '/orderInfo/updateODByProdId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72023', '7569', 'pricesetting', '批量修改详情价格信息', '/orderInfo/updateODPriceAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72024', '7570', 'query', '直销终端客户列表', '/pages/customerInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72025', '7570', 'query', '获取数据', '/customerInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72026', '7570', 'query', '添加页面', '/pages/customerInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72027', '7570', 'query', '详情页面', '/pages/customerInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72028', '7570', 'query', '详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72029', '7570', 'add', '添加页面', '/pages/customerInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72030', '7570', 'add', '添加或更新数据', '/customerInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72031', '7570', 'add', '账号检测', '/customerInfo/soloAccount.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72032', '7570', 'add', '手机号检测', '/customerInfo/soloMobile.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72033', '7570', 'add', '详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72034', '7570', 'add', '获取合作伙伴', '/customerInfo/queryPartnerInfoAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72035', '7570', 'delete', '删除', '/customerInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72036', '7570', 'changestatus', '改变客户状态', '/customerInfo/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72037', '7570', 'detail', '详情页面', '/pages/customerInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72038', '7570', 'detail', '详情获取', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72039', '7570', 'detail', '初始化账户信息', '/customerInfo/initBalance.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72040', '7570', 'detail', '获取当前客户的订单', '/orderInfo/queryByCustomerId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72041', '7571', 'query', '直销终端客户列表', '/pages/card/wxAccessConf_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72042', '7571', 'query', '获取数据', '/wxAccessConf/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72043', '7571', 'query', '添加页面', '/pages/card/wxAccessConf_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72044', '7571', 'query', '详情页面', '/pages/card/wxAccessConf_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72045', '7571', 'query', '详情获取', '/wxAccessConf/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72046', '7571', 'query', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72047', '7571', 'add', '添加页面', '/pages/card/wxAccessConf_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72048', '7571', 'add', '添加或更新数据', '/wxAccessConf/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72049', '7571', 'add', '详情获取', '/wxAccessConf/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72050', '7571', 'add', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72051', '7571', 'delete', '删除', '/wxAccessConf/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72052', '7571', 'detail', '详情页面', '/pages/card/wxAccessConf_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72053', '7571', 'detail', '详情获取', '/wxAccessConf/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72054', '7572', 'auth_record_manager_xf_query', '兑换记录列表', '/pages/marketingIssued_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72055', '7572', 'auth_record_manager_xf_query', '查询', '/flowExchangeLog/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72056', '7572', 'auth_record_manager_xf_query', '初始化', '/flowExchangeLog/init.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72057', '7572', 'auth_record_manager_xf_query', '查询客户', '/orderInfo/selectByPartnerId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72058', '7572', 'auth_record_manager_xf_query', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72059', '7573', 'auth_record_manager_zc_query', '直充记录列表', '/pages/directCharge_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72060', '7573', 'auth_record_manager_zc_query', '查询', '/flowExchangeLog/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72061', '7573', 'auth_record_manager_zc_query', '初始化', '/flowExchangeLog/init.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72062', '7573', 'auth_record_manager_zc_query', '初始化下发总数和总价', '/flowExchangeLog/initCountAndPriceTotal.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72063', '7574', 'query', '列表', '/pages/flowOrderInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72064', '7574', 'query', '列表查询', '/flowOrderInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72065', '7574', 'query', '详情', '/pages/flowOrderInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72066', '7574', 'query', '详情查询', '/flowOrderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72067', '7574', 'query', '查询客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72068', '7574', 'query', '查询合作伙伴信息', '/orderInfo/selectPartnerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72069', '7574', 'query', '查询客户App接入信息', '/flowAppInfo/selectInfoByIdOrName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72070', '7574', 'export', '导出', '/flowOrderInfo/export.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72071', '7575', 'query', '列表', '/pages/flowOrderInfoFinance_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72072', '7575', 'query', '列表查询', '/flowOrderInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72073', '7575', 'query', '详情', '/pages/flowOrderInfoFinance_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72074', '7575', 'query', '详情查询', '/flowOrderInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72075', '7575', 'query', '查询客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72076', '7575', 'query', '查询合作伙伴信息', '/orderInfo/selectPartnerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72077', '7575', 'query', '查询客户App接入信息', '/flowAppInfo/selectInfoByIdOrName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72078', '7575', 'export', '导出', '/flowOrderInfo/export.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72079', '7576', 'query', '直充记录列表', '/pages/mobileFlowDispatchRec_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72080', '7576', 'query', '查询', '/mobileFlowDispatchRec/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72081', '7576', 'query', '详情', '/pages/mobileFlowDispatchRec_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72082', '7576', 'query', '详情查询', '/mobileFlowDispatchRec/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72083', '7576', 'query', '查询客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72084', '7576', 'excel', '导出', '/mobileFlowDispatchRec/excel.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72085', '7577', 'query', '订单处理记录列表', '/pages/orderDealRecord_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72086', '7577', 'query', '查询', '/orderDealRecord/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72087', '7577', 'query', '详情', '/pages/orderDealRecord_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72088', '7577', 'query', '详情查询', '/orderDealRecord/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72089', '7577', 'delete', '删除', '/orderDealRecord/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72090', '7577', 'download', '下载', '/orderDealRecord/download.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72091', '7578', 'query', '产品设置列表', '/pages/flowProductInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72092', '7578', 'query', '获取数据', '/flowProductInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72093', '7578', 'add', '添加页面', '/pages/flowProductInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72094', '7578', 'add', '详情获取', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72095', '7578', 'add', '流量包获取', '/flowProductInfo/operatorCode.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72096', '7578', 'add', '添加或更新数据', '/flowProductInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72097', '7578', 'add', '判断产品名称唯一', '/flowProductInfo/soloProductName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72098', '7578', 'add', '判断产品代码唯一', '/flowProductInfo/soloProductCode.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72099', '7578', 'add', '判断产品流量包加区域', '/flowProductInfo/soloProductPackageIdZone.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72100', '7578', 'delete', '删除', '/flowProductInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72101', '7578', 'detail', '详情页面', '/pages/flowProductInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72102', '7578', 'detail', '详情获取', '/flowProductInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72103', '7579', 'query', '流量包设置列表', '/pages/flowPackageInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72104', '7579', 'query', '获取数据', '/flowPackageInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72105', '7579', 'query', '获取地区信息', '/customerInfo/selectAreaCodeAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72106', '7579', 'add', '操作码查询', '/flowPackageInfo/operatorCode.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72107', '7579', 'add', '添加页面', '/pages/flowPackageInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72108', '7579', 'add', '添加或更新数据', '/flowPackageInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72109', '7579', 'add', '获取地区信息', '/customerInfo/selectAreaCodeAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72110', '7579', 'delete', '删除', '/flowPackageInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72111', '7579', 'detail', '详情页面', '/pages/flowPackageInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72112', '7579', 'detail', '详情获取', '/flowPackageInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72113', '7580', 'query', '批次列表', '/pages/flowCardBatchInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72114', '7580', 'query', '获取卡片', '/flowCardBatchInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72115', '7580', 'query', '获取所有客户', '/customerInfo/finaCustomerAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72116', '7580', 'query', '获取地区信息', '/customerInfo/selectAreaCodeAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72117', '7580', 'query', '获取所有客户', '/flowCardInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72118', '7580', 'add', '创建卡页面', '/pages/createCard.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72119', '7580', 'add', '创建卡操作', '/flowCardInfo/createFlowCards.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72120', '7580', 'add', '获取订单', '/flowCardInfo/getPlusOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72121', '7580', 'add', '获取订单详情', '/flowCardInfo/getOrderDetail.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72122', '7580', 'add', '获取客户详情', '/flowCardInfo/getCustomerByType.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72123', '7580', 'add', '获取激活卡信息', '/flowCardInfo/getCustomerCExchangeurlInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72124', '7580', 'add', '获取所有客户', '/flowCardInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72125', '7580', 'detail', '批次详情页面', '/pages/batchCardInfo.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72126', '7580', 'detail', '批次详情请求', '/flowCardBatchInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72127', '7580', 'detail', '订单详情获取', '/flowCardBatchInfo/getBydetailId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72128', '7580', 'detail', '客户兑换页面更新', '/flowCardBatchInfo/updatecExchangeurlInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72129', '7580', 'detail', 'c卡预览页', '/pages/c_page/indexC.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72130', '7580', 'detail', '获取订单', '/flowCardInfo/getPlusOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72131', '7580', 'detail', '获取订单详情', '/flowCardInfo/getOrderDetail.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72132', '7580', 'detail', '获取客户详情', '/flowCardInfo/getCustomerByType.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72133', '7580', 'detail', '获取激活卡信息', '/flowCardInfo/getCustomerCExchangeurlInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72134', '7580', 'updateCustomerExChange', '客户兑换页面更新', '/flowCardBatchInfo/updatecExchangeurlInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72135', '7580', 'invalid', '作废全部', '/flowCardInfo/updateCauseAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72136', '7580', 'active', '激活卡页面', '/pages/activeCard.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72137', '7580', 'active', '激活卡操作', '/flowCardInfo/createFlowCards.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72138', '7580', 'active', '更新激活卡信息', '/flowCardInfo/updateCustomerInfoActiveCard.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72139', '7580', 'active', '获取激活卡信息', '/flowCardInfo/getCustomerFlowFlowCardBatchInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72140', '7580', 'export', '导出批量', '/flowCardInfo/excelByBatchId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72141', '7581', 'query', '卡片列表', '/pages/flowCardInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72142', '7581', 'query', '获取卡片', '/flowCardInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72143', '7581', 'query', '详情页面', '/pages/flowCardInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72144', '7581', 'query', '详情获取', '/flowCardInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72145', '7581', 'query', '获取所有客户', '/customerInfo/finaCustomerAll.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72146', '7581', 'query', '获取所有客户', '/flowCardInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72147', '7581', 'invalid', '作废', '/flowCardInfo/updateCause.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72148', '7581', 'export', '导出', '/flowCardInfo/excel.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72149', '7582', 'query', '列表页面', '/pages/smsChannelInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72150', '7582', 'query', '列表请求', '/smsChannelInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72151', '7582', 'query', '详情页面', '/pages/smsChannelInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72152', '7582', 'query', '详情获取', '/smsChannelInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72153', '7582', 'add', '新增页面', '/pages/smsChannelInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72154', '7582', 'add', '新增请求', '/smsChannelInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72155', '7582', 'add', '详情获取', '/smsChannelInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72156', '7582', 'del', '删除', '/smsChannelInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72157', '7583', 'query', '列表页面', '/pages/flowAppInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72158', '7583', 'query', '列表请求', '/flowAppInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72159', '7583', 'query', '详情页面', '/pages/flowAppInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72160', '7583', 'query', '详情获取', '/flowAppInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72161', '7583', 'add', '新增页面', '/pages/flowAppInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72162', '7583', 'add', '新增请求', '/flowAppInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72163', '7583', 'add', '详情获取', '/flowAppInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72164', '7583', 'add', '订单信息获取', '/orderInfo/queryOrderInfoByCustomer.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72165', '7583', 'add', '短信通道获取', '/smsChannelInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72166', '7583', 'add', '流量下发通道获取', '/flowAppInfo/getDispatchChannel.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72167', '7583', 'del', '删除', '/flowAppInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72168', '7583', 'export', '导出', '/flowAppInfo/excel.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72169', '7583', 'changestatus', '修改接入状态', '/flowAppInfo/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72170', '7584', 'query', '列表页面', '/pages/versionUpgradeInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72171', '7584', 'query', '列表请求', '/versionUpgradeInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72172', '7584', 'query', '详情页面', '/pages/versionUpgradeInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72173', '7584', 'query', '详情获取', '/versionUpgradeInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72174', '7584', 'add', '新增页面', '/pages/versionUpgradeInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72175', '7584', 'add', '新增请求', '/versionUpgradeInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72176', '7584', 'add', '详情获取', '/versionUpgradeInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72177', '7584', 'del', '删除', '/versionUpgradeInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72178', '7585', 'query', '列表页面', '/pages/act/campaignInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72179', '7585', 'query', '列表请求', '/campaignInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72180', '7585', 'detail', '详情页面', '/pages/act/campaignInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72181', '7585', 'detail', '详情获取', '/campaignInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72182', '7585', 'add', '新增页面', '/pages/act/campaignInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72183', '7585', 'add', '新增请求', '/campaignInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72184', '7585', 'add', '详情获取', '/campaignInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72185', '7585', 'add', '订单获取', '/campaignInfo/getOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72186', '7585', 'add', 'app获取', '/campaignInfo/getFlowAppInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72187', '7585', 'add', '客户获取', '/campaignInfo/getCustomerByType.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72188', '7585', 'add', '详情获取', '/campaignInfo/getOrderDetail.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72189', '7585', 'add', '活动id唯一', '/campaignInfo/soloActId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72190', '7585', 'add', '删除奖品', '/campaignInfo/deleteBySeqId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72191', '7585', 'del', '删除', '/campaignInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72192', '7585', 'changeStatus', '修改状态', '/campaignInfo/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72193', '7586', 'query', '列表页面', '/pages/act/campaignRewardInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72194', '7586', 'query', '列表请求', '/campaignRewardInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72195', '7586', 'detail', '详情页面', '/pages/act/campaignRewardInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72196', '7586', 'detail', '详情获取', '/campaignRewardInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72197', '7586', 'export', '导出', '/campaignRewardInfo/downLoadCampaignRewardInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72198', '7587', 'query', '列表页面', '/pages/act/campaignDrawDetail_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72199', '7587', 'query', '列表请求', '/campaignDrawDetail/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72200', '7587', 'query', '查询抽奖人数', '/campaignDrawDetail/initPrizeNumberCount.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72201', '7587', 'detail', '详情页面', '/pages/act/campaignDrawDetail_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72202', '7587', 'detail', '详情获取', '/campaignDrawDetail/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72203', '7587', 'excel', '详情获取', '/campaignDrawDetail/excel.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72204', '7588', 'query', '合作伙伴账单列表', '/pages/partnerBill_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72205', '7588', 'query', '查询请求', '/partnerInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72206', '7588', 'detail', '合作伙伴列表', '/pages/partnerInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72207', '7588', 'detail', '查询请求', '/partnerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72208', '7588', 'detail', '重置密码', '/partnerInfo/resetPassword.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72209', '7588', 'accountDetail', '账户明细页面', '/pages/partnerAccountDetail_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72210', '7588', 'accountDetail', '查询请求', '/partnerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72211', '7588', 'accountDetail', '交易流水查询', '/partnerTradeFlow/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72212', '7588', 'accountChange', '账户充值和信用额度调整', '/partnerTradeFlow/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72213', '7589', 'query', '账单查询列表', '/pages/partnerBillQuery_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72214', '7589', 'query', '账单查询', '/customerBalanceDay/queryPartner.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72215', '7589', 'query', '查询所有合作伙伴', '/customerBalanceDay/selectPartnerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72216', '7589', 'query', '查询下发数和下发金额', '/customerBalanceDay/initPartnerCountAndPriceTotal.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72217', '7589', 'export', '导出', '/customerBalanceDay/downLoadPartnerBill.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72218', '7590', 'query', '结算单查询列表', '/pages/partnerSettlementOrder_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72219', '7590', 'query', '结算单查询', '/partnerBalanceMonth/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72220', '7590', 'query', '查询所有合作伙伴', '/customerBalanceDay/selectPartnerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72221', '7590', 'changeStatus', '调整结算单状态', '/partnerBalanceMonth/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72222', '7590', 'changeAdjustBalance', '调整金额', '/partnerBalanceMonth/changeAdjustBalance.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72223', '7590', 'downLoadSettlementOrder', '导出', '/partnerBalanceMonth/downLoadSettlementOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72224', '7591', 'query', '客户账单列表', '/pages/customerBill_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72225', '7591', 'query', '获取数据', '/customerInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72226', '7591', 'accountDetail', '账户明细页面', '/pages/customerAccountDetail_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72227', '7591', 'accountDetail', '查询请求', '/customerInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72228', '7591', 'accountDetail', '交易流水查询', '/customerTradeFlow/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72229', '7591', 'accountDetail', '初始化累计存款和累计消费', '/customerTradeFlow/init.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72230', '7591', 'accountChange', '账户充值和信用额度调整', '/customerTradeFlow/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72231', '7592', 'query', '账单查询列表', '/pages/customerBillQuery_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72232', '7592', 'query', '账单查询', '/customerBalanceDay/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72233', '7592', 'query', '获取客户信息', '/orderInfo/selectByPartnerId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72234', '7592', 'query', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72235', '7592', 'query', '查询下发数和下发金额', '/customerBalanceDay/initCustomerCountAndPriceTotal.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72236', '7592', 'export', '导出', '/customerBalanceDay/downLoadCustomerBill.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72237', '7593', 'query', '结算单查询列表', '/pages/customerSettlementOrder_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72238', '7593', 'query', '结算单查询', '/customerBalanceMonth/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72239', '7593', 'query', '获取客户信息', '/orderInfo/selectByPartnerId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72240', '7593', 'query', '获取对应客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72241', '7593', 'changeStatus', '调整结算单状态', '/customerBalanceMonth/changeStatus.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72242', '7593', 'changeAdjustBalance', '调整金额', '/customerBalanceMonth/changeAdjustBalance.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72243', '7593', 'downLoadSettlementOrder', '导出', '/customerBalanceMonth/downLoadSettlementOrder.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72244', '7594', 'query', '直销终端客户列表', '/pages/card/greetingInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72245', '7594', 'query', '获取数据', '/greetingInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72246', '7594', 'add', '添加页面', '/pages/card/greetingInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72247', '7594', 'add', '添加或更新数据', '/greetingInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72248', '7594', 'delete', '删除', '/greetingInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72249', '7594', 'detail', '详情页面', '/pages/card/greetingInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72250', '7594', 'detail', '详情获取', '/greetingInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72251', '7595', 'query', '贺卡列表', '/pages/card/greetingCardInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72252', '7595', 'query', '获取数据', '/greetingCardInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72253', '7595', 'query', '获取所有活动', '/greetingCardInfo/getCampaign.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72254', '7595', 'add', '添加页面', '/pages/card/greetingCardInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72255', '7595', 'add', '添加或更新数据', '/greetingCardInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72256', '7595', 'add', '获取所有活动', '/greetingCardInfo/getCampaign.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72257', '7595', 'add', '关联贺卡活动', '/greetingCardAct/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72258', '7595', 'delete', '删除', '/greetingCardInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72259', '7595', 'detail', '详情页面', '/pages/card/greetingCardInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72260', '7595', 'detail', '详情获取', '/greetingCardInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72261', '7596', 'query', '直销终端客户列表', '/pages/card/cardExchangeInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72262', '7596', 'query', '获取数据', '/cardExchangeInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72263', '7596', 'add', '添加页面', '/pages/card/cardExchangeInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72264', '7596', 'add', '添加或更新数据', '/cardExchangeInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72265', '7596', 'delete', '删除', '/cardExchangeInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72266', '7596', 'detail', '详情页面', '/pages/card/cardExchangeInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72267', '7596', 'detail', '详情获取', '/cardExchangeInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72268', '7597', 'query', '直销终端客户列表', '/pages/card/wxPayRecord_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72269', '7597', 'query', '获取数据', '/wxPayRecord/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72270', '7597', 'add', '添加页面', '/pages/card/wxPayRecord_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72271', '7597', 'add', '添加或更新数据', '/wxPayRecord/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72272', '7597', 'delete', '删除', '/wxPayRecord/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72273', '7597', 'detail', '详情页面', '/pages/card/wxPayRecord_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72274', '7597', 'detail', '详情获取', '/wxPayRecord/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72275', '7598', 'query', '直销终端客户列表', '/pages/card/myGreetingCard_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72276', '7598', 'query', '获取数据', '/myGreetingCard/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72277', '7598', 'add', '添加页面', '/pages/card/myGreetingCard_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72278', '7598', 'add', '添加或更新数据', '/myGreetingCard/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72279', '7598', 'delete', '删除', '/myGreetingCard/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72280', '7598', 'detail', '详情页面', '/pages/card/myGreetingCard_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72281', '7598', 'detail', '详情获取', '/myGreetingCard/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72282', '7599', 'query', '直销终端客户列表', '/pages/card/greetingCardAct_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72283', '7599', 'query', '获取数据', '/greetingCardAct/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72284', '7599', 'add', '添加页面', '/pages/card/greetingCardAct_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72285', '7599', 'add', '添加或更新数据', '/greetingCardAct/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72286', '7599', 'add', '查询客户信息', '/orderInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72287', '7599', 'add', '贺卡活动主页', '/pages/card/greetingCardAct_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72288', '7599', 'delete', '删除', '/greetingCardAct/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72289', '7599', 'detail', '详情页面', '/pages/card/greetingCardAct_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72290', '7599', 'detail', '详情获取', '/greetingCardAct/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72291', '7600', 'query', '获取数据', '/codeDict/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72292', '7601', 'query', '营销活动配置', '/pages/greeting_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72293', '7601', 'query', '获取数据', '/greetingCardAct/queryGreetingCardList.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72294', '7601', 'add', '添加页面', '/pages/greeting_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72295', '7601', 'add', '贺卡模板页面', '/pages/greeting_temp/demo.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72296', '7601', 'add', '分享页面', '/pages/greeting_temp/share_info.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72297', '7601', 'add', '查询客户', '/greetingCardAct/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72298', '7601', 'add', '查询订单', '/greetingCardAct/getFlowAppInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72299', '7601', 'add', '添加或更新数据', '/greetingCardAct/addGreeting.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72300', '7601', 'add', '获取详情', '/greetingCardAct/getGreetingCard.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72301', '7602', 'query', '领取信息', '/pages/campaignRewardInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72302', '7602', 'query', '查询领取信息', '/campaignRewardInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72303', '7602', 'query', '领取详情页面', '/pages/act/campaignRewardInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72304', '7602', 'query', '领取详情信息请求', '/campaignRewardInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72305', '7602', 'export', '导出', '/campaignRewardInfo/downLoadGetCampaignRewardInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72306', '7603', 'query', '水果机列表页面', '/pages/actTemplate_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72307', '7603', 'query', '水果机列表请求', '/campaignInfo/actTemplate.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72308', '7603', 'query', '查询客户信息', '/campaignInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72309', '7603', 'add', '水果机新增页面', '/pages/actTemplate_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72310', '7603', 'add', '水果机新增请求', '/campaignInfo/addActTemplate.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72311', '7603', 'add', '水果机新增详情', '/campaignInfo/getActTemplate.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72312', '7603', 'add', '查询客户信息', '/campaignInfo/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72313', '7603', 'add', '查询订单', '/campaignInfo/getCustomerFlowAppInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72314', '7603', 'add', '水果机模板页面', '/pages/act_temp/index.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72315', '7603', 'add', '水果机分享页面', '/pages/act_temp/share_info.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72316', '7603', 'add', '删除奖品信息', '/campaignInfo/deleteGiftList.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72317', '7604', 'query', '签到送流量列表页面', '/pages/signInConf_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72318', '7604', 'query', '签到送流量列表请求', '/signInConf/signInConf.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72319', '7604', 'query', '查询客户信息', '/signInConf/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72320', '7604', 'query', '删除奖品信息', '/signInConf/deleteGiftList.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72321', '7604', 'query', '签到详情页面', '/pages/signInDetail_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72322', '7604', 'query', '查询流水', '/signPointsRecord/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72323', '7604', 'query', '流水导出权限', '/signPointsRecord/downLoadSignIn.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72324', '7604', 'query', '统计签到', '/signPointsRecord/statisticsSignIn.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72325', '7604', 'query', '统计签到导出权限', '/signPointsRecord/statisticsSignInExport.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72326', '7604', 'add', '签到新增页面', '/pages/signInConf_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72327', '7604', 'add', '签到新增请求', '/signInConf/addSignInConf.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72328', '7604', 'add', '签到新增详情', '/signInConf/getSignInConf.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72329', '7604', 'add', '查询客户信息', '/signInConf/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72330', '7604', 'add', '查询订单', '/signInConf/getCustomerFlowAppInfo.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72331', '7604', 'add', '签到模板页面', '/pages/sign_in/index.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72332', '7604', 'add', '签到分享页面', '/pages/sign_in/share_info.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72333', '7605', 'query', '查看页面', '/pages/act/advCategory_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72334', '7605', 'query', '查看请求', '/advCategory/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72335', '7605', 'query', '查询客户信息', '/advCategory/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72336', '7605', 'add', '添加页面', '/pages/act/advCategory_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72337', '7605', 'add', '添加或更新数据', '/advCategory/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72338', '7605', 'add', '详情获取', '/advCategory/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72339', '7605', 'add', '查询客户信息', '/advCategory/selectCustomerInfoByName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72340', '7605', 'add', '唯一ID判断', '/advCategory/soloId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72341', '7605', 'delete', '删除', '/advCategory/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72342', '7605', 'detail', '详情页面', '/pages/act/advCategory_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72343', '7605', 'detail', '详情获取', '/advCategory/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72344', '7606', 'query', '领取信息', '/pages/act/advInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72345', '7606', 'query', '获取数据', '/advInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72346', '7606', 'query', '查询类别id', '/advInfo/selectAdvInfoByCategoryId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72347', '7606', 'add', '添加页面', '/pages/act/advInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72348', '7606', 'add', '添加或更新数据', '/advInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72349', '7606', 'add', '详情获取', '/advInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72350', '7606', 'add', '查询类别id', '/advInfo/selectAdvInfoByCategoryId.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72351', '7606', 'delete', '删除', '/advInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72352', '7606', 'detail', '详情页面', '/pages/act/advInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72353', '7606', 'detail', '详情获取', '/advInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72354', '7607', 'EXCLUDE', '上传组件action', '/attachment/add.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('72355', '7607', 'EXCLUDE', '上传组件action', '/attachment/list.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('72356', '7607', 'EXCLUDE', '上传组件action', '/attachment/withdraw.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('72357', '7607', 'EXCLUDE', '上传组件列表action', '/attachment/download.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('72358', '7607', 'EXCLUDE', '上传组件回退action', '/attachment/downloadMulti.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('72359', '7607', 'EXCLUDE', '上传组件类型浏览action', '/attachment/view.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('72360', '7608', 'EXCLUDE', '上传组件列表action', '/codeDict/query.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('72361', '7609', 'QUERY', '个人管理页面', '/pages/auth/individual/modifyInfo.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72362', '7609', 'QUERY', '查询个人资料', '/staff/findLoginStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72363', '7609', 'QUERY', '修改个人资料', '/staff/updateStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72364', '7609', 'QUERY', '查询个人扩展属性', '/staff/findStaffExtendProperties.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72365', '7610', 'QUERY', '修改个人密码页面', '/pages/auth/individual/modifyPwd.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72366', '7610', 'QUERY', '修改个人密码', '/staff/changePwd.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72367', '7611', 'QUERY', '个性化参数修改页面', '/pages/auth/individual/selfConfigSetting.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72368', '7611', 'QUERY', '个性化参数查询', '/pendTaskSetting/get.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72369', '7611', 'QUERY', '个性化参数设置', '/pendTaskSetting/update.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72370', '7612', 'QUERY', '组织管理页面', '/pages/auth/dept.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72371', '7612', 'QUERY', '组织树查询', '/department/listDepartmentTree.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72372', '7612', 'QUERY', '组织查询', '/department/findDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72373', '7612', 'QUERY', '组织详情查询', '/department/findDepartmentInfo.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72374', '7612', 'QUERY', '更新组织', '/department/updateDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72375', '7612', 'QUERY', '删除组织', '/department/delDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72376', '7612', 'MODIFY', '更新组织', '/department/updateDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72377', '7612', 'DELETE', '删除组织', '/department/delDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72378', '7612', 'ROLE2DEPT', '添加组织角色', '/department/updateDepartmentRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72379', '7612', 'ROLE2DEPT', '查询组织角色列表', '/department/listDepartmentRoles.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72380', '7612', 'STAFF2DEPT', '查询组织用户列表', '/staff/listStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72381', '7612', 'STAFF2DEPT', '添加组织用户', '/staff/updateStaffDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72382', '7612', 'AUTH2STAFF', '查询角色关联下用户列表', '/staff/listRoleByStaffIds.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72383', '7612', 'AUTH2STAFF', '组织里用户权限修改', '/staff/updateStaffRolesDepartment.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72384', '7613', 'QUERY', '成员管理页面', '/pages/auth/staff.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72385', '7613', 'QUERY', '查询请求', '/staff/listStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72386', '7613', 'ADD', '查询用户是否存在', '/staff/checkStaffLoginName.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72387', '7613', 'ADD', '查询用户是否存在', '/staff/checkStaffMobile.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72388', '7613', 'ADD', '查询用户是否存在', '/staff/checkStaffEmail.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72389', '7613', 'ADD', '创建请求', '/staff/createStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72390', '7613', 'ADD', '查询个人扩展属性', '/staff/findStaffExtendProperties.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72391', '7613', 'UPDATE', '查询用户是否存在', '/staff/checkStaffLoginName.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72392', '7613', 'UPDATE', '获取用户详情', '/staff/findStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72393', '7613', 'UPDATE', '更新', '/staff/updateStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72394', '7613', 'UPDATE', '查询个人扩展属性', '/staff/findStaffExtendProperties.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72395', '7613', 'DELETE', '删除请求', '/staff/deleteStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72396', '7613', 'LOCKSTAFF', '锁定请求', '/staff/lockStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72397', '7613', 'RESETPWD', '重置密码请求', '/staff/resetPwd.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72398', '7613', 'AUTHSTAFF', '获取用户详情', '/staff/findStaff.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72399', '7613', 'AUTHSTAFF', '查询用户角色列表', '/staff/listStaffRoles.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72400', '7613', 'AUTHSTAFF', '更新用户角色', '/staff/updateStaffRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72401', '7614', 'QUERY', '浏览角色页面', '/pages/auth/role.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72402', '7614', 'QUERY', '查看', '/role/listRoles.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72403', '7614', 'ADD', '查询角色助记码是否存在', '/role/checkRoleKey.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72404', '7614', 'ADD', '添加', '/role/updateRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72405', '7614', 'MODIFY', '查询角色助记码是否存在', '/role/checkRoleKey.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72406', '7614', 'MODIFY', '查询角色详情', '/role/findRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72407', '7614', 'MODIFY', '修改', '/role/updateRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72408', '7614', 'DELETE', '删除角色', '/role/deleteRole.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72409', '7614', 'AUTHROLE', '浏览角色页面', '/pages/auth/roleSetting.shtml', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72410', '7614', 'AUTHROLE', '权限列表', '/role/listRoleResource.ajax', null, null, null, null, null, null, 'auth', 'admin');
INSERT INTO `sec_operation_address` VALUES ('72411', '7614', 'AUTHROLE', '关联角色权限', '/role/updateRoleResource.ajax', null, null, null, null, null, null, 'auth', 'admin');

-- ----------------------------
-- Table structure for sec_resources
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
) ENGINE=InnoDB AUTO_INCREMENT=7615 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of sec_resources
-- ----------------------------
INSERT INTO `sec_resources` VALUES ('7567', 'auth_partner_manager_activityOverview', '流量下发监控', '合作伙伴列表', '3464', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7568', 'auth_partner_manager_list', '合作伙伴列表', '合作伙伴列表', '3464', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7569', 'auth_order_manager_list', '订单列表', '订单列表', '3465', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7570', 'auth_customer_manager_zc', '客户管理', '客户管理', '3466', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7571', 'auth_customer_wxAccessConf', '客户微信配置管理', '客户微信配置管理', '3466', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7572', 'auth_record_manager_xf', '兑换记录查询', '兑换记录查询', '3467', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7573', 'auth_record_manager_zc', '直充记录查询', '直充记录查询', '3467', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7574', 'auth_flow_orderinfo_list', '流量分发记录', '流量分发记录', '3467', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7575', 'auth_flow_orderinfofinance_list', '流量分发记录(财务)', '流量分发记录(财务)', '3467', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7576', 'auth_mobile_flow_dispatch_rec', '流量网关日志查询', '流量网关日志查询', '3467', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7577', 'auth_order_deal_record', '订单处理记录查询', '订单处理记录查询', '3467', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7578', 'auth_prodcut_manager_cp', '产品设置', '产品设置', '3468', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7579', 'auth_prodcut_manager_llb', '流量包设置', '流量包设置', '3468', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7580', 'auth_card_manager_gl', '卡片管理', '卡片管理', '3469', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7581', 'auth_card_manager_cx', '卡片查询', '卡片查询', '3469', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7582', 'auth_sms_access', '短信接入', '短信接入', '3470', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7583', 'auth_app_access', 'APP接入', 'APP接入', '3470', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7584', 'auth_app_upgrade', 'APP版本管理', 'APP版本管理', '3470', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7585', 'auth_campaign_info', '营销活动', '营销活动', '3471', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7586', 'campaign_info_reward', '中奖记录查询', '中奖记录查询', '3471', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7587', 'campaign_info_draw', '抽奖记录查询', '抽奖记录查询', '3471', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7588', 'auth_partner_bill', '账单管理', '账单管理', '3472', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7589', 'auth_partner_bill_query', '账单查询', '账单查询', '3472', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7590', 'auth_partner_settlement_order_manager', '结算单管理', '结算单管理', '3472', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7591', 'auth_customer_bill', '账单管理', '账单管理', '3473', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7592', 'auth_customer_bill_query', '账单查询', '账单查询', '3473', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7593', 'auth_customer_settlement_order_manager', '结算单管理', '结算单管理', '3473', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7594', 'auth_greeting_info', '祝福语', '祝福语', '3474', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7595', 'greeting_card_info_manage', '贺卡', '贺卡', '3474', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7596', 'card_exchange_info', '贺卡兑换记录', '贺卡兑换记录', '3474', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7597', 'wxPayRecord_manage', '微信支付记录', '微信支付记录', '3474', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7598', 'my_greeting_card', '我的贺卡', '我的贺卡', '3474', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7599', 'greeting_card_act', '贺卡活动', '贺卡活动', '3474', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7600', 'auth_data_dictionary_list', '账单管理', '账单管理', '3475', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7601', 'auth_data_greeting_card_list', '营销活动配置', '营销活动配置', '3476', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7602', 'auth_data_campaign_reward_info_list', '领取信息', '领取信息', '3476', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7603', 'auth_data_flow_act_temp', '水果机游戏模板', '水果机游戏模板', '3476', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7604', 'sig_in_conf', '签到送流量', '签到送流量', '3476', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7605', 'auth_data_adv_category', '广告位类别', '广告位类别', '3477', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7606', 'auth_data_adv_info', '广告位信息', '广告位信息', '3477', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7607', 'exclude_eump_admin_session', 'session例外资源', 'session例外资源', '3479', 'AUTH', 'exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_resources` VALUES ('7608', 'exclude_admin_perm', '鉴权例外资源', '鉴权例外资源', '3479', 'AUTH', 'exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_resources` VALUES ('7609', 'auth_admin_sys_individual_modifyInfo', '修改帐号信息', '修改帐号信息', '3481', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7610', 'auth_admin_sys_individual_modifyPwd', '修改个人密码', '修改个人密码', '3481', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7611', 'auth_admin_sys_individual_selfconfig', '个性化参数设置', '个性化参数设置', '3481', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7612', 'auth_admin_sys_dept_deptManage', '组织管理', '组织管理', '3482', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7613', 'auth_admin_sys_staff_staffManage', '成员管理', '成员管理', '3483', 'AUTH', 'auth', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('7614', 'auth_admin_sys_role_roleManage', '角色管理', '角色管理', '3484', 'AUTH', 'auth', 'admin', '100');

-- ----------------------------
-- Table structure for sec_resource_category
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
) ENGINE=InnoDB AUTO_INCREMENT=3485 DEFAULT CHARSET=utf8 COMMENT='资源分类';

-- ----------------------------
-- Records of sec_resource_category
-- ----------------------------
INSERT INTO `sec_resource_category` VALUES ('3463', null, '流量营销管理平台', '流量营销管理平台', 'fmp-admin', 'manager', 'admin', '2000');
INSERT INTO `sec_resource_category` VALUES ('3464', '3463', '合作伙伴管理', '合作伙伴管理', 'fmp-admin', 'auth_partner_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3465', '3463', '订单管理', '订单管理', 'fmp-admin', 'auth_order_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3466', '3463', '客户管理', '客户管理', 'fmp-admin', 'auth_customer_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3467', '3463', '记录查询', '记录查询', 'fmp-admin', 'auth_record_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3468', '3463', '产品管理', '产品管理', 'fmp-admin', 'auth_prodcut_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3469', '3463', '卡片管理', '产品管理', 'fmp-admin', 'auth_card_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3470', '3463', '接入管理', '接入管理', 'fmp-admin', 'auth_access_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3471', '3463', '营销活动管理', '营销活动管理', 'fmp-admin', 'auth_campaign_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3472', '3463', '合作伙伴账单管理', '合作伙伴账单管理', 'fmp-admin', 'auth_partner_bill_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3473', '3463', '客户账单管理', '客户账单管理', 'fmp-admin', 'auth_customer_bill_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3474', '3463', '贺卡管理', '贺卡管理', 'fmp-admin', 'auth_greeting_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3475', '3463', '数据字典', '客户账单管理', 'fmp-admin', 'auth_data_dictionary', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3476', '3463', '流量营销活动', '流量营销活动', 'fmp-admin', 'auth_data_greeting_card', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3477', '3463', '广告位', '流量贺卡', 'fmp-admin', 'auth_data_adv', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3478', null, 'admin端例外资源', 'admin端例外资源', 'exclude_eump_admin', 'exclude_eump_admin', 'cspm-mgmt', '1000');
INSERT INTO `sec_resource_category` VALUES ('3479', '3478', '例外资源', '例外资源', 'exclude_eump_admin', 'auth_exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_resource_category` VALUES ('3480', null, '系统管理', '系统管理', 'auth', 'auth_admin', 'admin', '3000');
INSERT INTO `sec_resource_category` VALUES ('3481', '3480', '个人管理', '个人管理', 'auth', 'auth_admin_sys_individual', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3482', '3480', '组织管理', '组织管理', 'auth', 'auth_admin_sys_dept', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3483', '3480', '成员管理', '成员管理', 'auth', 'auth_admin_sys_staff', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('3484', '3480', '角色管理', '角色管理', 'auth', 'auth_admin_sys_role', 'admin', '100');

-- ----------------------------
-- Table structure for sec_role
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
-- Table structure for sec_role_resource_operation
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

-- ----------------------------
-- Table structure for sec_staff
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
  UNIQUE KEY `U_EMAIL` (`EMAIL`),
  KEY `idx_login_name` (`LOGIN_NAME`),
  KEY `FK_sec_staff` (`DEPARTMENT_ID`),
  CONSTRAINT `FK_sec_staff` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `sec_department` (`DEPARTMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='成员';

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
INSERT INTO `sec_staff` VALUES ('17', 'liujia', null, 'liujia', 'GaBWZc9LcVdRv7M8kaOCBg==', 'NORMAL', 'MALE', null, '', 'test@test.com', 'liujia', '2016-02-24 14:06:45', null, null, null, null, null);

-- ----------------------------
-- Table structure for sec_staff_department_role
-- ----------------------------
DROP TABLE IF EXISTS `sec_staff_department_role`;
CREATE TABLE `sec_staff_department_role` (
  `STAFF_ID` bigint(20) NOT NULL COMMENT '成员ID',
  `DEPARTMENT_ID` bigint(16) NOT NULL COMMENT '组织ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成员组织角色关联表';

-- ----------------------------
-- Records of sec_staff_department_role
-- ----------------------------
INSERT INTO `sec_staff_department_role` VALUES ('-999', '-998', '1');
INSERT INTO `sec_staff_department_role` VALUES ('1', '4', '6');
INSERT INTO `sec_staff_department_role` VALUES ('2', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('3', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('4', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('5', '2', '5');
INSERT INTO `sec_staff_department_role` VALUES ('6', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('8', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('7', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('9', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('10', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('11', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('12', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('13', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('14', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('15', '3', '7');
INSERT INTO `sec_staff_department_role` VALUES ('16', '3', '7');

-- ----------------------------
-- Table structure for sec_staff_password
-- ----------------------------
DROP TABLE IF EXISTS `sec_staff_password`;
CREATE TABLE `sec_staff_password` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `staff_id` bigint(20) NOT NULL COMMENT '用户ID',
  `validate_code` varchar(256) DEFAULT NULL COMMENT '验证码---修改密码用',
  `out_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '超时日期---修改密码用',
  PRIMARY KEY (`seq_id`),
  KEY `U_1` (`staff_id`) USING BTREE,
  CONSTRAINT `f_1` FOREIGN KEY (`staff_id`) REFERENCES `sec_staff` (`STAFF_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sec_staff_password
-- ----------------------------

-- ----------------------------
-- Table structure for sec_staff_role
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
