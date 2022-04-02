package walk.mvc.member.model.service;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import walk.mvc.board.model.vo.Board;
import walk.mvc.board.model.vo.Reply;
import walk.mvc.member.model.vo.Member;

/*spring interface 설계 코멘트
 * - 필드에서는 의례적으로 사용될 때가 많음
 * 원래 의도: 코드를 설계할 때 interface를 통해 네이밍 내지 프로그램간의 interface를 정의할 때 사용됨
 * 장점: 인터페이스를 통해 네이밍 규칙이 잘 정해짐
 * 단점: 작업량이 늘어난다
 * 
 */

public interface MemberService {
	
	Member login(String id, String pwd);

	int save(Member member);

	boolean validate(String userId);

	Member findById(String id);

	int delete(int no);
	
	//myWrite, myReply부분
		List<Board> myWrite(RowBounds rowBounds, int uno);
		
		// 페이징 처리 안 함 버전
		List<Board> myWrite(int uno);
		int myWriteCount(int uno);
		
		List<Reply> myComments(@Param("uno") int uno);
		int myCommentsCount(@Param("uno")int uno);


}
