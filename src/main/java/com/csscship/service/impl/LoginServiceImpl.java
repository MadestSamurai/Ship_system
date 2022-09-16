package com.csscship.service.impl;

import com.csscship.common.CommonService;
import com.csscship.dao.EmployeeMapper;
import com.csscship.dao.LoginMapper;
import com.csscship.dao.OrdersideMapper;
import com.csscship.entity.Employee;
import com.csscship.entity.Login;
import com.csscship.entity.Orderside;
import com.csscship.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    LoginMapper loginMapper;
    @Autowired
    OrdersideMapper ordersideMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Override
    public List<Login> findAllAdmin(String username) {
        return loginMapper.findAllAdmin(username);
    }

    @Override
    public String addAmin(Login login) {
        String message;
        if(loginMapper.findByUsername(login.getUsername())!=null){
            message=CommonService.add_message_error2;
        }
        else{
            message=loginMapper.insertAdmin(login)>0? CommonService.add_message_success:CommonService.add_message_error;
        }
        return message;
    }

    @Override
    public String updateAdmin(Login login) {
        String message;
        if(loginMapper.findByUsername(login.getUsername())!=null){
            message=CommonService.add_message_error2;
        }
        else{
            message=loginMapper.updateByPrimaryKeySelective(login)>0? CommonService.upd_message_success:CommonService.upd_message_error;
        }
        return message;
    }

    @Override
    public String delAdmin(Integer id) {
        return loginMapper.deleteByPrimaryKey(id)>0?CommonService.del_message_success:CommonService.del_message_error;
    }

    @Override
    public Login getAdmin(Integer id) {
        return loginMapper.selectByPrimaryKey(id);
    }

    @Override
    public String login(Login  login) {
        String message="";
        Login login2=loginMapper.findByUsername(login.getUsername());
        if(login2!=null){
            if(!login2.getPassword().equals(login.getPassword())){
                message="密码错误";
            }
            else{
                login.setId(login2.getId());
                login.setRole(login2.getRole());
                message="登录成功"+login2.getRole();
            }
        }
        else{
            message="用户名不存在";
        }
        return message;
    }

    @Override
    public String regist(Login login) {
        String message;
        Employee employee = employeeMapper.getEmployeeByCertId(login.getCertId());
        Orderside orderside = ordersideMapper.findOrdersideByCertId(login.getCertId());
        if(employee !=null){
            if(employee.getLoginid()==null){
                login.setRole(2);
                loginMapper.insert(login);
                employee.setLoginid(loginMapper.findByUsername(login.getUsername()).getId());
                employeeMapper.updateByPrimaryKeySelective(employee);
                message="注册成功";
            }
            else {
                message="该证件号已被注册";
            }

        }
        else if(orderside !=null){
            if(orderside.getLoginid()==null){
                login.setRole(3);
                loginMapper.insert(login);
                orderside.setLoginid(loginMapper.findByUsername(login.getUsername()).getId());
                ordersideMapper.updateByPrimaryKeySelective(orderside);
                message="注册成功";
            }
            else {
                message="该证件号已被注册";
            }
        }
        else if(loginMapper.findByUsername(login.getUsername())!=null){
            message="该用户名已被注册";
        }
        else if(loginMapper.findByUsername(login.getUsername())==null&&(login.getCertId()==null||login.getCertId().trim().equals(""))){
            login.setRole(1);
            loginMapper.insert(login);
            message="注册成功";
        }
        else {
            message="该证件信息未入库，不能注册该员工";
        }
        return message;
    }
}
