package com.csscship;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.csscship.dao")
public class ShipApp {
    public static void main(String[] args){
        SpringApplication.run(ShipApp.class,args);
    }
}
