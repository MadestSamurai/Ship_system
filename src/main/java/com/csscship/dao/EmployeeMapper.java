package com.csscship.dao;

import com.csscship.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    List<Employee> getAll(@Param("empname")String empname, @Param("certId")String certId, @Param("superior")Integer superior);
    int deleteByPrimaryKey(Integer empid);
    int deleteDeptRelationByPrimaryKey(Integer empid);

    int insert(Employee record);

    int insertSelective(Employee record);

    Employee selectByPrimaryKey(Integer empid);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
    Employee getEmployeeByCertId(@Param("certId")String certId);
    List<Employee> getEmployeeByDeptid(@Param("deptid")Integer deptid);
    List<Employee> getSuperiorByShipid(@Param("shipid")Integer shipid);
    Employee getEmployeeByLoginId(@Param("loginid")Integer loginid);
    List<Employee> getEmployeeByName(@Param("empname")String empname);

    int insertRelationByEmpid(@Param("empid")Integer empid, @Param("deptid")Integer deptid);
    List<Employee> getExpert();
    List<Employee> getWorker();
}