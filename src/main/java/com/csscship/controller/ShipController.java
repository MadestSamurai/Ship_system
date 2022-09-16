package com.csscship.controller;

import com.alibaba.fastjson.JSONObject;
import com.csscship.entity.Employee;
import com.csscship.entity.Part;
import com.csscship.entity.Ship;
import com.csscship.service.EmployeeService;
import com.csscship.service.PartService;
import com.csscship.service.ShipService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class ShipController {
    @Autowired
    ShipService shipService;
    @Autowired
    PartService partService;
    @Autowired
    EmployeeService employeeService;

    @RequestMapping("admin/shipManage")
    public String shipManage(HttpServletRequest request,@RequestParam(value="name",required = false) String name,@RequestParam(value="type",required = false) Integer type){
        request.setAttribute("name",name);
        Ship ship =new Ship();
        ship.setShipname(name);
        ship.setShiptype(type);
        List<Ship> list = shipService.getAllShip(ship);
        int i = 0;
        for (Ship ship1 : list){
            List<Part> parts = partService.getPartByShipid(list.get(i).getShipid());
            List<String> partnames = new ArrayList<>();
            for (Part part:parts)
                partnames.add(part.getPartname());
            List<String> empty = new ArrayList<String>();
            empty.add("无部件");
            ship1.setParts(partnames.isEmpty()?empty:partnames);
            list.set(i, ship1);
            i++;
        }
        request.setAttribute("ship", list);
        return "/admin/shipManage";
    }
    @RequestMapping(value = "/admin/ship/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject delShip(@PathVariable Integer id){
        JSONObject json=new JSONObject();
        json.put("message", shipService.delShip(id));
        return json;
    }

    @RequestMapping(value = "/admin/shipSupDel")
    public String delShipSup(HttpServletRequest request,@RequestParam(value="shipsupid",required = false) Integer id,
                             @RequestParam(value="shipid",required = false) Integer shipid){
        shipService.delShipSupById(id);
        return "/admin/shipSup/"+shipid;
    }

    @RequestMapping(value = "/admin/shipSupAdd")
    public String AddShipSup(HttpServletRequest request,@RequestParam(value="supid",required = false) Integer supid,
                             @RequestParam(value="shipid",required = false) Integer shipid){
        shipService.insertShipSupRelation(shipid, supid);
        return "/admin/shipSup/"+shipid;
    }

    @RequestMapping(value = "/admin/ship",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addShip(@RequestBody Ship ship){
        JSONObject json=new JSONObject();
        Log log = LogFactory.getLog(EmployeeService.class);
        log.info(ship);
        json.put("message", shipService.addShip(ship));
        return json;
    }
    @RequestMapping("/admin/shipAdd")
    public String shipAddPage(HttpServletRequest request){
        request.setAttribute("parts", partService.getAll());
        return "/admin/add/shipadd";
    }

    @RequestMapping(value = "/admin/ship/{id}",method = RequestMethod.GET)
    public String shipInfo(HttpServletRequest request,@PathVariable Integer id) {
        List<Part> parts = partService.getPartByShipid(id);
        List<String> partnames = new ArrayList<>();
        for (Part part:parts)
            partnames.add(part.getPartname());
        Ship ship = shipService.getShip(id);
        ship.setParts(partnames);
        request.setAttribute("parts", partService.getAll());
        request.setAttribute("ship", ship);
        return "/admin/info/shipinfo";
    }

    @RequestMapping(value = "/admin/shipSup/{shipid}",method = RequestMethod.GET)
    public String shipSuperior(HttpServletRequest request,@PathVariable Integer shipid) {
        Log log = LogFactory.getLog(EmployeeService.class);
        log.info(employeeService.getSuperiorByShipid(shipid));
        List<Employee> superiors = employeeService.getExpert();
        log.info(superiors.get(0));
        List<Employee> list = employeeService.getExpert();
        List<Employee> employees = employeeService.getSuperiorByShipid(shipid);
        int i=0;
        for (Employee superior : list){
            for (Employee employee : employees) {
                if (Objects.equals(superior.getEmpid(), employee.getEmpid())) {
                    superiors.remove(i);
                    i--;
                    break;
                }
            }
            i++;
        }
        log.info(superiors);
        request.setAttribute("shipidcopy",shipid);
        request.setAttribute("employees", employees);
        request.setAttribute("superiors", superiors);
        return "/admin/info/shipSuperior";
    }

    @RequestMapping(value = "/admin/shipPart/{shipid}",method = RequestMethod.GET)
    public String shipPart(HttpServletRequest request,@PathVariable Integer shipid) {
        List<Part> parts = partService.getPartByShipid(shipid);
        request.setAttribute("parts", parts);
        return "/admin/info/shipPart";
    }

    @RequestMapping(value = "/admin/ship",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updateShip(@RequestBody Ship ship) {
        JSONObject json=new JSONObject();
        Log log = LogFactory.getLog(EmployeeService.class);
        log.info(ship.toString());
        json.put("message", shipService.updateShip(ship));
        return  json;
    }
}
