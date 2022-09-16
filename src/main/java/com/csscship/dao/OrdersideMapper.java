package com.csscship.dao;

import com.csscship.entity.Orderside;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrdersideMapper {
    List<Orderside> findAll(@Param("name")String name, @Param("certId")String certId);
    int deleteByPrimaryKey(Integer id);

    int insert(Orderside record);

    int insertSelective(Orderside record);

    Orderside selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Orderside record);

    int updateByPrimaryKey(Orderside record);
    Orderside findOrdersideByCertId(@Param("certId")String certId);
    Orderside findOrdersideByLoginId(@Param("loginid")Integer loginid);
    List<Orderside> getOrdersideByName(@Param("name")String name);
}