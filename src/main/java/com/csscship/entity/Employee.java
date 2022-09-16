package com.csscship.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@ToString
public class Employee {
    private Integer empid;

    private String empname;

    private Integer age;

    private Integer sex;

    private String address;
    private Integer loginid;
    private List<String> departments;
    private String certId;
    private String empinfo;
    private Integer expert;
    private Integer superior;
    private String supname;
    /***/
    private String username;
    private String password;
    private Integer shipsupid;
}