package com.csscship.service.impl;

import com.csscship.common.CommonService;
import com.csscship.dao.PartMapper;
import com.csscship.entity.Part;
import com.csscship.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PartServiceImpl implements PartService {
    @Autowired
    PartMapper partMapper;
    @Override
    public List<Part> getAll() {
        return partMapper.selectAll();
    }

    @Override
    public List<Part> getPartByShipid(Integer shipid) {
        return partMapper.getPartsByShipid(shipid);
    }

    @Override
    public String insert(Part part) {
        return partMapper.insert(part)>0? CommonService.add_message_success:CommonService.add_message_error;
    }

    @Override
    public String deletePart(Integer id) {
        partMapper.deleteShipRelationById(id);
        return partMapper.deleteById(id)>0?CommonService.del_message_success:CommonService.del_message_error;
    }

    @Override
    public String updatePart(Part part) {
        return partMapper.updateById(part)>0?CommonService.upd_message_success:CommonService.upd_message_error;
    }

    @Override
    public Part getPart(Integer id) {
        return partMapper.getPart(id);
    }
}
