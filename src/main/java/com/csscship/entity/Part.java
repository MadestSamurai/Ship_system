package com.csscship.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;

@Getter
@Setter
@ToString
public class Part {

  private long partid;
  private String partname;
  private String parttype;
  private BigDecimal partprice;

  private Integer taskid;
}
