package com.csscship.dao;

import com.csscship.entity.Part;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface PartMapper {
    Integer insert(Part part);

    Integer deleteById(@Param("partid")Integer id);
    Integer deleteShipRelationById(@Param("partid")Integer partid);

    Integer updateById(Part part);
    List<Part> selectAll();
    Part getPart(@Param("partid")Integer partid);
    List<Part> getPartsByShipid(@Param("shipid")Integer shipid);
}
