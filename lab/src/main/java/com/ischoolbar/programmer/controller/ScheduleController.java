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
import com.ischoolbar.programmer.entity.Schedule;
import com.ischoolbar.programmer.service.ScheduleService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

@Controller
@RequestMapping("admin/schedule")
public class ScheduleController {
	
	@Autowired
	ScheduleService scheduleService;
	
	//实验室列表页面
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public ModelAndView list(ModelAndView model){
		model.setViewName("schedule/list");
		return model;
	}
	
	//获取事务列表
	@RequestMapping(value = "/list", method=RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult getList(Integer page, Integer rows,
			@RequestParam(name="uid", defaultValue="",required=true)Integer uid){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("uid", uid);
		queryMap.put("page", page);
		queryMap.put("rows", rows);
		EasyUIDataGridResult result = scheduleService.list(queryMap);
		return result;
	}
	
	//新增
	@RequestMapping(value="/add", method = RequestMethod.POST)
	@ResponseBody
	public E3Result add(Schedule schedule){
		E3Result result = scheduleService.add(schedule);
		return result;
	}
	
	
	 //删除
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
                scheduleService.delete(id);
            }
            
            return E3Result.build(200, "删除成功!");
        }
        else {
            id = Long.parseLong(ids);
            Integer integer = scheduleService.delete(id);
            if (integer >0 ){
            	return E3Result.build(200, "删除成功");
            }
            return E3Result.build(400, "删除失败");
        }
    }
	
}
