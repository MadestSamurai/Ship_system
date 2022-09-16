package com.csscship.service.impl;

import com.csscship.common.CommonService;
import com.csscship.dao.*;
import com.csscship.entity.Employee;
import com.csscship.entity.Login;
import com.csscship.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    OrdersideMapper ordersideMapper;
    @Autowired
    LoginMapper loginMapper;
    @Autowired
    PartMapper partMapper;
    @Override
    public List<Employee> getAllEmployee() {
        return employeeMapper.getAll("","",null);
    }

    @Override
    public List<Employee> getAllEmployee(String empname, String certId) {
        return employeeMapper.getAll(empname,certId,null);
    }

    @Override
    public List<Employee> getAllEmployee(String empname, String certId, Integer superior) {
        return employeeMapper.getAll(empname,certId,superior);
    }

    @Override
    public List<Employee> getExpert() {
        return employeeMapper.getExpert();
    }

    @Override
    public List<Employee> getWorker() {
        return employeeMapper.getWorker();
    }

    @Override
    public String delEmployee(Integer id) {
            return employeeMapper.deleteDeptRelationByPrimaryKey(id)>0 &&
                    employeeMapper.deleteByPrimaryKey(id)>0?
                    CommonService.del_message_success:CommonService.del_message_error;
    }

    @Override
    public String addEmployee(Employee employee) {
        String message="";
        if (employee.getExpert()==0 || employee.getSuperior()==null) employee.setSuperior(-1);
        if(employeeMapper.getEmployeeByCertId(employee.getCertId())!=null|| ordersideMapper.findOrdersideByCertId(employee.getCertId())!=null){
            message="该身份证已被注册或使用";
        }
        else {
            if (employee.getEmpinfo()==null || employee.getEmpinfo()=="")
                employee.setEmpinfo("这人很懒，什么都没有写");
            List<String> list = employee.getDepartments();
            if(list==null || list.size() == 0) return CommonService.add_message_department_null_error;
            message= employeeMapper.insert(employee)>0?CommonService.add_message_success:CommonService.add_message_error;
            for(String dept : list){
                if(employeeMapper.insertRelationByEmpid(employee.getEmpid(), Integer.parseInt(dept)) <= 0)
                    return CommonService.add_message_error;
            }
        }
        return message;
    }

    @Override
    public Employee getEmployee(Integer id) {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        Login login=loginMapper.selectByPrimaryKey(employee.getLoginid());
        if(login!=null){
            employee.setUsername(login.getUsername());
            employee.setPassword(login.getPassword());
        }
        return employee;
    }

    @Override
    public String upEmployee(Employee employee) {
        if (employee.getEmpinfo()==null || employee.getEmpinfo()=="")
            employee.setEmpinfo("这人很懒，什么都没有写");
        if (employee.getExpert()==0 || employee.getSuperior()==null) employee.setSuperior(-1);
        Login login=loginMapper.selectByPrimaryKey(employee.getLoginid());
        List<String> list = employee.getDepartments();
        if(list==null || list.size() == 0) return CommonService.upd_message_department_null_error;
        employeeMapper.deleteDeptRelationByPrimaryKey(employee.getEmpid());
        for(String dept : list){
            if(employeeMapper.insertRelationByEmpid(employee.getEmpid(), Integer.parseInt(dept)) <= 0)
                return CommonService.upd_message_error;
        }
        if(login==null){
            return employeeMapper.updateByPrimaryKey(employee)>0?CommonService.upd_message_success2:CommonService.upd_message_error;
        }
        else {
            login.setUsername(employee.getUsername());
            login.setPassword(employee.getPassword());
            login.setId(employee.getLoginid());
            return (employeeMapper.updateByPrimaryKey(employee)>0
                    &&loginMapper.updateByPrimaryKey(login)>0
            ) ?CommonService.upd_message_success:CommonService.upd_message_error;
        }
    }

    @Override
    public String upEmpSuperior(Employee employee) {
        return employeeMapper.updateByPrimaryKeySelective(employee)>0?CommonService.upd_message_success:CommonService.upd_message_error;
    }

    @Override
    public Employee getEmployeeByLoginId(Integer loginid) {
        return employeeMapper.getEmployeeByLoginId(loginid);
    }

    @Override
    public List<Employee> getEmployeeByDeptid(Integer deptid) {
        return employeeMapper.getEmployeeByDeptid(deptid);
    }

    @Override
    public List<Employee> getSuperiorByShipid(Integer shipid) {
        return employeeMapper.getSuperiorByShipid(shipid);
    }
}
