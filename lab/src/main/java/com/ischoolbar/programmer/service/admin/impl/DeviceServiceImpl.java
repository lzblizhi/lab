package com.ischoolbar.programmer.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ischoolbar.programmer.dao.DeviceDao;
import com.ischoolbar.programmer.entity.Device;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;
import com.ischoolbar.programmer.util.IDUtils;

@Service
public class DeviceServiceImpl implements com.ischoolbar.programmer.service.DeviceService {

    @Autowired
    DeviceDao deviceDao;

    //设备列表
    @Override
    public EasyUIDataGridResult getList(Map<String, Object> queryMap) {
        PageHelper.startPage((Integer)queryMap.get("page"), (Integer)queryMap.get("rows"));
		List<Device> list = deviceDao.getList(queryMap);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(new PageInfo<Device>(list).getTotal());
		return result;
    }

    //新增设备
    @Override
    public E3Result add(Device device) {
        Long id = IDUtils.genId();
        device.setId(id);
        Integer integer = deviceDao.add(device);
        if (integer > 0){
            return E3Result.build(200, "新增成功");
        }
        return E3Result.build(400,"新增失败!");
    }

    //删除设备
    @Override
    public Integer delete(Long id) {
        Integer integer = deviceDao.delete(id);
        return integer;
    }

    //更新设备
    @Override
    public E3Result edit(Device device) {
        Integer integer = deviceDao.edit(device);
        if (integer != 0 && integer != null){
            return E3Result.build(200, "更新成功");
        }
        return E3Result.build(400, "更新失败");
    }
    
    public Device findByname(String name){
    	Device device = deviceDao.findByname(name);
    	return device;
    }
}
