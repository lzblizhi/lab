package com.ischoolbar.programmer.service;

import java.util.Map;

import com.ischoolbar.programmer.entity.DevOrder;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

public interface DevOrderService {

	E3Result add(DevOrder deviceBorrow);

	EasyUIDataGridResult getList(Map<String, Object> query);

	Integer edit(Long id);

	Integer delete(Long id);

	EasyUIDataGridResult myList(Map<String, Object> query);
	
	public DevOrder findById(Long id);

	Integer retEdit(Long id);

}
