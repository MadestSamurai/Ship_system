package com.csscship.service;

import com.csscship.entity.Orderside;

import java.util.List;
import java.util.Map;

public interface OrdersideService {
    List<Orderside> getAllOrdersides(String name, String certId);
    List<Orderside> getAllOrdersides();
    String delOrderside(Integer id);
    Orderside getOrderside(Integer id);
    String updateOrderside(Orderside orderside);
    String addOrderside(Orderside orderside);
    Orderside findOrdersideByLoginId(Integer loginid);
    String updateAppointMent(Orderside orderside);
    Map<String,List> serrchInfo(String name, String type);
}
