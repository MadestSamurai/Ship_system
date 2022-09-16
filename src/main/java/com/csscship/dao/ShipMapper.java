package com.csscship.dao;

import com.csscship.entity.Ship;
import com.csscship.entity.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ShipMapper {
    int deleteByPrimaryKey(Integer id);
    int deletePartRelationByPrimaryKey(Integer shipid);

    int updateShipStatus(Ship ship);
    int insert(Ship record);

    int insertSelective(Ship record);

    Ship selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Ship record);

    int updateByPrimaryKey(Ship record);
    List<Ship> findAll(Ship ship);
    Ship findByName(@Param("shipname")String name);
    List<Ship> getShipByName(@Param("shipname")String name);

    int insertRelationByShipid(@Param("shipid")Integer shipid, @Param("partid")Integer partid);
    int insertShipSupRelation(@Param("shipid")Integer shipid, @Param("superiorid")Integer superiorid);
    List<Ship> selectShipBySuperior(@Param("superiorid")Integer superiorid);

    int delShipSupById(Integer id);
    int delShipSupByShipId(Integer id);
    Map<String, Integer> selectShipPartByTaskid(Integer taskid);

    List<Task> getAllTask();
}