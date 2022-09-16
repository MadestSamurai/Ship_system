package com.csscship.dao;

import com.csscship.entity.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {
    Integer insert(Department department);

    Integer deleteById(@Param("deptid")Integer deptid);
    Integer deleteEmpRelationById(@Param("deptid")Integer deptid);

    Integer updateById(Department department);

    List<Department> selectAll();
    Department getDepartment(@Param("deptid")Integer deptid);
    List<Department> getDepartmentByName(@Param("deptname")String deptname);
    List<String> getDepartmentByEmpid(@Param("empid")Integer empid);
}
