package com.csscship.utils;

import com.csscship.dao.EmployeeMapper;
import com.csscship.dao.OrdersideMapper;
import com.csscship.entity.Employee;
import com.csscship.entity.Orderside;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrdersideEmployeeutils {
    public  static Map<String,List<Integer>> getEmployeeIdsAndOrdersideIds(String employeename, EmployeeMapper employeeMapper, String ordersidename, OrdersideMapper ordersideMapper){
        Map<String,List<Integer>> map=new HashMap<>();
        Integer employeeid=99999999;
        List<Integer> employeeids=new ArrayList<>();
        if(employeename!="" &&employeename!=null){
            employeename=employeename.trim();
            List<Employee> employeeList = employeeMapper.getEmployeeByName(employeename);
            if(employeeList !=null){
                employeeids.add(employeeid);
                for(Employee employee : employeeList){
                    employeeid= employee.getEmpid();
                    employeeids.add(employeeid);
                }
            }
        }
        else{
            employeeids=null;
        }
        Integer ordersideid=99999999;
        List<Integer> ordersideids=new ArrayList<>();
        if(ordersidename!="" &&ordersidename!=null){
            ordersidename=ordersidename.trim();
            List<Orderside> ordersideList = ordersideMapper.getOrdersideByName(ordersidename);
            if(ordersideList !=null){
                ordersideids.add(ordersideid);
                for(Orderside orderside : ordersideList){
                    ordersideid= orderside.getId();
                    ordersideids.add(ordersideid);
                }
            }
        }
        else{
            ordersideids=null;
        }
        map.put("ordersideids",ordersideids);
        map.put("employeeids",employeeids);
        return map;
    }
    public  static List<Integer> getOrdersideIds(String ordersidename, OrdersideMapper ordersideMapper){
        Integer ordersideid=99999999;
        List<Integer> ordersideids=new ArrayList<>();
        if(ordersidename!="" &&ordersidename!=null){
            ordersidename=ordersidename.trim();
            List<Orderside> ordersideList = ordersideMapper.getOrdersideByName(ordersidename);
            if(ordersideList !=null){
                ordersideids.add(ordersideid);
                for(Orderside orderside : ordersideList){
                    ordersideid= orderside.getId();
                    ordersideids.add(ordersideid);
                }
            }
        }
        else{
            ordersideids=null;
        }
        return ordersideids;
    }
    public static List<Integer> getPartIds(String ids){
        List<Integer> integerList=new ArrayList<>();
        String[] idarray=ids.split(",");
        if (idarray.length==0){
            integerList.add(Integer.parseInt(ids));
            return integerList;
        }else{
        integerList.clear();
            for(String id:idarray){
                integerList.add(Integer.parseInt(id));
            }
            return integerList;
        }

    }
}
