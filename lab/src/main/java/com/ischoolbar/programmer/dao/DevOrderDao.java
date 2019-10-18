package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import com.ischoolbar.programmer.entity.DevOrder;

public interface DevOrderDao {

	Integer add(DevOrder deviceBorrow);

	List<DevOrder> getList(Map<String, Object> query);

	Integer edit(Long id);

	Integer delete(Long id);

	List<DevOrder> myList(Map<String, Object> query);

	DevOrder findById(Long id);

	Integer retEdit(Long id);

}
