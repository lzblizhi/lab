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
import com.ischoolbar.programmer.entity.User;
import com.ischoolbar.programmer.service.DevOrderService;
import com.ischoolbar.programmer.service.DeviceService;
import com.ischoolbar.programmer.service.UserService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;
import com.ischoolbar.programmer.util.IDUtils;
import com.ischoolbar.programmer.util.MailUtils;
import com.ischoolbar.programmer.util.MenuUtil;

@Controller
@RequestMapping("/admin/devOrder")
public class DevOrderController {
	
	@Autowired
	DevOrderService devOrderService;
	
	@Autowired
	DeviceService deviceService;
	
	@Autowired
	UserService userService;
	
	//设备借用列表页面
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(){
		return "order/devOrder";
	}
	
	//我的设备申请页面
	@RequestMapping(value="/mylist",method=RequestMethod.GET)
	public String mylist(){
		return "order/myDevOrder";
	}
	
	//获取用户个人设备列表
		@RequestMapping(value="/mylist",method=RequestMethod.POST)
		@ResponseBody
		public EasyUIDataGridResult mylist(Integer page, Integer rows,
				@RequestParam(name="uid",required=false,defaultValue="") Integer uid,
				@RequestParam(name="name",required=false,defaultValue="") String name,
				@RequestParam(name="astatus",required=false,defaultValue="") Integer astatus,
				@RequestParam(name="rstatus",required=false,defaultValue="") Integer rstatus,
				@RequestParam(name="btime",required=false,defaultValue="") String btime,
				@RequestParam(name="rtime",required=false,defaultValue="") String rtime){
			Map<String, Object> query = new HashMap<String, Object>();
			query.put("page",page);
			query.put("rows",rows);
			query.put("uid", uid);
			query.put("name", name);
			query.put("astatus",astatus);
			query.put("rstatus",rstatus);
			query.put("btime",btime);
			query.put("rtime",rtime);
			EasyUIDataGridResult result = devOrderService.myList(query);
			return result;
		}
	
	//获取设备列表
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult getlist(Integer page, Integer rows,
			@RequestParam(name="name",required=false,defaultValue="") String name,
			@RequestParam(name="username",required=false,defaultValue="") String username,
			@RequestParam(name="astatus",required=false,defaultValue="") Integer astatus,
			@RequestParam(name="rstatus",required=false,defaultValue="") Integer rstatus,
			@RequestParam(name="btime",required=false,defaultValue="") String btime,
			@RequestParam(name="rtime",required=false,defaultValue="") String rtime){
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
		query.put("btime",btime);
		query.put("rtime",rtime);
		EasyUIDataGridResult result = devOrderService.getList(query);
		return result;
	}
	
	//新增设备借用
	@RequestMapping(value="/add", method=RequestMethod.POST)
	@ResponseBody
	public E3Result add(DevOrder deviceBorrow){
		Device device = deviceService.findByname(deviceBorrow.getName());
		if (device.getQuantity() < (device.getUsable()+deviceBorrow.getNumber())) {
			return E3Result.build(400, "库存不足");
		}
		Long id = IDUtils.genId();
		deviceBorrow.setId(id);
		deviceBorrow.setAstatus(1);
		deviceBorrow.setRstatus(0);
		E3Result e3Result = devOrderService.add(deviceBorrow);
		return e3Result;
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
                DevOrder order = devOrderService.findById(id);
                Device device = deviceService.findByname(order.getName());
                if (device.getUsable() < order.getNumber()) {
    				return E3Result.build(400, "库存不足");
    			}
                device.setUsable(device.getUsable() - order.getNumber());
                Integer integer = devOrderService.edit(id);
                try {
    				MailUtils.sendMail(order.getEmail(), userService.findById(order.getUid()).getUsername()+",您好",
    						order.getName()+"申请成功,请尽快到实验室领取");
    			} catch (AddressException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			} catch (MessagingException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
                if (integer < 1){
                    return E3Result.build(400, "审核失败!");
                }
            }
            return E3Result.build(200, "审核成功");
        }
        else {
            id = Long.parseLong(ids);
            
            DevOrder order = devOrderService.findById(id);
            Device device = deviceService.findByname(order.getName());
            if (device.getUsable() < order.getNumber()) {
				return E3Result.build(400, "库存不足");
			}
            device.setUsable(device.getUsable() - order.getNumber());
            deviceService.edit(device);
            
            Integer integer = devOrderService.edit(id);
            try {
				MailUtils.sendMail(order.getEmail(), userService.findById(order.getUid()).getUsername()+",您好",
						order.getName()+"申请成功,请尽快到实验室领取");
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
                DevOrder order = devOrderService.findById(id);
                if (order.getAstatus() == 1) {
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
    			}
                Integer integer = devOrderService.delete(id);
                if (integer < 1){
                    return E3Result.build(400, "失败!");
                }
            }
            return E3Result.build(200, "成功");
        }
        else {
            id = Long.parseLong(ids);
            DevOrder order = devOrderService.findById(id);
            if (order.getAstatus() == 1) {
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
			}
            Integer integer = devOrderService.delete(id);

            
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
                DevOrder order = devOrderService.findById(id);
                if (order.getAstatus() == 1) {
    				return E3Result.build(400, "该项尚未审核");
    			}
                Integer integer = devOrderService.retEdit(id);
                if (integer < 1){
                    return E3Result.build(400, "失败!");
                }
            }
            return E3Result.build(200, "成功");
        }
        else {
            id = Long.parseLong(ids);
            
            DevOrder order = devOrderService.findById(id);
            if (order.getAstatus() == 1) {
				return E3Result.build(400, "该项尚未审核");
			}
            
            Integer integer = devOrderService.retEdit(id);
            Device device = deviceService.findByname(order.getName());
            device.setUsable(device.getUsable() + order.getNumber());
            deviceService.edit(device);
            return E3Result.build(200, "成功");
        }
    }
}
