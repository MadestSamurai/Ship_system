package com.csscship.service;

import com.csscship.entity.Ship;
import com.csscship.entity.Task;

import java.util.List;
import java.util.Map;

public interface ShipService {
    List<Ship> getAllShip();
    List<Ship> getAllShip(Ship ship);

    List<Ship> getShipBySuperior(Integer superiorid);

    String delShip(Integer id);
    String addShip(Ship ship);
    Ship getShip(Integer id);
    String updateShip(Ship ship);

    Object delShipSupById(Integer id);

    Object insertShipSupRelation(Integer shipid, Integer supid);

    Map<String, Integer> selectShipPartByTaskid(Integer taskid);

    List<Task> getAllTask();
}
