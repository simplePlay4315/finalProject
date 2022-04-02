package walk.mvc.wishroad.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.aspectj.lang.annotation.Around;

import walk.mvc.common.util.PageInfo;
import walk.mvc.road.model.vo.Road;

public interface WishroadService {
	
	public int insertWishroad(int uno, int rdno);

	//myWishRoad부분
	public List<Road> myWishRoad(PageInfo pageInfo, @Param("uno") int uno);
	public int myWishroadCount(@Param("uno") int uno);
	

}
