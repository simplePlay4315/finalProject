package walk.mvc.road.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import walk.mvc.common.util.PageInfo;
import walk.mvc.road.model.service.RoadServiceImpl;
import walk.mvc.road.model.vo.Road;

@Controller
public class RoadController {
	
	@Autowired
	private RoadServiceImpl service;
	
	@RequestMapping(value="/road/roadInfo.do")
	public ModelAndView roadInfo (ModelAndView model, @RequestParam("rdNo") int rdno) {
		Road road = service.roadInfoByNo(rdno);
		if((road.getRoute().contains("-") == true)){
			String[] route = road.getRoute().split("-");
			System.out.println(route);
			model.addObject("route", route);
		} else if((road.getRoute().contains("→") == true)) {
			String[] route = road.getRoute().split("→");
			System.out.println(route);
			model.addObject("route", route);
		} else if((road.getRoute().contains("~") == true)) {
			String[] route = road.getRoute().split("~");
			System.out.println(route);
			model.addObject("route", route);
		} else if((road.getRoute() == "없음") == true) {
			model.addObject("route", "");
		}
		
		System.out.println(road);
		model.addObject("road", road);
		model.setViewName("/road/roadInfo");
		
		return model;
	}

	//-------------------------------------------------------------------------------------------------------------
	// 메인 기능 추가 부분
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/road/list")
	public ModelAndView searchRoadList(ModelAndView model, 
									 String level, String runTime, String s_location, String crsLength, String roadNm,
									 @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
//		System.out.println("난이도 : " + level + " 시간 : " + runTime + " 지역 : " + s_location + " 거리 : " + crsLength);
//		System.out.println("여행길 : " + roadNm);
		int roadCount = service.roadCount(level, runTime, s_location, crsLength, roadNm);
//		System.out.println("roadCount : " + roadCount);
		
		PageInfo pageInfo = new PageInfo(page, 12, roadCount, 10);
		List<Road> list = service.searchRoadList(level, runTime, s_location, crsLength, roadNm, pageInfo);
		
		model.addObject("list", list);
		model.addObject("countList", roadCount);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("road/searchHeaderList");
//		System.out.println(list.toString());
		return model;
	}

	@RequestMapping("/road/allList")
	public ModelAndView allRoadList(ModelAndView model,
						@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		int roadCount = service.allRoadCount();
//		System.out.println("roadCount : " + roadCount);

		PageInfo pageInfo = new PageInfo(page, 10, roadCount, 9);
		List<Road> list = service.allRoadList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("countList", roadCount);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("road/searchHeaderList");
		return model;
	}

	@RequestMapping("/road/theme")
	public ModelAndView themeClick(ModelAndView model, @RequestParam(value = "theme", required = false) String theme
			, @RequestParam Map<String, String> param) {
		System.out.println("테마 : " + theme );
		
		int page = 1;
		
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {
			}
		}
		
		int count = service.themeClickCount(theme);
		PageInfo pageInfo = new PageInfo(page, 10, count , 9);
		List<Road> list = service.themeClick(pageInfo, theme);
		
		model.addObject("list", list);
		model.addObject("countList", count);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("road/themeclick");
		return model;
	}
	
	//introduceOurTeam 부분
	@RequestMapping("/introduceOurTeam.do")
	public String ourTeam() {
		return "common/introduceOurTeam";
	}
	
	
}
