package walk.mvc.road.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import walk.mvc.common.util.PageInfo;
import walk.mvc.road.model.vo.Road;

public interface RoadService {
	
	public Road roadInfoByNo(int rdno);

	//-------------------------------------------------------------------------------------------------------------
	// 메인 기능 추가 부분
	List<Road> searchRoadList(String level, String runTime, String s_location, String crsLength, String roadNm, 
								PageInfo pageInfo);

	List<Road> themeClick(PageInfo pageInfo, String theme);

	List<Road> allRoadList(PageInfo pageInfo);

	int roadCount(String level, String runTime, String s_location, String crsLength, String roadNm);

	int allRoadCount();
	
	int themeClickCount(@Param("theme") String theme);
}
