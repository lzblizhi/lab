package com.ischoolbar.programmer.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;

import com.ischoolbar.programmer.entity.Schedule;
import com.ischoolbar.programmer.service.ScheduleService;
import com.ischoolbar.programmer.util.MailUtils;

public class MailJob{
	@Autowired
	ScheduleService scheduleService;
	public void myMethod(){
		// TODO Auto-generated method stub
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(now);
		List<Schedule> list = scheduleService.findByDate(today);
		if (list == null) {
			return;
		}
		for (Schedule labSchedule : list) {
			try {
				MailUtils.sendMail(labSchedule.getEmail(), labSchedule.getSubject(), labSchedule.getEmailmsg());
				labSchedule .setStatus(1);
				System.out.println("已发送");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}	
	}
}
