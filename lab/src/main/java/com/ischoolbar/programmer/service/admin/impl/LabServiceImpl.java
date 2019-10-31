package com.ischoolbar.programmer.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ischoolbar.programmer.dao.LabDao;
import com.ischoolbar.programmer.entity.Lab;
import com.ischoolbar.programmer.entity.LabOrder;
import com.ischoolbar.programmer.service.LabService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;
import com.ischoolbar.programmer.util.IDUtils;

@Service
public class LabServiceImpl implements LabService{

	@Autowired
	LabDao labDao;
	@Override
	public EasyUIDataGridResult findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		PageHelper.startPage((Integer)queryMap.get("page"), (Integer)queryMap.get("rows"));
		List<Lab> list = labDao.findList(queryMap);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(new PageInfo<Lab>(list).getTotal());
		return result;
	}
	//添加
	@Override
	public E3Result addLab(Lab lab) {
		// TODO Auto-generated method stub
		Long id = IDUtils.genId();
		lab.setId(id);
		Integer ret = labDao.addLab(lab);
		if (ret > 0) {
			return E3Result.build(200, "添加成功");
		}
		return E3Result.build(400, "添加失败");
	}
	//更新
	@Override
	public E3Result edit(Lab lab) {
		// TODO Auto-generated method stub
		Integer ret = labDao.edit(lab);
		if (ret > 0) {
			return E3Result.build(200, "更新成功");
		}
		return E3Result.build(400, "更新失败");
	}
	@Override
	public Integer delete(Long id) {
		// TODO Auto-generated method stub
		Integer total = labDao.delete(id);
		return total;
	}
	@Override
	public Lab findByname(String name) {
		// TODO Auto-generated method stub
		Lab lab = labDao.findByName(name);
		return lab;
	}
}
