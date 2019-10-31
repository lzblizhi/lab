package com.ischoolbar.programmer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;
import javax.sql.RowSet;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ischoolbar.programmer.entity.Part;
import com.ischoolbar.programmer.entity.Role;
import com.ischoolbar.programmer.page.Page;
import com.ischoolbar.programmer.service.PartService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

@Controller
@RequestMapping("/admin/part")
public class PartController {

	@Autowired
	PartService partService;
	
	//单位页面
	@RequestMapping(value="/list", method  = RequestMethod.GET)
	public String list(){
		return "/part/list";
	}
	
	/**
	 * 获取单位列表
	 */
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult getList(Integer page, Integer rows,
			@RequestParam(name="name",required=false,defaultValue="") String name
			){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("page", page);
		queryMap.put("rows", rows);
		EasyUIDataGridResult result = partService.list(queryMap);
		return result;
	}
	
	/**
	 * 单位添加
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/add",method=RequestMethod.POST)
	@ResponseBody
	public E3Result add(Part part){
		if(part == null){
			return E3Result.build(400, "请填写正确的单位信息！");
		}
		if(StringUtils.isEmpty(part.getName())){
			return E3Result.build(400, "请填单位名称！");
		}
		E3Result result = partService.add(part);
		return result;
	}
	
	/**
	 * 单位修改
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	@ResponseBody
	public E3Result edit(Part part){
		if(part == null){
			return E3Result.build(400, "请填写正确的单位信息！");
		}
		if(StringUtils.isEmpty(part.getName())){
			return E3Result.build(400, "请填单位名称！");
		}
		E3Result result = partService.edit(part);
		return result;
	}
	
	/**
	 * 删除单位信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public E3Result delete(String ids){
		if(ids == null){
			return E3Result.build(400, "请选择要删除的单位！");
		}
		Long id;
        String[] idss = ids.split(",");
        if (idss.length > 1){
            for (int i = 0; i < idss.length; i++){
                id = Long.parseLong(idss[i]);
                partService.delete(id);
            }
            return E3Result.build(200, "删除成功");
        }
        else {
            id = Long.parseLong(ids);
            partService.delete(id);
            return E3Result.build(200, "删除成功");
        }
	}
}
