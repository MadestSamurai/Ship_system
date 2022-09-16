package com.csscship.service;

import com.csscship.entity.Appointment;

import java.util.List;

public interface AppointmentService {
    List<Appointment> getAllAppointments();
    List<Appointment> getAllAppointments(String employeename,String ordersidename);
    String delAppointment(Integer id);
    Appointment getAppointment(Integer id);
    String UpdateAppointment(Appointment appointment);
    String addAppointment(Appointment appointment);
    List<Appointment> getOrdersideMessage(Integer ordersideId);
    List<Appointment> selectByEmployeeId(Integer employeeId,String ordersidename,String time);
    Integer selectTheLastAppointment(Integer ordersideId);
}
