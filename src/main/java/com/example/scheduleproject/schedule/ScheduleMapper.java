package com.example.scheduleproject.schedule;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
interface ScheduleRepository extends JpaRepository<Schedule, Integer> {

}
