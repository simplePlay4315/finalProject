package walk.mvc.wishroad.model.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import walk.mvc.road.model.vo.Road;

@Mapper
public interface WishroadMapper {
	
	public int insertWishroad(@Param("uno") int uno, @Param("rdno") int rdno);
	
	//----------myWishroad 추가 부분
	public List<Road> myWishroad(RowBounds rowBounds, @Param("uno") int uno);
	public int myWishroadCount(@Param("uno") int uno);
}
