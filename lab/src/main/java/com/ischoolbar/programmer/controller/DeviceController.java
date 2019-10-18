package com.ischoolbar.programmer.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ischoolbar.programmer.entity.Device;
import com.ischoolbar.programmer.service.DeviceService;
import com.ischoolbar.programmer.util.E3Result;
import com.ischoolbar.programmer.util.EasyUIDataGridResult;

@Controller
@RequestMapping("/admin/device")
public class DeviceController {

	@Autowired
	DeviceService deviceService;
	
	//设备列表页面
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(){
		return "lab_resource/device_list";
	}
	
	//获取设备列表
	@RequestMapping(value="/list", method = RequestMethod.POST)
	@ResponseBody
	public EasyUIDataGridResult getList(Integer page, Integer rows,
			@RequestParam(name="name",required=false,defaultValue="") String name,
			@RequestParam(name="usable",required=false,defaultValue="") Integer usable,
			@RequestParam(name="buydate",required=false,defaultValue="") String buydate){
		Map<String, Object> queryMap = new HashMap<String, Object>();
		queryMap.put("name", name);
		queryMap.put("usable", usable);
		queryMap.put("buydate", buydate);
		queryMap.put("page", page);
		queryMap.put("rows", rows);
		EasyUIDataGridResult result = deviceService.getList(queryMap);
		return result;
	}
	
	//新增设备
    @RequestMapping("/add")
    @ResponseBody
    public E3Result addDevice(Device device){
        E3Result e3Result = deviceService.add(device);
        return e3Result;
    }
    
  //更新设备
    @RequestMapping("/edit")
    @ResponseBody
    public E3Result edit(Device device){
        E3Result e3Result = deviceService.edit(device);
        return e3Result;
    }
    
  //删除设备
    @RequestMapping("/delete")
    @ResponseBody
    public E3Result deleteDevice(String ids){
        Long id;
        String[] idss = ids.split(",");
        if (idss.length > 1){
            for (int i = 0; i < idss.length; i++){
                id = Long.parseLong(idss[i]);
                Integer integer = deviceService.delete(id);
                if (integer < 1){
                    return E3Result.build(400, "删除失败!");
                }
            }
            return E3Result.build(200, "删除成功");
        }
        else {
            id = Long.parseLong(ids);
            Integer integer = deviceService.delete(id);
            return E3Result.build(200, "删除成功");
        }
    }
    
    /**
	 * 上传图片
	 * @param photo
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/upload_photo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> uploadPhoto(MultipartFile photo,HttpServletRequest request){
		Map<String, String> ret = new HashMap<String, String>();
		if(photo == null){
			ret.put("type", "error");
			ret.put("msg", "选择要上传的文件！");
			return ret;
		}
		if(photo.getSize() > 1024*1024*1024){
			ret.put("type", "error");
			ret.put("msg", "文件大小不能超过10M！");
			return ret;
		}
		//获取文件后缀
		String suffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf(".")+1,photo.getOriginalFilename().length());
		if(!"jpg,jpeg,gif,png".toUpperCase().contains(suffix.toUpperCase())){
			ret.put("type", "error");
			ret.put("msg", "请选择jpg,jpeg,gif,png格式的图片！");
			return ret;
		}
		String savePath = request.getSession().getServletContext().getRealPath("/") + "/resources/upload/";
		File savePathFile = new File(savePath);
		if(!savePathFile.exists()){
			//若不存在改目录，则创建目录
			savePathFile.mkdir();
		}
		String filename = new Date().getTime()+"."+suffix;
		try {
			//将文件保存至指定目录
			photo.transferTo(new File(savePath+filename));
			//FileUtils.copyInputStreamToFile(photo.getInputStream(), new File(savePath+filename));
		}catch (Exception e) {
			// TODO Auto-generated catch block
			ret.put("type", "error");
			ret.put("msg", "保存文件异常！");
			e.printStackTrace();
			return ret;
		}
		ret.put("type", "success");
		ret.put("msg", "上传成功！");
		ret.put("filepath",request.getSession().getServletContext().getContextPath() + "/resources/upload/" + filename );
		return ret;
	}
}
