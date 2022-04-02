package walk.mvc.member.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import walk.mvc.board.model.vo.Board;
import walk.mvc.board.model.vo.Reply;
import walk.mvc.member.model.mapper.MemberMapper;
import walk.mvc.member.model.vo.Member;

//@Service ("MemberService") // MemberService를 상속받은 Class가 2개 이상인 경우 네이밍 지정 필요
//@Service ("AdminMemberService")

@Service
public class MemberSerivceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	
	
	//1. Login Simple Version
	/*@Override
	public Member login(String id, String pwd) {
		Member member = this.findById(id);
		if(member != null && member.getPassword().equals(pwd)) {
			return member; 
		} else {
			return null;	
		}
	}*/
	
	
	//2. Password encoder를 사용한 로그인 구현 방법
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder; //SHA - 256

	
	@Override
	public Member login(String id, String pwd) {
		
		
		//passwordEncoder 활용법
		
		Member member = this.findById(id);
		
		if(member == null) {
			return null; 
		}
		
		System.out.println(member.getPassword());
		
		//encode를 통해 평문에서 암호문으로 바꿈
		System.out.println(passwordEncoder.encode(pwd));
		
		//파라메터(pwd) 암호화 후 기존 기존 암호와 비교하는 코드
		System.out.println(passwordEncoder.matches(pwd, member.getPassword()));
		
//		return member != null && 
//				passwordEncoder.matches(pwd, member.getPassword()) ? member : null;
		
		if(member != null && passwordEncoder.matches(pwd, member.getPassword()) == true) {
			return member;
		} else {
			return null;
		}
	}

	
	/*@transactional
	 * 1. C, U, D( insert, update, Delete) 수행 시 예외가 발생할 경우 자동으로 롤백지원
	 * 2. db의 무결성을 유지하기 위해서 각종 옵션을 선택할 수 있는 어노테이션
	 *    -> DB를 동시적으로 사용할 때 DB 정보를 보호하기 위하여 사용하는 옵션
	 *    -> 무결성은 항상 성능과 반비례
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int save(Member member) {
	
		int result = 0;
		if(member.getNo() != 0) {
			result = mapper.updateMember(member);
		} else {
			String endodePwd = passwordEncoder.encode(member.getPassword());
			member.setPassword(endodePwd);
			result = mapper.insertMember(member);
		}
		
		return result;
	}
	
	@Override
	public boolean validate(String userId) {
		return this.findById(userId) != null;
	}

	@Override
	public Member findById(String id) {
		return mapper.selectMember(id);
	}

	@Override
	@Transactional (rollbackFor = Exception.class)
	public int delete(int no) {
		return mapper.deleteMember(no);
	}
	
	//myBoard
		@Override
		public List<Board> myWrite(RowBounds rowBounds, int uno) {
			return mapper.myWrite(rowBounds, uno);
		}
		
		//myBoard : 페이징 처리 안 함
		@Override
		public List<Board> myWrite(int uno) {
			return mapper.myWrite(uno);
		}


		@Override
		public int myWriteCount(int uno) {
			return mapper.myWriteCount(uno);
		}


		@Override
		public List<Reply> myComments(int uno) {
			return mapper.myComments(uno);
		}


		@Override
		public int myCommentsCount(int uno) {
			return mapper.myCommentsCount(uno);
		}

}
