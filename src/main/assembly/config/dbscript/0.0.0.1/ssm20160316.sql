/*
Navicat MySQL Data Transfer

Source Server         : MAC-服务器
Source Server Version : 50173
Source Host           : 114.117.165.144:3306
Source Database       : ssm

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-03-16 21:29:03
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '系统管理', 'auth_sysmgt_admin_sysmgtall', '0', 'menu-icon fa fa-pencil-square-o', null, '900000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('2', '组织管理', 'auth_sysmgt_admin_sysmgtall_dept_deptmsg', '1', 'icon-sitemap', '/pages/auth/dept.shtml', '10000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('3', '成员管理', 'auth_sysmgt_admin_sysmgtall_dept_staffmgt', '1', 'icon-user-md', '/pages/auth/staff.shtml', '20000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('4', '角色管理', 'auth_sysmgt_admin_sysmgtall_dept_rolemgt', '1', 'icon-group', '/pages/auth/role.shtml', '30000', 'auth_sysmgt', 'admin');
INSERT INTO `menu` VALUES ('5', '用户管理', 'user_manager', '0', 'menu-icon fa fa-users', null, '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('6', '用户信息', 'user_manager_userinfo', '5', 'icon-user', '/pages/userInfo_list.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('7', '实验室', 'laboratory', '0', 'menu-icon fa fa-lightbulb-o', null, '2', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('8', '工具箱', 'laboratory_toolbox', '7', 'icon-user', '/pages/toolbox.shtml', '1', 'fmp-admin', 'admin');
INSERT INTO `menu` VALUES ('9', '游戏', 'laboratory_game', '7', 'icon-user', '/pages/game.shtml', '2', 'fmp-admin', 'admin');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='资源操作';

-- ----------------------------
-- Records of sec_operation
-- ----------------------------
INSERT INTO `sec_operation` VALUES ('1', '18', 'query', '列表', '列表', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('2', '18', 'detail', '详情', '详情', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('3', '18', 'add', '新增/修改', '新增/修改', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('4', '18', 'delete', '删除', '删除', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('5', '18', 'download', '下载', '下载', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('6', '19', 'list', '主页面', '主页面', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('7', '19', 'network', '网络工具', '网络工具', null, null, 'fmp-admin', 'admin', '100');
INSERT INTO `sec_operation` VALUES ('8', '20', 'EXCLUDE', '例外', '例外', null, null, 'exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_operation` VALUES ('9', '21', 'EXCLUDE', '后台公用ACTION例外', '后台公用ACTION登录后就可访问', null, null, 'exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_operation` VALUES ('10', '22', 'QUERY', '组织查询', '组织查询', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('11', '22', 'MODIFY', '组织修改', '组织修改', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('12', '22', 'DELETE', '组织删除', '组织删除', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('13', '22', 'ROLE2DEPT', '组织添加角色', '组织添加角色', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('14', '22', 'STAFF2DEPT', '组织添加用户', '组织添加用户', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('15', '22', 'AUTH2STAFF', '组织成员授权', '组织成员授权', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('16', '23', 'QUERY', '查询', '查询', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('17', '23', 'ADD', '创建', '创建用户', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('18', '23', 'UPDATE', '修改', '更新用户', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('19', '23', 'DELETE', '删除', '删除用户', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('20', '23', 'LOCKSTAFF', '锁定', '查询', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('21', '23', 'RESETPWD', '重置密码', '重置密码', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('22', '23', 'AUTHSTAFF', '授权', '用户授权', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('23', '24', 'QUERY', '查询', '查询', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('24', '24', 'ADD', '新增角色', '新增角色', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('25', '24', 'MODIFY', '修改角色', '修改角色', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('26', '24', 'DELETE', '删除角色', '删除角色', null, null, 'auth', 'auth_admin', '100');
INSERT INTO `sec_operation` VALUES ('27', '24', 'AUTHROLE', '角色关联权限', '角色关联权限', null, null, 'auth', 'auth_admin', '100');

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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='资源操作地址';

-- ----------------------------
-- Records of sec_operation_address
-- ----------------------------
INSERT INTO `sec_operation_address` VALUES ('1', '18', 'query', '用户信息列表', '/pages/userInfo_list.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('2', '18', 'query', '查询请求', '/userInfo/query.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('3', '18', 'query', '获取当前登录用户', '/userInfo/getCurrentStaff.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('4', '18', 'query', '根据名称查询用户', '/userInfo/selectStaffByLoginName.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('5', '18', 'detail', '用户信息详情', '/pages/userInfo_view.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('6', '18', 'detail', '查询请求', '/userInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('7', '18', 'add', '页面', '/pages/userInfo_add.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('8', '18', 'add', '新增请求', '/userInfo/add.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('9', '18', 'add', '获取详情请求', '/userInfo/get.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('10', '18', 'delete', '删除', '/userInfo/delete.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('11', '18', 'download', '下载', '/userInfo/download.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('12', '19', 'list', '工具箱页面', '/pages/toolbox.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('13', '19', 'network', '网络工具页面', '/pages/toolbox.shtml', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('14', '19', 'network', '页面初始化', '/laboratory/network/init.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('15', '19', 'network', 'ip地址查询', '/laboratory/network/checkIp.ajax', null, null, null, null, null, null, 'fmp-admin', 'admin');
INSERT INTO `sec_operation_address` VALUES ('16', '20', 'EXCLUDE', '上传组件action', '/attachment/add.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('17', '20', 'EXCLUDE', '上传组件action', '/attachment/list.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('18', '20', 'EXCLUDE', '上传组件action', '/attachment/withdraw.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('19', '20', 'EXCLUDE', '上传组件列表action', '/attachment/download.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('20', '20', 'EXCLUDE', '上传组件回退action', '/attachment/downloadMulti.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('21', '20', 'EXCLUDE', '上传组件类型浏览action', '/attachment/view.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('22', '21', 'EXCLUDE', '上传组件列表action', '/codeDict/query.ajax', null, null, null, null, null, null, 'exclude_eump_admin', 'cspm-mgmt');
INSERT INTO `sec_operation_address` VALUES ('23', '22', 'QUERY', '组织管理页面', '/pages/auth/dept.shtml', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('24', '22', 'QUERY', '组织树查询', '/department/listDepartmentTree.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('25', '22', 'QUERY', '组织查询', '/department/findDepartment.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('26', '22', 'QUERY', '组织详情查询', '/department/findDepartmentInfo.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('27', '22', 'QUERY', '更新组织', '/department/updateDepartment.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('28', '22', 'QUERY', '删除组织', '/department/delDepartment.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('29', '22', 'MODIFY', '更新组织', '/department/updateDepartment.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('30', '22', 'DELETE', '删除组织', '/department/delDepartment.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('31', '22', 'ROLE2DEPT', '添加组织角色', '/department/updateDepartmentRole.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('32', '22', 'ROLE2DEPT', '查询组织角色列表', '/department/listDepartmentRoles.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('33', '22', 'STAFF2DEPT', '查询组织用户列表', '/staff/listStaff.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('34', '22', 'STAFF2DEPT', '添加组织用户', '/staff/updateStaffDepartment.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('35', '22', 'AUTH2STAFF', '查询角色关联下用户列表', '/staff/listRoleByStaffIds.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('36', '22', 'AUTH2STAFF', '组织里用户权限修改', '/staff/updateStaffRolesDepartment.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('37', '23', 'QUERY', '成员管理页面', '/pages/auth/staff.shtml', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('38', '23', 'QUERY', '查询请求', '/staff/listStaff.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('39', '23', 'ADD', '查询用户是否存在', '/staff/checkStaffLoginName.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('40', '23', 'ADD', '查询用户是否存在', '/staff/checkStaffMobile.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('41', '23', 'ADD', '查询用户是否存在', '/staff/checkStaffEmail.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('42', '23', 'ADD', '创建请求', '/staff/createStaff.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('43', '23', 'ADD', '查询个人扩展属性', '/staff/findStaffExtendProperties.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('44', '23', 'UPDATE', '查询用户是否存在', '/staff/checkStaffLoginName.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('45', '23', 'UPDATE', '获取用户详情', '/staff/findStaff.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('46', '23', 'UPDATE', '更新', '/staff/updateStaff.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('47', '23', 'UPDATE', '查询个人扩展属性', '/staff/findStaffExtendProperties.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('48', '23', 'DELETE', '删除请求', '/staff/deleteStaff.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('49', '23', 'LOCKSTAFF', '锁定请求', '/staff/lockStaff.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('50', '23', 'RESETPWD', '重置密码请求', '/staff/resetPwd.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('51', '23', 'AUTHSTAFF', '获取用户详情', '/staff/findStaff.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('52', '23', 'AUTHSTAFF', '查询用户角色列表', '/staff/listStaffRoles.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('53', '23', 'AUTHSTAFF', '更新用户角色', '/staff/updateStaffRole.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('54', '24', 'QUERY', '浏览角色页面', '/pages/auth/role.shtml', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('55', '24', 'QUERY', '查看', '/role/listRoles.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('56', '24', 'ADD', '查询角色助记码是否存在', '/role/checkRoleKey.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('57', '24', 'ADD', '添加', '/role/updateRole.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('58', '24', 'MODIFY', '查询角色助记码是否存在', '/role/checkRoleKey.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('59', '24', 'MODIFY', '查询角色详情', '/role/findRole.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('60', '24', 'MODIFY', '修改', '/role/updateRole.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('61', '24', 'DELETE', '删除角色', '/role/deleteRole.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('62', '24', 'AUTHROLE', '浏览角色页面', '/pages/auth/roleSetting.shtml', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('63', '24', 'AUTHROLE', '权限列表', '/role/listRoleResource.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');
INSERT INTO `sec_operation_address` VALUES ('64', '24', 'AUTHROLE', '关联角色权限', '/role/updateRoleResource.ajax', null, null, null, null, null, null, 'auth', 'auth_admin');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='资源分类';

-- ----------------------------
-- Records of sec_resource_category
-- ----------------------------
INSERT INTO `sec_resource_category` VALUES ('20', null, 'SSM后台管理平台', 'SSM后台管理平台', 'fmp-admin', 'manager', 'admin', '2000');
INSERT INTO `sec_resource_category` VALUES ('21', '20', '用户管理', '用户管理', 'fmp-admin', 'auth_user_manager', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('22', '20', '实验室', '实验室', 'fmp-admin', 'auth_laboratory', 'admin', '100');
INSERT INTO `sec_resource_category` VALUES ('23', null, 'admin端例外资源', 'admin端例外资源', 'exclude_eump_admin', 'exclude_eump_admin', 'cspm-mgmt', '1000');
INSERT INTO `sec_resource_category` VALUES ('24', '23', '例外资源', '例外资源', 'exclude_eump_admin', 'auth_exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_resource_category` VALUES ('25', null, '系统管理', '系统管理', 'auth', 'auth_admin', 'auth_admin', '3000');
INSERT INTO `sec_resource_category` VALUES ('26', '25', '组织管理', '组织管理', 'auth', 'auth_admin_sys_dept', 'auth_admin', '100');
INSERT INTO `sec_resource_category` VALUES ('27', '25', '成员管理', '成员管理', 'auth', 'auth_admin_sys_staff', 'auth_admin', '100');
INSERT INTO `sec_resource_category` VALUES ('28', '25', '角色管理', '角色管理', 'auth', 'auth_admin_sys_role', 'auth_admin', '100');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of sec_resources
-- ----------------------------
INSERT INTO `sec_resources` VALUES ('18', 'auth_user_manager_list', '用户信息', '用户信息', '21', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('19', 'auth_laboratory_toolbox', '工具箱', '工具箱', '22', 'AUTH', 'fmp-admin', 'admin', '100');
INSERT INTO `sec_resources` VALUES ('20', 'exclude_eump_admin_session', 'session例外资源', 'session例外资源', '24', 'AUTH', 'exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_resources` VALUES ('21', 'exclude_admin_perm', '鉴权例外资源', '鉴权例外资源', '24', 'AUTH', 'exclude_eump_admin', 'cspm-mgmt', '100');
INSERT INTO `sec_resources` VALUES ('22', 'auth_admin_sys_dept_deptManage', '组织管理', '组织管理', '26', 'AUTH', 'auth', 'auth_admin', '100');
INSERT INTO `sec_resources` VALUES ('23', 'auth_admin_sys_staff_staffManage', '成员管理', '成员管理', '27', 'AUTH', 'auth', 'auth_admin', '100');
INSERT INTO `sec_resources` VALUES ('24', 'auth_admin_sys_role_roleManage', '角色管理', '角色管理', '28', 'AUTH', 'auth', 'auth_admin', '100');

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
