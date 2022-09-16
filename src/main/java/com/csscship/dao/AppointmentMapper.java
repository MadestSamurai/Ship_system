package com.csscship.dao;

import com.csscship.entity.Appointment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppointmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Appointment record);

    int insertSelective(Appointment record);

    Appointment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Appointment record);

    int updateByPrimaryKey(Appointment record);
    List<Appointment> findAll(List<Integer> employeeids,List<Integer> ordersideids);
    List<Appointment> selectByOrdersideId(@Param("ordersideid")Integer ordersideId);
    List<Appointment> selectByEmployeeId(@Param("employeeId")Integer employeeId,List<Integer> ordersideids,String time);
    Integer selectTheLast(@Param("ordersideid")Integer ordersideId);
}