package com.ischoolbar.programmer.service;

import java.util.List;
import java.util.Map;

import com.ischoolbar.programmer.entity.Schedule;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

public interface ScheduleService {

	EasyUIDataGridResult list(Map<String, Object> queryMap);

	E3Result add(Schedule schedule);

	Integer delete(Long id);

	List<Schedule> findByDate(String today);


}
