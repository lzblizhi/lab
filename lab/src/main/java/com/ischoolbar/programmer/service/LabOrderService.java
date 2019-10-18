package com.ischoolbar.programmer.service;

import java.util.Map;

import com.ischoolbar.programmer.entity.LabOrder;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

public interface LabOrderService {

	EasyUIDataGridResult getList(Map<String, Object> query);

	LabOrder findById(Long id);

	Integer edit(Long id);

	Integer delete(Long id);

	Integer retEdit(Long id);

	EasyUIDataGridResult getMyList(Map<String, Object> query);

	Integer add(LabOrder labOrder);

}
