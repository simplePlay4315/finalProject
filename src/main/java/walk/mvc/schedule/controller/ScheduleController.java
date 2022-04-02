package walk.mvc.schedule.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import walk.mvc.member.model.vo.Member;
import walk.mvc.schedule.model.service.ScheduleServiceImpl;
import walk.mvc.schedule.model.vo.Schedule;


@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleServiceImpl service;
	
	@RequestMapping(value="/schedule/schedule.do", method = RequestMethod.GET)
	public ModelAndView schedule(ModelAndView model,  @SessionAttribute(name = "loginMember", required = false) Member loginMember ){
		 
		if(loginMember == null) {
			model.addObject("msg", "로그인이 필요합니다."); 
			model.addObject("location", "/"); 
			model.setViewName("common/msg"); 
			return model; 
		} 
		
		List<Schedule> scheduleList =  service.scheduleListAll(loginMember.getId());
		
		Map<String, Schedule> scheduleMap = new HashMap<String, Schedule>();  
		
		for(Schedule s : scheduleList) {
			scheduleMap.put(s.getS_date().toString(), s); 
		}
		
		model.addObject("scheduleMap",scheduleMap); 
		model.setViewName("schedule/schedule");
		return model; 
	}
	
	@RequestMapping(value = "/schedule/insertSchedule.do", method = {RequestMethod.GET ,RequestMethod .POST})
	public ModelAndView insertSchedule(ModelAndView model,
			@SessionAttribute(name="loginMember", required =false) Member loginMember,
			@RequestParam("s_date") Date s_date,
			@RequestParam("rdNo") int rdNo) {
		
		if(loginMember == null) {
			model.addObject("msg", "로그인 후 일정에 추가할 수 있습니다."); 
			model.addObject("location", "/member/loginPage"); 
			model.setViewName("/common/msg"); 
			return model; 
		} 
		
		
		Schedule schedule = new Schedule();
		schedule.setId(loginMember.getId());
		schedule.setRdNo(rdNo);
		schedule.setS_date(s_date);
		int result = service.insertSchedule(schedule);
		System.out.println(result);
		
		if(result > 0) {
		model.setViewName("redirect:/schedule/schedule.do");
		} else {
			model.addObject("msg", "일정에 추가하지 못했습니다.");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
			return model;
			
			
		}
		return model;
	}

	
	
	@RequestMapping(value="/schedule/delete", method = RequestMethod.GET)
	public ModelAndView delete(ModelAndView model, @RequestParam("sNo") int sNo){
		
		int result = service.deleteSchedule(sNo);
		
		if(result > 0) { 
			model.addObject("msg", "일정이 삭제되었습니다."); 
		}else {
			model.addObject("msg", "삭제하는 도중 오류가 발생하였습니다. 지속적으로 발생시 문의 부탁드립니다.");
		}

		model.addObject("location", "/schedule/schedule.do"); 
		model.setViewName("common/msg");
		return model; 
	}

}