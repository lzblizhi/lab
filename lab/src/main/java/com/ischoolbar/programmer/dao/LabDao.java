package com.ischoolbar.programmer.dao;

import java.util.List;
import java.util.Map;

import com.ischoolbar.programmer.entity.Lab;

public interface LabDao {
    List<Lab> findList(Map<String, Object> query);//查询列表

    Integer addLab(Lab lab);//新增实验室

    Integer edit(Lab lab);//更新实验室

    Integer delete(Long id);//根据id删除实验室

    List<Lab> getLabByCondition(Map<String, Object> mapCondition);//条件查询

	Lab findByName(String name);
}
