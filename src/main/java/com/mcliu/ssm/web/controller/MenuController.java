package com.mcliu.ssm.web.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.aspire.webbas.core.web.BaseController;
import com.aspire.webbas.portal.common.entity.Staff;
import com.mcliu.ssm.web.service.MenuAndAuthService;
import com.mcliu.ssm.web.tree.MenuTreeNode;

@Controller
@RequestMapping({"/menu"})
public class MenuController extends BaseController {
    @Autowired
    @Qualifier("menuService")
    private MenuAndAuthService menuService;

    @RequestMapping({"/menu.ajax"})
    @ResponseBody
    public Map<String, ? extends Object> menu() {
        try {
//            Staff loginStaff = StaffUtil.getLoginStaff();
//            if (loginStaff == null) {
//                throw new Exception("用户为登录");
//            }
            HttpSession session = getSession();

            List<MenuTreeNode> menuTree =
                    this.menuService.buildMenuTree("", session.getId(),
                            getRequest().getContextPath());
            return success(menuTree);
        } catch (Exception e) {
            return fail(e.getMessage());
        }
    }
}
