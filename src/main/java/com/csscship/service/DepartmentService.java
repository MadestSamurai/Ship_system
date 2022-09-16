package com.csscship.service;

import com.csscship.entity.Department;

import java.util.List;

public interface DepartmentService {
    List<Department> getAll();
    List<String> getDeptByEmpid(Integer empid);
    Department getDepartment(Integer id);
    String insert(Department option);
    String deleteDepartment(Integer id);
    String updateDepartment(Department option);
}
