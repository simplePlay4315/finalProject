package walk.mvc.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import walk.mvc.board.model.vo.Board;
import walk.mvc.board.model.vo.Reply;
import walk.mvc.common.util.PageInfo;

public interface BoardService {

	int saveBoard(Board board);
	
	int saveReply(Reply reply);

	String saveFile(MultipartFile upfile, String savePath);

	int getBoardCount(Map<String, String> param);
	
	List<Board> getBoardList(PageInfo pageInfo, Map<String, String> param);

	Board findByNo(int boardNo);

	void deleteFile(String filePath);

	int deleteBoard(int no);
	
	int deleteReply(int no);
	
	int boardReplyCount(@Param("boardNo") int boardNo);
	
	int boardCount();
}