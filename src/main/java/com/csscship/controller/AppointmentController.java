package com.csscship.controller;

import com.alibaba.fastjson.JSONObject;
import com.csscship.entity.Appointment;
import com.csscship.service.AppointmentService;
import com.csscship.service.EmployeeService;
import com.csscship.service.OrdersideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AppointmentController {
    @Autowired
    AppointmentService appointmentService;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    OrdersideService ordersideService;
    @RequestMapping("/admin/appointmentManage")
    public String appointmentManage(HttpServletRequest request,@RequestParam(value = "employeename",required = false)String employeename,@RequestParam(value = "ordersidename",required = false)String ordersidename){
        request.setAttribute("employeename",employeename);
        request.setAttribute("ordersidename",ordersidename);
        List<Appointment> appointmentList=appointmentService.getAllAppointments(employeename,ordersidename);
        request.setAttribute("appointments" ,appointmentList);
        return"admin/appointmentManage";
    }
    @RequestMapping("/admin/appointmentAdd")
    public String appointmentAddPage(HttpServletRequest request){
        request.setAttribute("ordersides", ordersideService.getAllOrdersides());
        //request.setAttribute("employees",employeeService.getAllEmployee());
        return"admin/add/appointmentadd";
    }
    @RequestMapping(value = "/admin/appointment/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject delAppointment(@PathVariable Integer id){
        JSONObject json=new JSONObject();
        json.put("message",appointmentService.delAppointment(id));
        return json;
    }
    @RequestMapping(value = "/admin/appointment/{id}",method = RequestMethod.GET)
    public String AppointmentInfo(@PathVariable Integer id,HttpServletRequest request){
        request.setAttribute("ordersides", ordersideService.getAllOrdersides());
        request.setAttribute("employees", employeeService.getAllEmployee());
        request.setAttribute("appointment",appointmentService.getAppointment(id));
        return "admin/info/appointmentInfo";
    }
    @RequestMapping(value = "/admin/appointment",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject AppointmentUpdate(@RequestBody Appointment appointment){
        JSONObject json=new JSONObject();
        json.put("message",appointmentService.UpdateAppointment(appointment));
        return json;
    }
    @RequestMapping(value = "/admin/appointment",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject AppointmentAdd(@RequestBody Appointment appointment){
        JSONObject json=new JSONObject();
        json.put("message",appointmentService.addAppointment(appointment));
        return json;
    }
}
