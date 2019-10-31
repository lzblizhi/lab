package com.ischoolbar.programmer.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ischoolbar.programmer.entity.Lab;
import com.ischoolbar.programmer.page.Page;
import com.ischoolbar.programmer.service.LabService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

/**
 * 实验室管理控制器
 */
@Controller
@RequestMapping("/admin/lab")
public class LabController {
	
	@Autowired
	LabService labService;
	
	//实验室列表页面
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("lab_resource/lab_list");
		return model;
	}
	
	//获取实验室列表
	@RequestMapping(value = "/list", method=RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult getList(Integer page, Integer rows,
			@RequestParam(name="name",required=false,defaultValue="") String name,
			@RequestParam(name="status",required=false) Integer status){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("status", status);
		queryMap.put("page", page);
		queryMap.put("rows", rows);
		EasyUIDataGridResult result = labService.findList(queryMap);
		return result;
	}
	
	//新增实验室
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody
	public E3Result addLab(Lab lab){
		E3Result result = labService.addLab(lab);
		return result;
	}
	
	//更新实验室
    @RequestMapping("/edit")
    @ResponseBody
    public E3Result edit(Lab lab){
        E3Result e3Result = labService.edit(lab);
        return  e3Result;
    }
    
  //删除实验室
    @RequestMapping("/delete")
    @ResponseBody
    public E3Result delete(String ids){
        Long id;
        if(ids.contains(",")){
			ids = ids.substring(0,ids.length()-1);
		}
        String[] idss = ids.split(",");
        if (idss.length > 1){
            for (int i = 0; i < idss.length; i++){
                id = Long.parseLong(idss[i]);
                labService.delete(id);
            }
            
            return E3Result.build(200, "删除成功!");
        }
        else {
            id = Long.parseLong(ids);
            Integer integer = labService.delete(id);
            if (integer >0 ){
            	return E3Result.build(200, "删除成功");
            }
            return E3Result.build(400, "删除失败");
        }
    }
}
