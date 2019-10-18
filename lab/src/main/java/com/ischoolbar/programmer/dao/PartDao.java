package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import com.ischoolbar.programmer.entity.Part;

public interface PartDao {
    public List<Part> findList(Map<String, Object> queryMap);
	
	public Integer add(Part part);
	
	public Integer edit(Part part);
	
	public Integer delete(Long id);
	
	public List<Part> list();
	
	public Part findById(Long id);
}
