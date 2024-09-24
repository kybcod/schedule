package com.example.scheduleproject.schedule;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleMapper {

    @Insert("""
            INSERT INTO schedule (title, description, inserted)
            VALUES (#{title}, #{description}, #{inserted})
            """)
    void save(Schedule schedule);
}
