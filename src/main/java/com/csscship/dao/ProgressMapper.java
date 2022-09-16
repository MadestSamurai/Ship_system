package com.csscship.dao;

import com.csscship.entity.Progress;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProgressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Progress record);

    int insertSelective(Progress record);

    Progress selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Progress record);

    int updateByPrimaryKey(Progress record);
    List<Progress> findAll(String intime, Integer taskid,Integer empid);
    List<Progress> selectByEmployeeId(@Param("empid")Integer empid);
}