package com.ischoolbar.programmer.service;

import java.util.List;
import java.util.Map;

import com.ischoolbar.programmer.entity.Part;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

public interface PartService {
	public EasyUIDataGridResult list(Map<String, Object> queryMap);
	
	public E3Result add(Part part);
	
	public E3Result edit(Part part);
	
	public E3Result delete(Long id);
	
	public Part findById(Long id);
	
	public List<Part> list();
}
