package com.csscship.controller;

import com.alibaba.fastjson.JSONObject;
import com.csscship.entity.Part;
import com.csscship.service.EmployeeService;
import com.csscship.service.PartService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PartController {
    @Autowired
    PartService partService;
    @RequestMapping("/admin/partManage")
    public String partManage(HttpServletRequest request){
        request.setAttribute("parts", partService.getAll());
        return "/admin/partManage";
    }
    @RequestMapping(value = "/admin/part/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject delPart(@PathVariable Integer id){
        JSONObject json=new JSONObject();
        json.put("message", partService.deletePart(id));
        return json;
    }
    @RequestMapping(value = "/admin/part",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject addPart(@RequestBody Part part){
        JSONObject json=new JSONObject();
        json.put("message", partService.insert(part));
        return json;
    }
    @RequestMapping("/admin/partAdd")
    public String partAddPage(){
        return  "/admin/add/partadd";
    }
    @RequestMapping(value = "/admin/part/{id}",method = RequestMethod.GET)
    public String shipInfo(HttpServletRequest request,@PathVariable Integer id) {
        request.setAttribute("part", partService.getPart(id));
        return  "/admin/info/partinfo";
    }
    @RequestMapping(value = "/admin/part",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updatePart(@RequestBody Part part) {
        JSONObject json=new JSONObject();
        Log log = LogFactory.getLog(EmployeeService.class);
        log.info(part);
        json.put("message", partService.updatePart(part));
        return  json;
    }
}
