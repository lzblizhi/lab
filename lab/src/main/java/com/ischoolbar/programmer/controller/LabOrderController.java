package com.ischoolbar.programmer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ischoolbar.programmer.entity.DevOrder;
import com.ischoolbar.programmer.entity.Device;
import com.ischoolbar.programmer.entity.Lab;
import com.ischoolbar.programmer.entity.LabOrder;
import com.ischoolbar.programmer.entity.User;
import com.ischoolbar.programmer.service.LabOrderService;
import com.ischoolbar.programmer.service.LabService;
import com.ischoolbar.programmer.service.UserService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;
import com.ischoolbar.programmer.util.IDUtils;
import com.ischoolbar.programmer.util.MailUtils;

@Controller
@RequestMapping("admin/labOrder")
public class LabOrderController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	LabService labSerivce;
	
	@Autowired
	LabOrderService labOrderService;
	
	//实验室借用列表页面
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(){
		return "order/labOrder";
	}
	
	//我的实验室申请
	@RequestMapping(value="/mylist",method=RequestMethod.GET)
	public String mylist(){
		return "order/myLabOrder";
	}
	
	//个人实验室申请列表
	@RequestMapping(value="/mylist",method=RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult getMylist(Integer page, Integer rows,
			@RequestParam(name="name",required=false,defaultValue="") String name,
			@RequestParam(name="uid",required=false,defaultValue="") Integer uid,
			@RequestParam(name="astatus",required=false,defaultValue="") Integer astatus,
			@RequestParam(name="rstatus",required=false,defaultValue="") Integer rstatus,
			@RequestParam(name="day",required=false,defaultValue="") String day){
		Map<String, Object> query = new HashMap<String, Object>();
	
		query.put("uid", uid);
		query.put("page",page);
		query.put("rows",rows);
		query.put("astatus",astatus);
		query.put("rstatus",rstatus);
		query.put("day",day);
		EasyUIDataGridResult result = labOrderService.getMyList(query);
		return result;
	}
	
	//获取实验室列表
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult getlist(Integer page, Integer rows,
			@RequestParam(name="name",required=false,defaultValue="") String name,
			@RequestParam(name="username",required=false,defaultValue="") String username,
			@RequestParam(name="astatus",required=false,defaultValue="") Integer astatus,
			@RequestParam(name="rstatus",required=false,defaultValue="") Integer rstatus,
			@RequestParam(name="day",required=false,defaultValue="") String day){
		Map<String, Object> query = new HashMap<String, Object>();
		User user = userService.findByUsername(username);
		if (user != null) {
			query.put("uid", user.getId());
		}
		else {
			query.put("uid", null);
		}
		query.put("page",page);
		query.put("rows",rows);
		query.put("name", name);
		query.put("astatus",astatus);
		query.put("rstatus",rstatus);
		query.put("day",day);
		EasyUIDataGridResult result = labOrderService.getList(query);
		return result;
	}
		
	//审核更新借用
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseBody
	public E3Result edit(String ids){
		Long id;
        String[] idss = ids.split(",");
        if (idss.length > 1){
            for (int i = 0; i < idss.length; i++){
                id = Long.parseLong(idss[i]);
                LabOrder order = labOrderService.findById(id);
                Lab lab = labSerivce.findByname(order.getName());
                if (lab.getStatus() == 1) {
    				return E3Result.build(400, "实验室正在使用中");
    			}
                lab.setStatus(1);
                Integer total = labOrderService.edit(id);
                if (total < 1){
                    return E3Result.build(400, "审核失败!");
                }
                try {
    				MailUtils.sendMail(order.getEmail(), userService.findById(order.getUid()).getUsername()+",您好",
    						order.getName()+"申请成功");
    			} catch (AddressException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			} catch (MessagingException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
            }
            return E3Result.build(200, "审核成功");
        }
        else {
            id = Long.parseLong(ids);
            
            LabOrder order = labOrderService.findById(id);
            Lab lab = labSerivce.findByname(order.getName());
            if (lab.getStatus() == 1) {
				return E3Result.build(400, "实验室正在使用中");
			}
            lab.setStatus(1);
            Integer total = labOrderService.edit(id);
            if (total < 1){
                return E3Result.build(400, "审核失败!");
            }
            
            try {
				MailUtils.sendMail(order.getEmail(), userService.findById(order.getUid()).getUsername()+",您好",
						order.getName()+"申请成功");
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            return E3Result.build(200, "审核成功");
        }
	}
	
	//删除\拒绝
	@RequestMapping("/delete")
    @ResponseBody
    public E3Result delete(String ids){
        Long id;
        String[] idss = ids.split(",");
        if (idss.length > 1){
            for (int i = 0; i < idss.length; i++){
                id = Long.parseLong(idss[i]);
                LabOrder order = labOrderService.findById(id);

                try {
    				MailUtils.sendMail(order.getEmail(), userService.findById(order.getUid()).getUsername()+",您好",
    						order.getName()+"申请失败");
    			} catch (AddressException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			} catch (MessagingException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
                Integer integer = labOrderService.delete(id);
                if (integer < 1){
                    return E3Result.build(400, "失败!");
                }
            }
            return E3Result.build(200, "成功");
        }
        else {
            id = Long.parseLong(ids);
            LabOrder order = labOrderService.findById(id);

            try {
				MailUtils.sendMail(order.getEmail(), userService.findById(order.getUid()).getUsername()+",您好",
						order.getName()+"申请失败");
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            Integer integer = labOrderService.delete(id);
            if (integer < 1){
                return E3Result.build(400, "失败!");
            }
            return E3Result.build(200, "成功");
        }
    }
	
	//归还
	@RequestMapping("/retEdit")
    @ResponseBody
    public E3Result retEdit(String ids){
        Long id;
        String[] idss = ids.split(",");
        if (idss.length > 1){
            for (int i = 0; i < idss.length; i++){
                id = Long.parseLong(idss[i]);
                Integer integer = labOrderService.retEdit(id);
                if (integer < 1){
                    return E3Result.build(400, "失败!");
                }
                LabOrder order = labOrderService.findById(id);
                Lab lab = labSerivce.findByname(order.getName());
                lab.setStatus(0);
                labSerivce.edit(lab);
            }
            return E3Result.build(200, "成功");
        }
        else {
            id = Long.parseLong(ids);
            
            Integer integer = labOrderService.retEdit(id);
            if (integer < 1) {
				return E3Result.build(400, "失败");
			}
            LabOrder order = labOrderService.findById(id);
            Lab lab = labSerivce.findByname(order.getName());
            lab.setStatus(0);
            labSerivce.edit(lab);
            return E3Result.build(200, "成功");
        }
    }
		
	//新增设备借用
	@RequestMapping(value="/add", method=RequestMethod.POST)
	@ResponseBody
	public E3Result add(LabOrder labOrder){
		Lab lab = labSerivce.findByname(labOrder.getName());
		if (lab.getStatus() == 1) {
			return E3Result.build(400, "使用中");
		}
		Long id = IDUtils.genId();
		labOrder.setId(id);
		labOrder.setAstatus(1);
		labOrder.setRstatus(0);
		Integer total = labOrderService.add(labOrder);
		if (total < 1) {
			return E3Result.build(400, "失败");
		}
		return E3Result.build(200, "成功");
	}
}
