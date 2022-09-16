package com.csscship.controller;

import com.alibaba.fastjson.JSONObject;
import com.csscship.entity.*;
import com.csscship.service.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    AppointmentService appointmentService;
    @Autowired
    OrdersideService ordersideService;
    @Autowired
    ShipService shipService;
    @Autowired
    ProgressService progressService;
    @Autowired
    PartService partService;
    @Value("${filepath.seekpdfpath}")
    private String path;
    @RequestMapping("/admin/employeeManage")
    public String employeeManage(HttpServletRequest request,@RequestParam(value="empname",required = false) String empname,@RequestParam(value="certId",required = false) String certId){
        request.setAttribute("empname",empname);
        request.setAttribute("certId",certId);
        List<Employee> list = employeeService.getAllEmployee(empname,certId);
        int i = 0;
        List<Employee> superiors = employeeService.getExpert();
        for (Employee emp : list){
            List<String> dept = departmentService.getDeptByEmpid(list.get(i).getEmpid());
            List<String> empty = new ArrayList<>();
            empty.add("未知部门");
            emp.setDepartments(dept.isEmpty()?empty:dept);
            for (Employee superior : superiors){
                if(Objects.equals(superior.getEmpid(), emp.getSuperior())){
                    emp.setSupname(superior.getEmpname());
                    break;
                }
                emp.setSupname("无上级");
            }
            list.set(i, emp);
            i++;
        }
        request.setAttribute("employees", list);
        return "admin/employeeManage";
    }
    @RequestMapping(value = "/admin/employee/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject delEmployee(@PathVariable Integer id){
        JSONObject json=new JSONObject();
        json.put("message", employeeService.delEmployee(id));
        return json;
    }
    @RequestMapping(value = "/admin/employee/{id}",method = RequestMethod.GET)
    public String employeeInfo(@PathVariable Integer id,HttpServletRequest request){
        List<String> depts = departmentService.getDeptByEmpid(id);
        Employee emp = employeeService.getEmployee(id);
        emp.setDepartments(depts);
        request.setAttribute("employee", emp);
        request.setAttribute("departments", departmentService.getAll());
        return "admin/info/employeeinfo";
    }
    @RequestMapping(value = "/admin/employee",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject AddEmployee(@RequestBody Employee employee){
        JSONObject json=new JSONObject();
        json.put("message", employeeService.addEmployee(employee));
        return json;
    }
    @RequestMapping(value = "/admin/employee",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updateEmployee(@RequestBody Employee employee){
        JSONObject json=new JSONObject();
        Log log = LogFactory.getLog(EmployeeService.class);
        log.info(employee.toString());
        json.put("message", employeeService.upEmployee(employee));
        return json;
    }
    @RequestMapping(value = "/admin/empsup/{id}",method = RequestMethod.GET)
    public String employeeSup(@PathVariable Integer id,HttpServletRequest request){
        Employee emp = employeeService.getEmployee(id);
        request.setAttribute("employee", emp);
        request.setAttribute("superiors", employeeService.getExpert());
        return "admin/info/empSuperior";
    }
    @RequestMapping(value = "/admin/empSuperior",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updateEmpSup(@RequestBody Employee employee){
        JSONObject json=new JSONObject();
        json.put("message", employeeService.upEmpSuperior(employee));
        return json;
    }
    @RequestMapping("/admin/employeeAdd")
    public String employeeAddPage(HttpServletRequest request){
        request.setAttribute("departments", departmentService.getAll());
        return "admin/add/employeeadd";
    }

    @RequestMapping("/employee/workerList")
    public String employeeList(HttpSession session,HttpServletRequest request,@RequestParam(value="empname",required = false) String empname,@RequestParam(value="certId",required = false) String certId){
        request.setAttribute("empname",empname);
        request.setAttribute("certId",certId);
        Employee employee = (Employee)session.getAttribute("userinfo");
        List<Employee> list = employeeService.getAllEmployee(empname,certId,employee.getEmpid());
        int i = 0;
        for (Employee emp : list){
            List<String> dept = departmentService.getDeptByEmpid(list.get(i).getEmpid());
            List<String> empty = new ArrayList<>();
            empty.add("未知部门");
            emp.setDepartments(dept.isEmpty()?empty:dept);
            list.set(i, emp);
            i++;
        }
        request.setAttribute("employees", list);
        return "/employee/workerList";
    }

    @RequestMapping("/employee/shipList")
    public String shipList(HttpSession session,HttpServletRequest request){
        Employee userinfo = (Employee) session.getAttribute("userinfo");
        List<Ship> list = shipService.getShipBySuperior(userinfo.getEmpid());
        Log log = LogFactory.getLog(EmployeeService.class);
        log.info(list);
        int i = 0;
        for (Ship ship1 : list){
            ship1.setPartList(partService.getPartByShipid(list.get(i).getShipid()));
            list.set(i, ship1);
            i++;
        }
        request.setAttribute("ship", list);
        return "/employee/shipList";
    }

    @RequestMapping("/employee/taskDistribute/{taskid}")
    public String taskDistribute(@PathVariable Integer taskid,HttpSession session,HttpServletRequest request){
        List<Progress> progressall = progressService.getAllProgresses("", taskid);
        List<Progress> progresses = new ArrayList<>();
        Map<String, Integer> shippartid = shipService.selectShipPartByTaskid(taskid);
        Employee employee = (Employee)session.getAttribute("userinfo");
        List<Employee> list = employeeService.getAllEmployee(null, null, employee.getEmpid());
        for (Progress progress:progressall){
            for (Employee emp:list) {
                if (progress.getEmployee_id().equals(emp.getEmpid())) {
                    progresses.add(progress);
                }
            }
        }
        for (Progress progress : progresses){
            progress.setEmpname(employeeService.getEmployee(progress.getEmployee_id()).getEmpname());
            progress.setShipname(shipService.getShip(progress.getShip_id()).getShipname());
            progress.setPartname(partService.getPart(progress.getPart_id()).getPartname());
        }
        Log log = LogFactory.getLog(ProgressController.class);
        log.info(progresses.toString());
        request.setAttribute("ship_partname",shipService.getShip((Integer) shippartid.get("ship_id")).getShipname()+" - "+partService.getPart((Integer) shippartid.get("part_id")).getPartname());
        request.setAttribute("progresses", progresses);
        request.setAttribute("task_id", taskid);
        return "/employee/taskDistribute";
    }

    @RequestMapping("/employee/taskList")
    public String taskView(HttpSession session,HttpServletRequest request){
        Employee userinfo = (Employee) session.getAttribute("userinfo");
        Integer empid = userinfo.getEmpid();
        List<Progress> progresses = progressService.getAllProgresses("", null, empid);
        int i = 0;
        for (Progress progress : progresses){
            progress.setEmpname(employeeService.getEmployee(progress.getEmployee_id()).getEmpname());
            progress.setShipname(shipService.getShip(progress.getShip_id()).getShipname());
            progress.setPartname(partService.getPart(progress.getPart_id()).getPartname());
            progresses.set(i, progress);
            i++;
        }
        Log log = LogFactory.getLog(ProgressController.class);
        log.info(progresses.toString());
        request.setAttribute("progresses", progresses);
        return "/employee/taskList";
    }

    @RequestMapping("/employee/taskListEmp/{empid}")
    public String taskView(@PathVariable Integer empid,HttpServletRequest request){
        List<Progress> progresses = progressService.getAllProgresses("", null, empid);
        int i = 0;
        for (Progress progress : progresses){
            progress.setEmpname(employeeService.getEmployee(progress.getEmployee_id()).getEmpname());
            progress.setShipname(shipService.getShip(progress.getShip_id()).getShipname());
            progress.setPartname(partService.getPart(progress.getPart_id()).getPartname());
            progresses.set(i, progress);
            i++;
        }
        Log log = LogFactory.getLog(ProgressController.class);
        log.info(progresses.toString());
        request.setAttribute("progresses", progresses);
        return "/employee/taskListEmp";
    }

    @RequestMapping("/employee/progressAdd/{task_id}")
    public String progressAddPage(HttpSession session,HttpServletRequest request, @PathVariable Integer task_id){
        List<Progress> progresses = progressService.getAllProgresses("", task_id);
        Employee employee = (Employee)session.getAttribute("userinfo");
        List<Employee> list = employeeService.getAllEmployee(null, null, employee.getEmpid());
        List<Employee> workers = employeeService.getAllEmployee(null, null, employee.getEmpid());
        int i=0;
        for (Employee emp:list) {
            for (Progress progress:progresses){
                if (progress.getEmployee_id().equals(emp.getEmpid())) {
                    workers.remove(i);
                    i--;
                }
            }
            i++;
        }
        request.setAttribute("workers", workers);
        request.setAttribute("taskid",task_id);
        return "/employee/add/progressadd";
    }
    @RequestMapping(value = "/employee/progress",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject progressAdd(@RequestBody Progress progress){
        JSONObject json=new JSONObject();
        if (progress.getEmployee_id()==null){
            json.put("message", "没有员工可添加");
            return json;
        }
        progress.setIntime(new Date());
        json.put("message", progressService.AddProgress(progress));
        return json;
    }
    @RequestMapping(value = "/employee/progress/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject delProgress(@PathVariable Integer id){
        JSONObject json=new JSONObject();
        json.put("message", progressService.deleteProgress(id));
        return json;
    }
    @RequestMapping(value = "/employee/progress/{id}",method = RequestMethod.GET)
    public String progressInfo(HttpServletRequest request,@PathVariable Integer id){
        Progress progress = progressService.getProgress(id);
        Log log = LogFactory.getLog(ProgressController.class);
        log.info(progress.toString());
        progress.setEmpname(employeeService.getEmployee(progress.getEmployee_id()).getEmpname());
        progress.setShipname(shipService.getShip(progress.getShip_id()).getShipname());
        progress.setPartname(partService.getPart(progress.getPart_id()).getPartname());
        request.setAttribute("h", progress);
        return "/employee/info/progressinfo";
    }
    @RequestMapping(value = "/employee/progressWorker/{id}",method = RequestMethod.GET)
    public String progressWorkerInfo(HttpServletRequest request,@PathVariable Integer id){
        Progress progress = progressService.getProgress(id);
        Log log = LogFactory.getLog(ProgressController.class);
        log.info(progress.toString());
        progress.setEmpname(employeeService.getEmployee(progress.getEmployee_id()).getEmpname());
        progress.setShipname(shipService.getShip(progress.getShip_id()).getShipname());
        progress.setPartname(partService.getPart(progress.getPart_id()).getPartname());
        request.setAttribute("h", progress);
        return "/employee/info/progressWorkerinfo";
    }
    @RequestMapping(value = "/employee/progress",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updateProgress(@RequestBody Progress progress) {
        JSONObject json=new JSONObject();
        if (progress.getTaskstatus() == 1) progress.setOuttime(null);
        json.put("message", progressService.updateProgress(progress));
        return json;
    }
    @RequestMapping(value = "/employee/progressWorker",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updateProgressWorker(@RequestBody Progress progress){
        JSONObject json=new JSONObject();
        if (progress.getTaskstatus() == 0) progress.setOuttime(new Date());
        json.put("message", progressService.updateProgress(progress));
        return json;
    }

    @RequestMapping("/employee/infoEdit")
    public String infoEdit(HttpSession session,HttpServletRequest request){
        Employee userinfo = (Employee) session.getAttribute("userinfo");
        Employee emp = employeeService.getEmployee(userinfo.getEmpid());
        List<String> dept = departmentService.getDeptByEmpid(emp.getEmpid());
        List<String> empty = new ArrayList<>();
        List<Employee> superiors = employeeService.getExpert();
        empty.add("未知部门");
        emp.setDepartments(dept.isEmpty()?empty:dept);
        for (Employee superior : superiors){
            if(Objects.equals(superior.getEmpid(), emp.getSuperior())){
                emp.setSupname(superior.getEmpname());
                break;
            }
            emp.setSupname("无上级");
        }
        request.setAttribute("employee", emp);
        request.setAttribute("departments", departmentService.getAll());
        return "/employee/infoEdit";
    }
    @RequestMapping(value = "/employee/employee",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updateInfo(@RequestBody Employee employee){
        JSONObject json=new JSONObject();
        Log log = LogFactory.getLog(EmployeeService.class);
        log.info(employee.toString());
        json.put("message", employeeService.upEmployee(employee));
        return json;
    }
}
