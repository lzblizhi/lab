package com.ischoolbar.programmer.service.admin.impl;
/**
 * 菜单管理实现类
 */
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ischoolbar.programmer.dao.MenuDao;
import com.ischoolbar.programmer.entity.Menu;
import com.ischoolbar.programmer.entity.Part;
import com.ischoolbar.programmer.service.MenuService;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;
@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuDao menuDao;
	
	@Override
	public int add(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.add(menu);
	}

	@Override
	public EasyUIDataGridResult findList(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		List<Menu> list = menuDao.findList(queryMap);
		EasyUIDataGridResult result = new EasyUIDataGridResult();
		result.setRows(list);
		result.setTotal(list.size());
		return result;
	}

	@Override
	public List<Menu> findTopList() {
		// TODO Auto-generated method stub
		return menuDao.findTopList();
	}

	@Override
	public int getTotal(Map<String, Object> queryMap) {
		// TODO Auto-generated method stub
		return menuDao.getTotal(queryMap);
	}

	@Override
	public int edit(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.edit(menu);
	}

	@Override
	public int delete(Long id) {
		// TODO Auto-generated method stub
		return menuDao.delete(id);
	}

	@Override
	public List<Menu> findChildernList(Long parentId) {
		// TODO Auto-generated method stub
		return menuDao.findChildernList(parentId);
	}

	@Override
	public List<Menu> findListByIds(String ids) {
		// TODO Auto-generated method stub
		return menuDao.findListByIds(ids);
	}

	@Override
	public List<Menu> list() {
		// TODO Auto-generated method stub
		return menuDao.list();
	}

}
