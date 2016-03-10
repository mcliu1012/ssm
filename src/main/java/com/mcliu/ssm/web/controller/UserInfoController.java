package com.mcliu.ssm.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	    LOG.info("=========当前登录用户：{}==========", getCurrentLogin().getLoginName());
		Page<Staff> list = staffService.pageQuery(page);
		return super.page(list);
	}

	@RequestMapping(value = "/add.ajax", method = RequestMethod.POST)
	@ResponseBody
    public Map<String, Object> add(Staff staff, @RequestParam(value = "updId", required = false) Long updId) throws Exception {
        if (updId == null) {
        } else {
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
     */
    @RequestMapping(value = "/selectStaffByLoginName.ajax")
    @ResponseBody
    public Map<String, Object> selectStaffByLoginName(String loginName) {
        // 合作伙伴ID
        Map<String, Object> map = new HashMap<String, Object>();
        List<Staff> list = new ArrayList<Staff>();
        map.put("userList", list);
        return map;
    }
}