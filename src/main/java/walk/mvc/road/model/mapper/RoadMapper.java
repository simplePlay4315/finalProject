package walk.mvc.road.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import walk.mvc.road.model.vo.Road;

@Mapper
public interface RoadMapper {
	
	public Road roadInfoByNo(int rdno);
	
	//-------------------------------------------------------------------------------------------------------------
	// 메인 기능 추가 부분
	List<Road> searchRoadList(@Param("level") String level, @Param("fTime") String fTime, @Param("lTime") String lTime,
					@Param("s_location") String s_location, @Param("fLength") String fLength, @Param("lLength") String lLength,
					@Param("roadNm") String roadNm,
					RowBounds rowBounds);
	
	List<Road> themeClick(RowBounds rowBounds, @Param("theme") String theme);
	
	List<Road> allRoadList(RowBounds rowBounds);

	int roadCount(@Param("level") String level, @Param("fTime") String fTime, @Param("lTime") String lTime,
					@Param("s_location") String s_location, @Param("fLength") String fLength, @Param("lLength") String lLength,
					@Param("roadNm") String roadNm);
	
	int allRoadCount();
	
	int themeClickCount(@Param("theme") String theme);

}
