package com.csscship.service.impl;

import com.csscship.common.CommonService;
import com.csscship.dao.DepartmentMapper;
import com.csscship.entity.Department;
import com.csscship.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;
    @Override
    public List<Department> getAll() {
        return departmentMapper.selectAll();
    }

    @Override
    public List<String> getDeptByEmpid(Integer empid) {
        return departmentMapper.getDepartmentByEmpid(empid);
    }

    @Override
    public Department getDepartment(Integer id) {
        return departmentMapper.getDepartment(id);
    }

    @Override
    public String insert(Department option) {
        return departmentMapper.insert(option)>0? CommonService.add_message_success:CommonService.add_message_error;
    }

    @Override
    public String deleteDepartment(Integer id) {
        departmentMapper.deleteEmpRelationById(id);
        return departmentMapper.deleteById(id)>0?
                CommonService.del_message_success:CommonService.del_message_error;
    }

    @Override
    public String updateDepartment(Department option) {
        return departmentMapper.updateById(option)>0?CommonService.upd_message_success:CommonService.upd_message_error;
    }
}
