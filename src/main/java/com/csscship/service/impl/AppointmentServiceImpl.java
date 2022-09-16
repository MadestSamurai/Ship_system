package com.csscship.service.impl;

import com.csscship.common.CommonService;
import com.csscship.dao.AppointmentMapper;
import com.csscship.dao.EmployeeMapper;
import com.csscship.dao.OrdersideMapper;
import com.csscship.entity.Appointment;
import com.csscship.service.AppointmentService;
import com.csscship.utils.OrdersideEmployeeutils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AppointmentServiceImpl implements AppointmentService {
    @Autowired
    AppointmentMapper appointmentMapper;
    @Autowired
    OrdersideMapper ordersideMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Override
    public List<Appointment> getAllAppointments() {
        return appointmentMapper.findAll(null,null);
    }

    @Override
    public List<Appointment> getAllAppointments(String employeename, String ordersidename) {
        Map map= OrdersideEmployeeutils.getEmployeeIdsAndOrdersideIds(employeename, employeeMapper,ordersidename, ordersideMapper);
        return appointmentMapper.findAll((List)map.get("employeeids"),(List)map.get("ordersideids"));
    }

    @Override
    public String delAppointment(Integer id) {
        return appointmentMapper.deleteByPrimaryKey(id)>0? CommonService.del_message_success:CommonService.del_message_error;
    }

    @Override
    public Appointment getAppointment(Integer id) {
        return appointmentMapper.selectByPrimaryKey(id);
    }

    @Override
    public String UpdateAppointment(Appointment appointment) {
        return appointmentMapper.updateByPrimaryKey(appointment)>0?CommonService.upd_message_success:CommonService.upd_message_error;
    }

    @Override
    public String addAppointment(Appointment appointment) {
        return appointmentMapper.insert(appointment)>0?CommonService.add_message_success:CommonService.add_message_error;
    }

    @Override
    public List<Appointment> getOrdersideMessage(Integer ordersideId) {
        return appointmentMapper.selectByOrdersideId(ordersideId);
    }

    @Override
    public List<Appointment> selectByEmployeeId(Integer employeeId,String ordersidename,String time) {
        List<Integer> ordersideids=OrdersideEmployeeutils.getOrdersideIds(ordersidename, ordersideMapper);
        return appointmentMapper.selectByEmployeeId(employeeId,ordersideids,time);
    }

    @Override
    public Integer selectTheLastAppointment(Integer ordersideId) {
        return appointmentMapper.selectTheLast(ordersideId);
    }
}
