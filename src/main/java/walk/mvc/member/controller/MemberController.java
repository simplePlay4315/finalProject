package walk.mvc.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import walk.mvc.board.model.vo.Board;
import walk.mvc.board.model.vo.Reply;
import walk.mvc.member.model.service.MemberService;
import walk.mvc.member.model.vo.Member;

@Slf4j
@Controller
@SessionAttributes("loginMember") // loginMember를 model에서 취급할 때 Session으로 처리하는 parameter
public class MemberController {

	@Autowired
	private MemberService service;

	@RequestMapping("/member/loginPage")
	public String loginPage() {
		return "member/login";
	}
	

	// 2번 패턴
	@RequestMapping(value = "/login", method = {RequestMethod.POST })
	public ModelAndView login(ModelAndView model, String userId, String userPwd) {

		log.info("{},{}", userId, userPwd);
		Member loginMember = service.login(userId, userPwd);

		if (loginMember != null) {
			model.addObject("loginMember", loginMember); // 어노테이션을 통해 Session으로 처리되는 코드
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		return model;
	}

	@RequestMapping("/logout2")
	public String logout2(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}

	// 2번
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		log.info("status:" + status.isComplete());
		status.setComplete(); // 세션 종료하는 코드
		log.info("status" + status.isComplete());

		return "redirect:/";
	}

	
	@RequestMapping("/member/userEnroll")
	public String userEnroll() {
		return "member/userEnroll";
	}
	
	// 1. enroll(회원가입) get방식 처리
	@RequestMapping(value = "/member/enroll", method = { RequestMethod.GET })
	public String getEnrollPage() {
		log.info("가입페이지 요청");
		return "member/enroll";
	}

	// 2. enroll Post방식 처리
	@PostMapping("/member/enroll")
	public ModelAndView postEnrollPage(ModelAndView model, @ModelAttribute Member member) {

		log.info("회원가입 member : " + member);
		int result = service.save(member);

		if (result > 0) {
			model.addObject("msg", "회원가입에 성공하였습니다.");
			model.addObject("location", "/");
		} else {
			model.addObject("msg", "회원가입에 실패하였습니다.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		return model;
	}

	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(String id) {
		log.info("userId:" + id);
		boolean result = service.validate(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("validate", result);
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
	@GetMapping("/member/update")
	public String view() {
		log.info("회원정보 페이지 요청");
		return "member/userUpdate";
	}
	
	@PostMapping("/member/update")
	public ModelAndView update(ModelAndView model, @ModelAttribute Member member,
								@SessionAttribute(name="loginMember", required =false)Member loginMember) {
		System.out.println(member);
		if(loginMember == null || loginMember.getId().equals(member.getId()) == false) {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
			return model;
		} 
		
		member.setNo(loginMember.getNo());
		int result = service.save(member);
		
		if(result > 0) {
			model.addObject("loginMember", service.findById(member.getId())); //세션에 넣는 코드
			model.addObject("msg", "회원정보를 수정하였습니다.");
			model.addObject("location", "/member/update");
		} else {
			model.addObject("msg", "회원정보 수정 실패하였습니다.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		return model;
	}
	
	@GetMapping("/member/delete")
	public ModelAndView delete(ModelAndView model,
				@SessionAttribute(name="loginMember", required = false) Member loginMember) {
		
		int result = service.delete(loginMember.getNo());

		if(result > 0) {
			model.addObject("msg", "정상적으로 탈퇴되었습니다.");
			model.addObject("location", "/logout");
		} else {
			model.addObject("msg", "회원 탈퇴를 실패하였습니다.");
			model.addObject("location", "/member/view");
		}	
		model.setViewName("common/msg");
		return model;
	}
	
	
	//myWrite, myReplyList
	@RequestMapping("/member/myWrite")
	public ModelAndView myWrite(ModelAndView model
			,@SessionAttribute Member loginMember) {
		
		int uno = loginMember.getNo();
		
		List<Board> myBoardList = service.myWrite(uno);
		int myBoardCount = service.myWriteCount(uno);
		
		System.out.println(myBoardList);
		System.out.println(myBoardCount);
		model.addObject("loginMember", service.findById(loginMember.getId()));
		model.addObject("myBoardList", myBoardList);
		model.addObject("myBoardCount", myBoardCount);
		model.setViewName("member/myWrite");
		
		/*
		 * if (loginMember.getId()==null) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
			return model;
		}*/
		
		
		return model;
	}
	
	@RequestMapping("/member/myComments")
	public ModelAndView myComments(ModelAndView model
			, @SessionAttribute Member loginMember) {
		int uno = loginMember.getNo();
		
		List<Reply> list = service.myComments(uno);
		int replyCount = service.myCommentsCount(uno);
		
		System.out.println(list);
		System.out.println(replyCount);
		
		model.addObject("loginMember", service.findById(loginMember.getId()));
		model.addObject("list", list);
		model.addObject("replyCount", replyCount);
		model.setViewName("member/myComments");
		return model;
	}
	
	
}