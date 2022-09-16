package com.csscship.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Task {
    private Integer taskid;

    private Integer ship_id;
    private Integer part_id;

    private String shipname;
    private String partname;
}
