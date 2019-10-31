package com.ischoolbar.programmer.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ischoolbar.programmer.dao.DevOrderDao;
import com.ischoolbar.programmer.entity.DevOrder;
import com.ischoolbar.programmer.service.DevOrderService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

@Service
public class DevOrderServiceImpl implements DevOrderService {

	@Autowired 
	DevOrderDao devBorrowDao;
	
	@Override
	public E3Result add(DevOrder deviceBorrow) {
		// TODO Auto-generated method stub	
		if(devBorrowDao.add(deviceBorrow) < 0){
			return E3Result.build(400, "申请失败!请联系管理员!");
		}
		return E3Result.build(200, "申请成功");
	}

	//获取列表
	@Override
	public EasyUIDataGridResult getList(Map<String, Object> query) {
		PageHelper.startPage((Integer)query.get("page"), (Integer)query.get("rows"));
		List<DevOrder> list = devBorrowDao.getList(query);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(new PageInfo<DevOrder>(list).getTotal());
		return result;
	}

	//更新
	@Override
	public Integer edit(Long id) {
		// TODO Auto-generated method stub
		Integer total = devBorrowDao.edit(id);
		return total;
	}

	@Override
	public Integer delete(Long id) {
		// TODO Auto-generated method stub
		Integer total = devBorrowDao.delete(id);
		return total;
	}

	@Override
	public EasyUIDataGridResult myList(Map<String, Object> query) {
		// TODO Auto-generated method stub
		PageHelper.startPage((Integer)query.get("page"), (Integer)query.get("rows"));
		List<DevOrder> list = devBorrowDao.myList(query);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(new PageInfo<DevOrder>(list).getTotal());
		return result;
	}

	@Override
	public DevOrder findById(Long id) {
		// TODO Auto-generated method stub
		DevOrder order = devBorrowDao.findById(id);
		return order;
	}

	@Override
	public Integer retEdit(Long id) {
		// TODO Auto-generated method stub
		devBorrowDao.retEdit(id);
		return null;
	}

}
