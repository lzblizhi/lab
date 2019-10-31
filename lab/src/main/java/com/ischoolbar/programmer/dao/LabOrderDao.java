package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import com.ischoolbar.programmer.entity.LabOrder;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

public interface LabOrderDao {

	List<LabOrder> getList(Map<String, Object> query);

	LabOrder findById(Long id);

	Integer edit(Long id);

	Integer delete(Long id);

	Integer retEdit(Long id);

	List<LabOrder> getMyList(Map<String, Object> query);

	Integer add(LabOrder labOrder);

}
