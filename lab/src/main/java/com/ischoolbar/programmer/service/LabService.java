package com.ischoolbar.programmer.service;

import java.util.Map;

import com.ischoolbar.programmer.entity.Lab;
import com.ischoolbar.programmer.entity.LabOrder;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

public interface LabService {
	//获取列表
	EasyUIDataGridResult findList(Map<String, Object> queryMap);
	
	//添加
	E3Result addLab(Lab lab);

	//更新
	E3Result edit(Lab lab);

	Integer delete(Long id);

	Lab findByname(String name);

}
