package com.example.scheduleproject.schedule;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
@RequiredArgsConstructor
public class ScheduleService {
    public void insertSchedule() {
        // 일정 추가
    }
}
