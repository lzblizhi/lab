package com.ischoolbar.programmer.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("admin/lesson")
public class LessonController {

	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String list(){
		return "lesson/list";
	}
}
