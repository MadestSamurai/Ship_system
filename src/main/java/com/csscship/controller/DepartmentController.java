package com.csscship.controller;

import com.alibaba.fastjson.JSONObject;
import com.csscship.entity.Department;
import com.csscship.entity.Employee;
import com.csscship.service.DepartmentService;
import com.csscship.service.EmployeeService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("/admin/departmentManage")
    public String departmentManage(HttpServletRequest request){
        request.setAttribute("departments", departmentService.getAll());
        return "/admin/departmentManage";
    }
    @RequestMapping(value = "/admin/department/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject delDepartment(@PathVariable Integer id){
        JSONObject json=new JSONObject();
        json.put("message", departmentService.deleteDepartment(id));
        return json;
    }
    @RequestMapping(value = "/admin/department",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addShip(@RequestBody Department department){
        JSONObject json=new JSONObject();
        json.put("message", departmentService.insert(department));
        return json;
    }
    @RequestMapping("/admin/departmentAdd")
    public String departmentAddPage(){
        return "/admin/add/departmentadd";
    }

    @RequestMapping(value = "/admin/departmentemp/{deptid}",method = RequestMethod.GET)
    public String departmentEmp(HttpServletRequest request,@PathVariable Integer deptid) {
        List<Employee> list = employeeService.getEmployeeByDeptid(deptid);
        int i = 0;
        for (Employee emp : list){
            List<String> dept = departmentService.getDeptByEmpid(list.get(i).getEmpid());
            emp.setDepartments(dept);
            list.set(i, emp);
            i++;
        }
        request.setAttribute("employees", list);
        return "/admin/info/departmentEmp";
    }

    @RequestMapping(value = "/admin/department/{deptid}",method = RequestMethod.GET)
    public String departmentInfo(HttpServletRequest request,@PathVariable Integer deptid) {
        request.setAttribute("department", departmentService.getDepartment(deptid));
        return "/admin/info/departmentinfo";
    }

    @RequestMapping(value = "/admin/department",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updateDepartment(@RequestBody Department department) {
        JSONObject json=new JSONObject();
        Log log = LogFactory.getLog(EmployeeService.class);
        log.info(department);
        json.put("message", departmentService.updateDepartment(department));
        return json;
    }
}
