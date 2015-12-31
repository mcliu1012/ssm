package com.mcliu.ssm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mcliu.ssm.web.dao.OrderInfoMapper;
import com.mcliu.ssm.web.entity.OrderInfo;
import com.mcliu.ssm.web.service.LoginService;

@Service("loginService")
public class LoginServiewImpl implements LoginService {
    
    @Autowired
    private OrderInfoMapper orderInfoMapper;

    @Override
    public List<OrderInfo> getAll() {
        return orderInfoMapper.selectAll();
    }

}
