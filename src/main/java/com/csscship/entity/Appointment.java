package com.csscship.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.Date;
@Getter
@Setter
@ToString
public class Appointment {
    private Integer id;

    private Integer ordersideid;
    private String ordersidename;

    private Integer employeeid;
    private String employeename;
    private String department;
    private Date time;
    private BigDecimal expenses;

}