package com.csscship.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@ToString
public class Ship {
    private Integer shipid;

    private String shipname;

    private Integer shiptype;
    private BigDecimal price;
    private Integer shipstatus;
    private String shipinfo;

    private List<String> parts;
    private List<String> superiors;
    private List<Part> partList;
}