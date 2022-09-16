package com.csscship.controller;

import com.alibaba.fastjson.JSONObject;
import com.csscship.entity.Progress;
import com.csscship.entity.Task;
import com.csscship.service.*;
import com.csscship.utils.ExcelUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ProgressController {
    @Autowired
    ProgressService progressService;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    ShipService shipService;
    @Autowired
    PartService partService;
    @Autowired
    OrdersideService ordersideService;
    @RequestMapping("/admin/progressManage")
    public String progressManage(HttpServletRequest request,@RequestParam(value = "ordersidename",required = false)String ordersidename,@RequestParam(value = "intime",required = false)String intime){
        List<Progress> progresses = progressService.getAllProgresses(intime);
        for (Progress progress : progresses){
            progress.setEmpname(employeeService.getEmployee(progress.getEmployee_id()).getEmpname());
            progress.setShipname(shipService.getShip(progress.getShip_id()).getShipname());
            progress.setPartname(partService.getPart(progress.getPart_id()).getPartname());
        }
        request.setAttribute("progresses", progresses);
        return "/admin/progressManage";
    }
    @RequestMapping("/admin/progressAdd")
    public String progressAddPage(HttpServletRequest request){
        List<Task> tasks = shipService.getAllTask();
        for (Task task:tasks){
            task.setShipname(shipService.getShip(task.getShip_id()).getShipname());
            task.setPartname(partService.getPart(task.getPart_id()).getPartname());
        }
        Log log = LogFactory.getLog(ProgressController.class);
        log.info(tasks.toString());
        request.setAttribute("workers", employeeService.getWorker());
        request.setAttribute("tasks", tasks);
        return "/admin/add/progressadd";
    }
    @RequestMapping(value = "/admin/progress",method = RequestMethod.POST)
    @ResponseBody
    public JSONObject progressAdd(@RequestBody Progress progress){
        JSONObject json=new JSONObject();
        List<Progress> progresses = progressService.getAllProgresses();
        for(Progress progress1:progresses){
            if(progress.getEmployee_id().equals(progress1.getEmployee_id())&&
                    progress.getTask_id().equals(progress1.getTask_id())) {
                json.put("message", "已存在");
                return json;
            }
        }
        progress.setIntime(new Date());
        json.put("message", progressService.AddProgress(progress));
        return json;
    }
    @RequestMapping(value = "/admin/progress/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public JSONObject delProgress(@PathVariable Integer id){
        JSONObject json=new JSONObject();
        json.put("message", progressService.deleteProgress(id));
        return json;
    }
    @RequestMapping(value = "/admin/progress/{id}",method = RequestMethod.GET)
    public String progressInfo(HttpServletRequest request,@PathVariable Integer id){
        Progress progress = progressService.getProgress(id);
        Log log = LogFactory.getLog(ProgressController.class);
        log.info(progress.toString());
        progress.setEmpname(employeeService.getEmployee(progress.getEmployee_id()).getEmpname());
        progress.setShipname(shipService.getShip(progress.getShip_id()).getShipname());
        progress.setPartname(partService.getPart(progress.getPart_id()).getPartname());
        request.setAttribute("h", progress);
        return "/admin/info/progressinfo";
    }
    @RequestMapping(value = "/admin/progress",method = RequestMethod.PUT)
    @ResponseBody
    public JSONObject updateProgress(@RequestBody Progress progress){
        JSONObject json=new JSONObject();
        json.put("message", progressService.updateProgress(progress));
        return json;
    }
    //生成user表excel
    @GetMapping(value = "/admin/getProgress")
    public String getUser(HttpServletResponse response) throws Exception{
        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet sheet = workbook.createSheet("统计表");
        ExcelUtils.createTitle(workbook,sheet);
        List<Progress> rows = progressService.getAllProgresses();

        //设置日期格式
        HSSFCellStyle style = workbook.createCellStyle();
        style.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));

        for (Progress progress : rows){
            progress.setEmpname(employeeService.getEmployee(progress.getEmployee_id()).getEmpname());
            progress.setShipname(shipService.getShip(progress.getShip_id()).getShipname());
            progress.setPartname(partService.getPart(progress.getPart_id()).getPartname());
        }
        //新增数据行，并且设置单元格数据
        int rowNum=1;
        for(Progress progress :rows){
            HSSFRow row = sheet.createRow(rowNum);
            row.createCell(0).setCellValue(rowNum);
            row.createCell(1).setCellValue(progress.getTask_id());
            row.createCell(2).setCellValue(progress.getEmployee_id());
            row.createCell(3).setCellValue(progress.getTaskinfo());
            row.createCell(4).setCellValue(progress.getTaskstatus());
            row.createCell(5).setCellValue(progress.getShipname());
            row.createCell(6).setCellValue(progress.getPartname());
            row.createCell(7).setCellValue(progress.getEmpmsg());
            HSSFCell cell1 = row.createCell(8);
            HSSFCell cell2 = row.createCell(9);
            cell1.setCellValue(progress.getIntime());
            cell2.setCellValue(progress.getOuttime());
            cell1.setCellStyle(style);
            cell2.setCellStyle(style);
            rowNum++;
        }

        Date now = new Date(); // 创建一个Date对象，获取当前时间
        SimpleDateFormat f = new SimpleDateFormat("yyMMddHHmmss");
        String fileName = "生产任务信息"+f.format(now)+".xls";

        //生成excel文件
        //ExcelUtils.buildExcelFile(fileName, workbook);

        //浏览器下载excel
        ExcelUtils.buildExcelDocument(fileName,workbook,response);

        return "download excel";
    }
}
