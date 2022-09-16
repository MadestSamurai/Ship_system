package com.csscship.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class Progress {
    private Integer id;

    private Integer task_id;

    private Integer employee_id;

    private Integer taskstatus;

    private String taskinfo;
    private Date intime;
    private Date outtime;
    private String empmsg;

    private Integer part_id;
    private Integer ship_id;

    private String partname;
    private String shipname;
    private String empname;
}