package com.csscship.service;

import com.csscship.entity.Employee;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
    List<Employee> getAllEmployee();
    List<Employee> getAllEmployee(String empname, String certId);
    List<Employee> getAllEmployee(String empname, String certId, Integer superior);
    List<Employee> getExpert();

    List<Employee> getWorker();

    String delEmployee(Integer id);
    String addEmployee(Employee employee);
    Employee getEmployee(Integer id);
    String upEmployee(Employee employee);

    String upEmpSuperior(Employee employee);

    Employee getEmployeeByLoginId(Integer loginid);
    List<Employee> getEmployeeByDeptid(Integer deptid);

    List<Employee> getSuperiorByShipid(Integer shipid);
}
