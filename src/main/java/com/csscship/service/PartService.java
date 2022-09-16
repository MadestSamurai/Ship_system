package com.csscship.service;

import com.csscship.entity.Part;

import java.util.List;

public interface PartService {
    List<Part> getAll();
    List<Part> getPartByShipid(Integer shipid);
    Part getPart(Integer id);
    String insert(Part part);
    String deletePart(Integer id);
    String updatePart(Part part);
}
