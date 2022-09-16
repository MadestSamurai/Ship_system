package com.csscship.service;

import com.csscship.entity.Progress;

import java.util.List;

public interface ProgressService {
    List<Progress> getAllProgresses(String intime, Integer taskid, Integer empid);

    List<Progress> getAllProgresses(String intime, Integer taskid);

    List<Progress> getAllProgresses(String intime);
    List<Progress> getAllProgresses();
    String AddProgress(Progress progress);
    String deleteProgress(Integer id);
    Progress getProgress(Integer id);
    String updateProgress(Progress progress);
    List<Progress> getEmployeeMessage(Integer empid);
}
