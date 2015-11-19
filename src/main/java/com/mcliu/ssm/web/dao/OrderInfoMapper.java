package com.mcliu.ssm.web.dao;

import java.util.List;

import com.mcliu.ssm.web.model.OrderInfo;

public interface OrderInfoMapper {
    int deleteByPrimaryKey(Long orderId);

    int insert(OrderInfo record);

    int insertSelective(OrderInfo record);

    OrderInfo selectByPrimaryKey(Long orderId);

    int updateByPrimaryKeySelective(OrderInfo record);

    int updateByPrimaryKey(OrderInfo record);
    
    List<OrderInfo> selectAll();
}