package com.ischoolbar.programmer.service;

import java.util.Map;

import com.ischoolbar.programmer.entity.Device;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

public interface DeviceService {

	EasyUIDataGridResult getList(Map<String, Object> queryMap);

	E3Result add(Device device);

	E3Result edit(Device device);

	Integer delete(Long id);
	
	public Device findByname(String name);
}
