package com.mcliu.ssm.web.dao;

import com.aspire.webbas.portal.common.entity.City;
import java.util.List;

public abstract interface CityMapper {
    public abstract int deleteByPrimaryKey(Integer paramInteger);

    public abstract int insert(City paramCity);

    public abstract int insertSelective(City paramCity);

    public abstract List<City> list(City paramCity);

    public abstract City selectByPrimaryKey(Integer paramInteger);

    public abstract int updateByPrimaryKeySelective(City paramCity);

    public abstract int updateByPrimaryKey(City paramCity);
}
