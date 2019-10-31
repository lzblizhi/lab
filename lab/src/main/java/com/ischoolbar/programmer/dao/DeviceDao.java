package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import com.ischoolbar.programmer.entity.Device;

public interface DeviceDao {
    List<Device> getList(Map<String, Object> queryMap);

    Integer add(Device device);

    Integer delete(Long id);//删除设备

	Integer edit(Device device);//更新
	
	public Device findByname(String name);
}
