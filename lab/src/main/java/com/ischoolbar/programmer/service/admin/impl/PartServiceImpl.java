package com.ischoolbar.programmer.service.admin.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ischoolbar.programmer.dao.PartDao;
import com.ischoolbar.programmer.entity.Lab;
import com.ischoolbar.programmer.entity.Part;
import com.ischoolbar.programmer.service.PartService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;
import com.ischoolbar.programmer.util.IDUtils;

@Service
public class PartServiceImpl implements PartService {

	@Autowired
	PartDao partDao;
	
	@Override
	public EasyUIDataGridResult list(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		PageHelper.startPage((Integer)queryMap.get("page"), (Integer)queryMap.get("rows"));
		List<Part> list = partDao.findList(queryMap);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(new PageInfo<Part>(list).getTotal());
		return result;
	}

	@Override
	public E3Result add(Part part) {
		// TODO Auto-generated method stub
		Long id = IDUtils.genId();
		part.setId(id);
		Integer total = partDao.add(part);
		if (total < 0) {
			return E3Result.build(400, "添加失败，请联系管理员！");
		}
		return E3Result.build(200, "添加成功");
	}

	@Override
	public E3Result edit(Part part) {
		// TODO Auto-generated method stub
		Integer total = partDao.edit(part);
		if (total < 0) {
			return E3Result.build(400, "更新失败，请联系管理员！");
		}
		return E3Result.build(200, "更新成功");
	}

	@Override
	public E3Result delete(Long id) {
		// TODO Auto-generated method stub
		try {
			Integer total = partDao.delete(id);
			if (total < 0) {
				return E3Result.build(400, "删除失败，请联系管理员！");
			}
		} catch (Exception e) {
			// TODO: handle exception
			return E3Result.build(400, "该单位下存在权限或者用户信息，不能删除！");
		}
		
		return E3Result.build(200, "删除成功");
	}

	@Override
	public Part findById(Long id) {
		// TODO Auto-generated method stub
		Part part = partDao.findById(id);
		return part;
	}

	@Override
	public List<Part> list() {
		// TODO Auto-generated method stub		
		return partDao.list();
	}

}
