package com.example.scheduleproject.schedule;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Schedule {
    private int id;
    private String title;
    private String description;
    private LocalDateTime inserted;
}
