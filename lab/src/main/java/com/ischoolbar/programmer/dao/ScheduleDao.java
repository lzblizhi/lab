package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import com.ischoolbar.programmer.entity.Schedule;

public interface ScheduleDao {

	List<Schedule> list(Map<String, Object> queryMap);

	Integer add(Schedule schedule);

	Integer delete(Long id);

	List<Schedule> findByDate(String today);

}
