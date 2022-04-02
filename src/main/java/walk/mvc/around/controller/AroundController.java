package walk.mvc.around.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import walk.mvc.around.model.service.AroundServiceImpl;
import walk.mvc.around.model.vo.Around;
import walk.mvc.around.model.vo.AroundScheduleJoin;
import walk.mvc.common.util.PageInfo;
import walk.mvc.member.model.vo.Member;


@Controller
public class AroundController {
	
	@Autowired
	private AroundServiceImpl service;
	
	@RequestMapping("/around/around.do")
	public ModelAndView around(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember
			) {
		
		if(loginMember == null) {
			model.addObject("msg", "로그인 후에 확인할 수 있습니다.");
			model.addObject("location", "/member/loginPage");
			model.setViewName("/common/msg");
			return model;
		} 
		
		List<AroundScheduleJoin> list = service.myTripList(loginMember.getId());
		System.out.println(list.toString());
		model.addObject("list", list);
		model.setViewName("around/around");
		
		return model;
		
	}
	
	@RequestMapping(value="/around/aroundSearch.do", method = {RequestMethod.GET ,RequestMethod .POST})
	public ModelAndView searchResult(ModelAndView model,
		@RequestParam("s_Location") String location,
		@SessionAttribute(name = "loginMember", required = false) Member loginMember
		) {
		String[] arr = location.split(",");
		location = arr[0];
		String sno = arr[1].trim();
		System.out.println(arr[0]);
		System.out.println(arr[1]);
		
		List<AroundScheduleJoin> list = service.myTripList(loginMember.getId());
		System.out.println(list.toString());
		
		location = location.substring(0,2);
		int page = 1;
		
		PageInfo pageInfo = new PageInfo(page, 9, service.aroundSearchListCount(location),9);
		List<Around> a_list = service.aroundSearchList(pageInfo, location);
		
		System.out.println(location);
			model.addObject("list", list);
			model.addObject("a_list", a_list);
			model.addObject("sno", sno);
			model.addObject("s_location", location);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("/around/around");
		return model;
	}
	
	@RequestMapping(value=("/plusschedule.do"), method = {RequestMethod.GET ,RequestMethod .POST})
	public ModelAndView plusSchedule(ModelAndView model,
			@RequestParam("shopNm") String shopNm,
			@RequestParam("sno") String sNo
			
	) {
		
		int sno = Integer.parseInt(sNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("shopNm", shopNm);
		map.put("sno",sno);
		
		int result = service.insertS_Around(map);
		System.out.println(result);
		
		if(result > 0) {
			
			model.addObject("msg", "일정에 추가되었습니다.");
			model.addObject("location", "/schedule/schedule.do");
			model.setViewName("/common/msg");
			
			} else {
				
			model.addObject("msg", "일정에 추가하지 못했습니다.");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
			}
			return model;
	}
}