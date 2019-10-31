package com.ischoolbar.programmer.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ischoolbar.programmer.dao.ScheduleDao;
import com.ischoolbar.programmer.entity.Schedule;
import com.ischoolbar.programmer.service.ScheduleService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;
import com.ischoolbar.programmer.util.IDUtils;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	ScheduleDao scheduleDao;
	
	@Override
	public EasyUIDataGridResult list(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		PageHelper.startPage((Integer)queryMap.get("page"), (Integer)queryMap.get("rows"));

		List<Schedule> list = scheduleDao.list(queryMap);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(new PageInfo<Schedule>(list).getTotal());
		return result;
	}

	@Override
	public E3Result add(Schedule schedule) {
		// TODO Auto-generated method stub
		schedule.setId(IDUtils.genId());
		schedule.setStatus(0);
		Integer total = scheduleDao.add(schedule);
		if (total > 0) {
			return E3Result.build(200, "新建成功");
		}
		return E3Result.build(400, "新建失败");
	}

	@Override
	public Integer delete(Long id) {
		// TODO Auto-generated method stub
		Integer total = scheduleDao.delete(id);
		return total;
	}

	@Override
	public List<Schedule> findByDate(String today) {
		// TODO Auto-generated method stub
		List<Schedule> list = scheduleDao.findByDate(today);
		return list;
	}

}
