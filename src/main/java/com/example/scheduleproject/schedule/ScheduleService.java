package com.example.scheduleproject.schedule;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
@RequiredArgsConstructor
public class ScheduleService {

    private final ScheduleMapper scheduleMapper;


    public void insertSchedule(Schedule schedule) {
        scheduleMapper.save(schedule);
    }
}
