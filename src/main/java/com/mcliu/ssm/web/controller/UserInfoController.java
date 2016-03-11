package com.mcliu.ssm.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aspire.webbas.core.pagination.mybatis.pager.Page;
import com.aspire.webbas.portal.common.entity.Staff;
import com.mcliu.ssm.util.Constant;
import com.mcliu.ssm.web.service.StaffService;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController extends BaseActionController {
	private static final Logger LOG = LoggerFactory.getLogger(UserInfoController.class);
	@Autowired
	@Qualifier("staffService")
	private StaffService staffService;

	@RequestMapping(value = "/query.ajax")
	@ResponseBody
	public Map<String, Object> pageQuery(Page<Staff> page) throws Exception {
	    Staff staff = getCurrentLogin();
	    if (null == staff) {
	        return super.fail("获取当前登录用户信息失败");
	    }
	    LOG.debug("=========当前登录用户：{}==========", staff.getLoginName());
//	    page.getParams().put("staffId", staff.getStaffId());
		Page<Staff> list = staffService.pageQuery(page);
		return super.page(list);
	}

	@RequestMapping(value = "/add.ajax", method = RequestMethod.POST)
	@ResponseBody
    public Map<String, Object> add(Staff staff, @RequestParam(value = "updId", required = false) Long updId) throws Exception {
	    // 基础校验和业务逻辑校验
        StringBuilder errorMessage = new StringBuilder();
        if (!isParamCheck(staff, errorMessage)) {
            return super.fail(errorMessage.toString());
        }
        
        if (updId == null) {
            // 暂时只支持登录页注册
        } else {
            Staff staffDB = staffService.getStaff(updId);
            if (null == staffDB) {
                return super.fail("非法请求");
            }
            staffDB.setStatus(staff.getStatus());
            staffDB.setMobile(staff.getMobile());
            staffDB.setRealName(staff.getRealName());
            staffDB.setSex(staff.getSex());
            staffDB.setEmail(staff.getEmail());
            staff = staffDB;
        }
        staffService.saveAndUpdate(staff);
        return super.success(staff);
    }


	@RequestMapping(value = "/delete.ajax")
	@ResponseBody
	public Map<String, Object> delete(Long staffId) throws Exception {
		staffService.deleteStaff(staffId);
		return super.success("删除成功");
	}

	@RequestMapping(value = "/get.ajax")
	@ResponseBody
	public Map<String, Object> get(Long staffId) throws Exception {
		Staff data = staffService.getStaff(staffId);
		return super.success(data);
	}
    
    /**
     * 根据用户名取出用户信息
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/selectStaffByLoginName.ajax")
    @ResponseBody
    public Map<String, Object> selectStaffByLoginName(String loginName) throws Exception {
        Staff staff = getCurrentLogin();
        if (null == staff) {
            return super.fail("获取当前登录用户信息失败");
        }
        LOG.debug("=========当前登录用户：{}==========", staff.getLoginName());
        
        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("staffId", staff.getStaffId());
        map.put("loginName", loginName);
        List<Staff> list = staffService.getStaffByMap(map);
        map.put("userList", list);
        return map;
    }
    
    /**
     * 基础校验和业务逻辑校验
     */
    private boolean isParamCheck(Staff staff, StringBuilder errorMessage) {
        if (null == staff) {
            errorMessage.append("非法请求");
            return false;
        }
        
        // 成员状态
        if (null == staff.getStatus()) {
            errorMessage.append("请选择成员状态");
            return false;
        }
        
        // 手机号码
        if (StringUtils.isEmpty(staff.getMobile())) {
            errorMessage.append("请输入手机号码");
            return false;
        }
        // 手机号码合法性校验
        if (!staff.getMobile().matches(Constant.REGEX_MOBILE)) {
            errorMessage.append("请输入合法的手机号码");
            return false;
        }
        
        // 真实姓名
        if (StringUtils.isEmpty(staff.getRealName())) {
            errorMessage.append("请输入真实姓名");
            return false;
        }
        
        // 性别
        if (null == staff.getSex()) {
            errorMessage.append("请选择性别");
            return false;
        }
        
        // 电子邮箱
        if (StringUtils.isEmpty(staff.getEmail())) {
            errorMessage.append("请输入电子邮箱");
            return false;
        }
        // 电子邮箱合法性校验
        if (!staff.getEmail().matches(Constant.REGEX_EMAIL)) {
            errorMessage.append("请输入合法的电子邮箱");
            return false;
        }
        
        return true;
    }
    
    /**
     * 取得当前登录staff
     */
    @RequestMapping(value = "/getCurrentStaff.ajax")
    @ResponseBody
    public Map<String, Object> getCurrentStaff() {
        Staff staff = getCurrentLogin();
        if (null == staff) {
            return super.fail("获取当前登录用户信息失败");
        }
        return super.success(staff);
    }
}