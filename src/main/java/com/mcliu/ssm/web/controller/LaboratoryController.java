package com.mcliu.ssm.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mcliu.ssm.util.IpAddress;

@Controller
@RequestMapping("/laboratory")
public class LaboratoryController extends BaseActionController {
    private Logger logger = LoggerFactory.getLogger(LaboratoryController.class);

    /**
     * 网络工具初始化
     *
     */
    @RequestMapping(value = "/network/init.ajax")
    @ResponseBody
    public Map<String, Object> init(Model model, HttpServletRequest request) throws Exception {
        logger.debug("==== network init START ====");

        Map<String, Object> map = new HashMap<String, Object>();
        String hostIp = IpAddress.getClientIpAddr(request);
        String hostAddress = IpAddress.GetAddressByIp(hostIp);
        map.put("hostIp", hostIp);
        map.put("hostAddress", hostAddress);
        
        logger.debug("==== network init END ====");
        return super.success(map);
    }

    @RequestMapping(value = "/network/checkIp.ajax")
    @ResponseBody
    public Map<String, Object> checkIp(Model model, @RequestParam String checkIp) {
        logger.debug("==== checkIp START ====");

        String checkIpAddress = IpAddress.GetAddressByIp(checkIp);

        logger.debug("==== checkIp END ====");
        return super.success(checkIpAddress);
    }

}
