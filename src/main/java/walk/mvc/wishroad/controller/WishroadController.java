package walk.mvc.wishroad.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import walk.mvc.common.util.PageInfo;
import walk.mvc.member.model.vo.Member;
import walk.mvc.road.model.vo.Road;
import walk.mvc.wishroad.model.service.WishroadServiceImpl;


@Controller
public class WishroadController {
	
	@Autowired
	private WishroadServiceImpl service;
	
	@RequestMapping("/wishroad/plusWish.do")
	public ModelAndView plusWish(ModelAndView model,
			@Param("rdno") int rdno,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {

		if(loginMember == null) {
			model.addObject("msg", "로그인 후에 내가 가고싶은 길에 추가할 수 있습니다.");
			model.addObject("location", "/member/loginPage");
			model.setViewName("common/msg");
			return model;
		}
		
		int uno =  loginMember.getNo();
		int result = service.insertWishroad(uno, rdno);
		System.out.println(result);
		
		if(result > 0) {
		model.addObject("msg", "성공적으로 추가되었습니다.");
		model.addObject("location", "/wish/wishRoad");
		model.setViewName("/common/msg");
		} else {
			model.addObject("msg", "내가 가고싶은 길 목록에 추가하지 못했습니다.");
			model.setViewName("/");
		}
		return model;
	}
	
	@RequestMapping(value="wish/wishRoad", method = {RequestMethod.GET ,RequestMethod .POST})
	public ModelAndView myWishRoad(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam Map<String, String> param
			) {
		
		int uno = loginMember.getNo();
		int page = 1;
		
		if(param.containsKey("page") == true) {
			
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		PageInfo pageInfo = new PageInfo(page, 4, service.myWishroadCount(uno), 4);		
		List<Road> myWishList = service.myWishRoad(pageInfo, uno);
		int count = service.myWishroadCount(uno);
		System.out.println(myWishList);
		
		model.addObject("loginMember", loginMember);
		model.addObject("myWishList", myWishList);
		model.addObject("pageInfo", pageInfo);
		model.addObject("count", count);
		model.setViewName("member/myWishRoad");
		return model;
	}

}