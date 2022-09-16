package com.csscship.service.impl;

import com.csscship.common.CommonService;
import com.csscship.dao.ProgressMapper;
import com.csscship.dao.OrdersideMapper;
import com.csscship.entity.Progress;
import com.csscship.service.ProgressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProgressServiceImpl implements ProgressService {
    @Autowired
    ProgressMapper progressMapper;
    @Autowired
    OrdersideMapper ordersideMapper;

    @Override
    public List<Progress> getAllProgresses(String intime, Integer taskid, Integer empid) {
        return progressMapper.findAll(intime, taskid, empid);
    }

    @Override
    public List<Progress> getAllProgresses(String intime, Integer taskid) {
        return progressMapper.findAll(intime, taskid ,null);
    }

    @Override
    public List<Progress> getAllProgresses(String intime) {
        return progressMapper.findAll(intime, null, null);
    }

    @Override
    public List<Progress> getAllProgresses() {
        return progressMapper.findAll(null,null, null);
    }

    @Override
    public String AddProgress(Progress progress) {
        return progressMapper.insert(progress)>0? CommonService.add_message_success:CommonService.add_message_error;
    }

    @Override
    public String deleteProgress(Integer id) {
        return progressMapper.deleteByPrimaryKey(id)>0?CommonService.del_message_success:CommonService.add_message_error;
    }

    @Override
    public Progress getProgress(Integer id) {
        return progressMapper.selectByPrimaryKey(id);
    }

    @Override
    public String updateProgress(Progress progress) {
        return progressMapper.updateByPrimaryKeySelective(progress)>0?CommonService.upd_message_success:CommonService.upd_message_error;
    }

    @Override
    public List<Progress> getEmployeeMessage(Integer empid) {
        return progressMapper.selectByEmployeeId(empid);
    }
}
