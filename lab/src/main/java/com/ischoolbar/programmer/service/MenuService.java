package com.ischoolbar.programmer.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ischoolbar.programmer.entity.Menu;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

/**
 * 菜单管理service
 * @author llq
 *
 */
@Service
public interface MenuService {
	public int add(Menu menu);
	public EasyUIDataGridResult findList(Map<String, Object> queryMap);
	public List<Menu> list();
	public List<Menu> findTopList();
	public int getTotal(Map<String, Object> queryMap);
	public int edit(Menu menu);
	public int delete(Long id);
	public List<Menu> findChildernList(Long parentId);
	public List<Menu> findListByIds(String ids);
}
