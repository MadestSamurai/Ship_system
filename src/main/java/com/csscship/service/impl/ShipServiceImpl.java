package com.csscship.service.impl;

import com.csscship.common.CommonService;
import com.csscship.dao.ShipMapper;
import com.csscship.entity.Ship;
import com.csscship.entity.Task;
import com.csscship.service.ShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ShipServiceImpl implements ShipService {
    @Autowired
    ShipMapper shipMapper;

    @Override
    public List<Ship> getAllShip() {
        return shipMapper.findAll(null);
    }

    @Override
    public List<Ship> getAllShip(Ship ship) {
        return shipMapper.findAll(ship);
    }

    @Override
    public List<Ship> getShipBySuperior(Integer superiorid) {
        return shipMapper.selectShipBySuperior(superiorid);
    }

    @Override
    public String delShip(Integer id) {
        shipMapper.delShipSupByShipId(id);
        return shipMapper.deletePartRelationByPrimaryKey(id)>0 && shipMapper.deleteByPrimaryKey(id)>0? CommonService.del_message_success:CommonService.del_message_error;
    }

    @Override
    public String addShip(Ship ship) {
        String message;
        if(shipMapper.findByName(ship.getShipname())!=null){
            message=CommonService.add_message_error2;
        }
        else{
            if (ship.getShipinfo()==null)
                ship.setShipinfo("无简介");
            List<String> list = ship.getParts();
            if(list==null || list.size() == 0) return CommonService.add_message_department_null_error;
            message= shipMapper.insert(ship)>0?CommonService.add_message_success:CommonService.add_message_error;
            for(String part : list){
                if(shipMapper.insertRelationByShipid(ship.getShipid(), Integer.parseInt(part)) <= 0)
                    return CommonService.add_message_error;
            }
        }
        return message;
    }

    @Override
    public Ship getShip(Integer id) {
        return shipMapper.selectByPrimaryKey(id);
    }

    @Override
    public String updateShip(Ship ship) {
        List<String> list = ship.getParts();
        if(list==null || list.size() == 0) return CommonService.upd_message_part_null_error;
        shipMapper.deletePartRelationByPrimaryKey(ship.getShipid());
        for(String part : list){
            if(shipMapper.insertRelationByShipid(ship.getShipid(), Integer.parseInt(part)) <= 0)
                return CommonService.upd_message_error;
        }
        return shipMapper.updateByPrimaryKey(ship)>0?CommonService.upd_message_success:CommonService.upd_message_error;
    }

    @Override
    public Object delShipSupById(Integer id) {
        return shipMapper.delShipSupById(id)>0?CommonService.del_message_success:CommonService.del_message_error;
    }

    @Override
    public Object insertShipSupRelation(Integer shipid, Integer supid) {
        return shipMapper.insertShipSupRelation(shipid, supid)>0?CommonService.del_message_success:CommonService.del_message_error;
    }

    @Override
    public Map<String, Integer> selectShipPartByTaskid(Integer taskid){
        return shipMapper.selectShipPartByTaskid(taskid);
    }

    @Override
    public List<Task> getAllTask(){
        return shipMapper.getAllTask();
    }
}
