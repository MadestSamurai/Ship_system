package com.csscship.controller;

import com.alibaba.fastjson.JSONObject;
import com.csscship.entity.Appointment;
import com.csscship.entity.Progress;
import com.csscship.entity.Login;
import com.csscship.entity.Orderside;
import com.csscship.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class OrdersideController {
    @Autowired
    OrdersideService ordersideService;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    AppointmentService appointmentService;
    @Autowired
    ProgressService progressService;
    @Value("${filepath.appointpdf}")
    private String path;
    @RequestMapping("/admin/ordersideManage")
    public String ordersidelist(HttpServletRequest request,@RequestParam(value="name",required = false) String name,@RequestParam(value="certId",required = false) String certId){
        request.setAttribute("name",name);
        request.setAttribute("certId",certId);
        request.setAttribute("ordersides", ordersideService.getAllOrdersides(name,certId));
        return "/admin/ordersideManage";
    }
    @RequestMapping(value = "/admin/orderside/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject delOrderside(@PathVariable Integer id){
        JSONObject json=new JSONObject();
        json.put("message", ordersideService.delOrderside(id));
        return json;
    }
    @RequestMapping(value = "/admin/orderside/{id}",method = RequestMethod.GET)
    public String ordersideInfo(@PathVariable Integer id,HttpServletRequest request){
        request.setAttribute("orderside", ordersideService.getOrderside(id));
        request.setAttribute("appointments",appointmentService.getOrdersideMessage(id));
        request.setAttribute("employees", employeeService.getAllEmployee());
        return "/admin/info/ordersideinfo";
    }
    @RequestMapping(value = "/admin/ordersideAdd",method = RequestMethod.GET)
    public String ordersideAddPage(){
        return "ordersideadd";
    }
    @RequestMapping(value = "/admin/orderside",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject ordersideInfo(@RequestBody Orderside orderside){
        JSONObject json=new JSONObject();
        json.put("message", ordersideService.updateOrderside(orderside));
        return json;
    }
    @RequestMapping(value = "/admin/orderside",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject delOrderside(@RequestBody Orderside orderside){
        JSONObject json=new JSONObject();
        json.put("message", ordersideService.addOrderside(orderside));
        return json;
    }
    @RequestMapping(value = "/orderside/progress")
    public String progress(HttpSession session,HttpServletRequest request){
        Login login=(Login)session.getAttribute("login");
        Orderside orderside = ordersideService.findOrdersideByLoginId(login.getId());
        Progress progress =new Progress();
        progress.setId(orderside.getProgressid());
        return "orderside/progress";
    }
    @RequestMapping(value = "/orderside/appointment")
    public String appointmentInfo(HttpServletRequest request,HttpSession session){
        Login login=(Login)session.getAttribute("login");
        Orderside orderside = ordersideService.findOrdersideByLoginId(login.getId());
        request.setAttribute("ordersideid", orderside.getId());
        request.setAttribute("employees", employeeService.getAllEmployee());
        return "orderside/appointment";
    }
    @RequestMapping(value = "/orderside/appointment",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject appointment(@RequestBody Appointment appointment){
        JSONObject json=new JSONObject();
        Orderside orderside =new Orderside();
        String message=appointmentService.addAppointment(appointment);
        orderside.setAppointmentid(appointmentService.selectTheLastAppointment(appointment.getOrdersideid()));
        orderside.setId(appointment.getOrdersideid());
        ordersideService.updateAppointMent(orderside);
        json.put("message",message);
        return json;
    }
    @RequestMapping(value="/orderside/search",method=RequestMethod.GET)
    public String search(){
        return "/orderside/search";
    }
    @RequestMapping(value="/orderside/searchinfo",method=RequestMethod.GET)
    @ResponseBody
    public JSONObject searchinfo(@RequestParam("name")String name,@RequestParam("type")String type){
        JSONObject json=new JSONObject();
        json.put("map", ordersideService.serrchInfo(name,type));
        return json;
    }
    @RequestMapping(value = "/csscShip/{view}")
    public String test(@PathVariable String view){
        return "orderside/"+view;
    }

}
