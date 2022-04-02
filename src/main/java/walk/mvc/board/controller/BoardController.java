package walk.mvc.board.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import lombok.extern.slf4j.Slf4j;
import walk.mvc.board.model.service.BoardService;
import walk.mvc.board.model.vo.Board;
import walk.mvc.board.model.vo.Reply;
import walk.mvc.common.util.PageInfo;
import walk.mvc.member.model.vo.Member;

@Slf4j
@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;

	@Autowired
	private ResourceLoader resourceLoader; // 파일 다운로드 기능시 활용하는 loader
	
	@GetMapping("/boardList")
	public ModelAndView list(ModelAndView model, @RequestParam Map<String, String> param) {
		int boardCount = service.boardCount();
		int page = 1;
		if(param.containsKey("page") == true) {
			try {
				page = Integer.parseInt(param.get("page"));
			} catch (Exception e) {}
		}
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getBoardCount(param), 10);
		List<Board> list = service.getBoardList(pageInfo, param);
		
		model.addObject("boardCount", boardCount);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/board/boardList");
		
		return model;
	}
	
	@GetMapping("/boardOneView")
	public ModelAndView view(ModelAndView model, int no) {
		Board board = service.findByNo(no);
		int boardReplyCount = service.boardReplyCount(no);
		System.out.println(board);
		System.out.println("댓글 갯수 : " + boardReplyCount);
		
		model.addObject("board", board);
		model.addObject("replyList", board.getReplies());
		model.addObject("boardReplyCount", boardReplyCount);
		
		model.setViewName("/board/boardOneView");
		
		return model;
	}
	
	@GetMapping("/boardOneWrite")
	public void writeView() {
		log.info("게시글 작성 요청페이지");
		// return "board/write"; 
	}
	
	@PostMapping("/boardOneWrite")
	public ModelAndView write(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile
			) {
		log.info("게시글 작성 요청");

		if (loginMember.getId().equals(board.getWriterId()) == false) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
			return model;
		}
		
		board.setWriterNo(loginMember.getNo());
		
		if(upfile != null && upfile.isEmpty() == false) {
			// 파일을 저장하는 로직
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/boardList";
			String renameFileName = service.saveFile(upfile, savePath); // 실제 파일 저장하는 코드

			if (renameFileName != null) {
				board.setOriginalFileName(upfile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}
		
		System.out.println(board);

		int result = service.saveBoard(board);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/board/boardList");
		} else {
			model.addObject("msg", "게시글이 등록을 실패하였습니다.");
			model.addObject("location", "/board/boardList");
		}

		model.setViewName("/common/msg");
		
		return model;
	}

	
	@PostMapping("/reply")
	public ModelAndView writeReply(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			@ModelAttribute Reply reply, HttpServletRequest request
			) {
		log.info("리플 작성 요청");
		
		reply.setWriterNo(loginMember.getNo());
		int getNo = Integer.parseInt(request.getParameter("boardNo"));
		int boardReplyCount = service.boardReplyCount(getNo);
		System.out.println(boardReplyCount);
		
		int result = service.saveReply(reply);
		
		if (result > 0) {
			Board board = service.findByNo(reply.getBoardNo());
			System.out.println(board);
			model.addObject("board", board);
			model.addObject("replyList", board.getReplies());
			model.setViewName("board/boardOneView");
			model.addObject("boardReplyCount", boardReplyCount);
		} else {
			model.addObject("msg", "댓글이 등록을 실패하였습니다.");
			model.addObject("location", "/");
			model.setViewName("/common/msg");
		}
		
		return model;
	}
	
	
	@RequestMapping("/replydel")
	public ModelAndView deleteReply(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			int replyNo) {
		log.info("리플 삭제 요청");
		
		int result = service.deleteReply(replyNo);
		
		if (result > 0) {
			model.addObject("msg", "댓글이 삭제되었습니다.");
			model.addObject("location", "/board/boardList");
		} else {
			model.addObject("msg", "댓글이 등록을 실패하였습니다.");
			model.addObject("location", "/board/boardList");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
	
	@RequestMapping("/delete")
	public ModelAndView deleteBoard(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			int boardNo) {
		log.info("글 삭제 요청");
		
		int result = service.deleteBoard(boardNo);
		
		if (result > 0) {
			model.addObject("msg", "글이 삭제되었습니다.");
			model.addObject("location", "/board/boardList");
		} else {
			model.addObject("msg", "글 삭제에 실패하였습니다.");
			model.addObject("location", "/board/boardList");
		}
		model.setViewName("/common/msg");
		
		return model;
	}
	
	@GetMapping("/update")
	public ModelAndView updateView(ModelAndView model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("no") int boardNo) {

		Board board = service.findByNo(boardNo);

		if (loginMember.getNo() == board.getWriterNo()) {
			model.addObject("board", board);
			model.setViewName("board/update");
		} else {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/board/boardList");
			model.setViewName("/common/msg");
		}

		return model;
	}
	
	@PostMapping("/update")
	public ModelAndView update(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, 
			@ModelAttribute Board board,
			@RequestParam("reloadFile") MultipartFile reloadFile) {

		log.info("게시글 업데이트 요청");

		if (loginMember.getId().equals(board.getWriterId()) == false) {
			model.addObject("msg", "잘못된 접근입니다");
			model.addObject("location", "/board/boardList");
			model.setViewName("/common/msg");
			return model;
		}

		if (reloadFile != null && reloadFile.isEmpty() == false) {
			// 파일 저장하는 로직 구성
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/board";
			
			if(board.getRenamedFileName() != null) {
				service.deleteFile(savePath+"/"+board.getRenamedFileName());
			}
			
			String renameFileName = service.saveFile(reloadFile, savePath); // 실제 파일 저장하는 코드

			if (renameFileName != null) {
				board.setOriginalFileName(reloadFile.getOriginalFilename());
				board.setRenamedFileName(renameFileName);
			}
		}

		System.out.println(board);

		int result = service.saveBoard(board);

		if (result > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("location", "/board/boardOneView?no=" + board.getNo());
		} else {
			model.addObject("msg", "게시글이 수정에 실패하였습니다.");
			model.addObject("location", "/board/update?no=" + board.getNo());
		}

		model.setViewName("/common/msg");

		return model;
	}
	
	@GetMapping("/fileDown")
	public ResponseEntity<Resource>	fileDown(
			@RequestParam("oriname") String oriname, 
			@RequestParam("rename") String rename,
			@RequestHeader(name = "user-agent")String header){
		
		try {
			Resource resource = resourceLoader.getResource("resources/upload/board/" + rename);
			String downName = null;
			
			// 인터넷 익스플로러 인 경우
			boolean isMSIE = header.indexOf("MSIE") != -1 || header.indexOf("Trident") != -1;

			if (isMSIE) { // 익스플로러 처리하는 방법
				downName = URLEncoder.encode(oriname, "UTF-8").replaceAll("\\+", "%20");
			} else {    		
				downName = new String(oriname.getBytes("UTF-8"), "ISO-8859-1"); // 크롬
			}
			
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=\"" + downName + "\"")
					.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(resource.contentLength()))
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())
					.body(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 실패했을 경우!
	}
}