package com.ischoolbar.programmer.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ischoolbar.programmer.dao.LabOrderDao;
import com.ischoolbar.programmer.entity.DevOrder;
import com.ischoolbar.programmer.entity.LabOrder;
import com.ischoolbar.programmer.service.LabOrderService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

@Service
public class LabOrderServiceImpl implements LabOrderService {

	@Autowired
	LabOrderDao labOrderDao;
	
	@Override
	public EasyUIDataGridResult getList(Map<String, Object> query) {
		// TODO Auto-generated method stub
		PageHelper.startPage((Integer)query.get("page"), (Integer)query.get("rows"));
		List<LabOrder> list = labOrderDao.getList(query);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(new PageInfo<LabOrder>(list).getTotal());
		return result;
	}

	@Override
	public LabOrder findById(Long id) {
		// TODO Auto-generated method stub
		LabOrder order = labOrderDao.findById(id);
		return order;
	}

	//点击同意
	@Override
	public Integer edit(Long id) {
		// TODO Auto-generated method stub
		Integer total = labOrderDao.edit(id);
		return total;
	}

	@Override
	public Integer delete(Long id) {
		// TODO Auto-generated method stub
		Integer total = labOrderDao.delete(id);
		return total;
	}

	@Override
	public Integer retEdit(Long id) {
		// TODO Auto-generated method stub
		Integer retEdit = labOrderDao.retEdit(id);
		return retEdit;
	}

	@Override
	public EasyUIDataGridResult getMyList(Map<String, Object> query) {
		// TODO Auto-generated method stub
		PageHelper.startPage((Integer)query.get("page"), (Integer)query.get("rows"));
		List<LabOrder> myList = labOrderDao.getMyList(query);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(myList);
		result.setTotal(new PageInfo<LabOrder>(myList).getTotal());
		return result;
	}

	@Override
	public Integer add(LabOrder labOrder) {
		// TODO Auto-generated method stub
		Integer total = labOrderDao.add(labOrder);
		return total;
	}

}
