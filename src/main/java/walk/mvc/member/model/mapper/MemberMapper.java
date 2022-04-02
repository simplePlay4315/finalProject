package walk.mvc.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import walk.mvc.board.model.vo.Board;
import walk.mvc.board.model.vo.Reply;
import walk.mvc.member.model.vo.Member;


/* DAO 생성없이 마이바티스 - Spring 연동하는 방법
 * @Mapper 사용
 * 
 * Mapper 생성요령
 * 1. interface 패키지 + 이름과 mapper.xml의 namespace 일치
 *    -><mapper namespace="com.kh.mvc.board.model.mapper.BoardMapper">
 * 2. xml에 있는 쿼리문과 interface에 있는 메소드 이름이 일치해야함
 * 3. 인자가 있는 경우 인자이름과 메소드 인자이름을 통일시켜야 함
 *    예외1 : RowBounds 사용시 일치하지 않아도 됨
 *    예외2 : resultMap 컬렉션을 받을 때는 컬렉션으로 선언
 * 4. @Mapper를 반드시 붙여야 함
 */

@Mapper
public interface MemberMapper {
	
	int selectCount();
	List<Member> selectAll();
	Member selectMember(@Param("id") String id);
	int insertMember(Member Member);
	int updateMember(Member Member);
	int deleteMember(@Param("no") int no);
	
	
	//my board list
		/* 페이징처리용 */
		List<Board> myWrite(RowBounds rowBounds,@Param("uno") int uno);
		/* 페이징처리 안 함*/
		List<Board> myWrite(@Param("uno") int uno);
		int myWriteCount(@Param("uno")int uno);
		
		//my reply List
		List<Reply> myComments(@Param("uno") int uno);
		int myCommentsCount(@Param("uno")int uno);


}
