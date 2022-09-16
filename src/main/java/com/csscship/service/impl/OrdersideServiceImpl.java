package com.csscship.service.impl;

import com.csscship.common.CommonService;
import com.csscship.dao.*;
import com.csscship.entity.Orderside;
import com.csscship.entity.Login;
import com.csscship.service.OrdersideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrdersideServiceImpl implements OrdersideService {
    @Autowired
    OrdersideMapper ordersideMapper;
    @Autowired
    LoginMapper loginMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    ShipMapper shipMapper;

    @Override
    public List<Orderside> getAllOrdersides(String name, String certId) {
        return ordersideMapper.findAll(name, certId);
    }

    @Override
    public List<Orderside> getAllOrdersides() {
        return ordersideMapper.findAll("", "");
    }

    @Override
    public String delOrderside(Integer id) {
        return ordersideMapper.deleteByPrimaryKey(id) > 0 ? CommonService.del_message_success : CommonService.del_message_error;
    }

    @Override
    public Orderside getOrderside(Integer id) {
        Orderside orderside = ordersideMapper.selectByPrimaryKey(id);
        Login login = loginMapper.selectByPrimaryKey(orderside.getLoginid());
        if (login != null) {
            orderside.setUsername(login.getUsername());
            orderside.setPassword(login.getPassword());
        }
        return orderside;
    }

    @Override
    public String updateOrderside(Orderside orderside) {
        Login login = loginMapper.selectByPrimaryKey(orderside.getLoginid());
        if (login == null) {
            return ordersideMapper.updateByPrimaryKey(orderside) > 0 ? CommonService.upd_message_success2 : CommonService.upd_message_error;
        } else {
            login.setUsername(orderside.getUsername());
            login.setPassword(orderside.getPassword());
            login.setId(orderside.getLoginid());
            return (ordersideMapper.updateByPrimaryKey(orderside) > 0 && loginMapper.updateByPrimaryKey(login) > 0) ? CommonService.upd_message_success : CommonService.upd_message_error;
        }

    }

    @Override
    public String addOrderside(Orderside orderside) {
        String message = "";
        if (ordersideMapper.findOrdersideByCertId(orderside.getCertId()) != null) {
            message = CommonService.add_message_error2;
        } else {
            message = ordersideMapper.insert(orderside) > 0 ? CommonService.add_message_success : CommonService.add_message_error;
        }
        return message;
    }

    @Override
    public Orderside findOrdersideByLoginId(Integer loginid) {
        return ordersideMapper.findOrdersideByLoginId(loginid);
    }

    @Override
    public String updateAppointMent(Orderside orderside) {
        return ordersideMapper.updateByPrimaryKeySelective(orderside) > 0 ? CommonService.upd_message_success : CommonService.upd_message_error;
    }

    @Override
    public Map<String, List> serrchInfo(String name, String type) {
        Map<String, List> map = new HashMap<>();
        List list = null;
        if ("employee".equals(type)) {
            list = employeeMapper.getEmployeeByName(name);
            map.put(type, list);

        } else if ("department".equals(type)) {
            list = departmentMapper.getDepartmentByName(name);
            map.clear();
            map.put(type, list);
        } else {
            list = shipMapper.getShipByName(name);
            map.clear();
            map.put(type, list);
        }
        return map;
    }
}
