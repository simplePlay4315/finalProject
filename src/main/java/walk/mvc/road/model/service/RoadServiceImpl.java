package walk.mvc.road.model.service;

import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import walk.mvc.common.util.PageInfo;
import walk.mvc.road.model.mapper.RoadMapper;
import walk.mvc.road.model.vo.Road;

@Service
public class RoadServiceImpl implements RoadService {

	@Autowired
	@Qualifier("roadMapper")
	private RoadMapper mapper;
	
	@Override
	public Road roadInfoByNo(int rdno) {
		return mapper.roadInfoByNo(rdno);
	}

	//-------------------------------------------------------------------------------------------------------------
	// 메인 기능 추가 부분
	public List<Road> searchRoadList(String level, String runTime, String s_location, String crsLength, String roadNm,
										PageInfo pageInfo){
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		StringTokenizer stTime = new StringTokenizer(runTime, "~");
		String fTime = stTime.nextToken();
		String lTime = stTime.nextToken();
//		System.out.println("이상 시간 : " + fTime + "이하 시간 : " + lTime);
		
		StringTokenizer stLength = new StringTokenizer(crsLength, "~");
		String fLength = stLength.nextToken();
		String lLength = stLength.nextToken();
//		System.out.println("이상 거리 : " + fLength + "이하 거리 : " + lLength);
		
		if(roadNm.equals("")) {
//			System.out.println("null값입니다.");
			roadNm = " ";
		} else {
//			System.out.println("null이 아닙니다.");
			roadNm = "AND ROADNM LIKE '%" + roadNm + "%'";
		}
//		System.out.println(roadNm);
		
		return mapper.searchRoadList(level, fTime, lTime, s_location, fLength, lLength, roadNm, rowBounds);
	}

	@Override
	public List<Road> themeClick(PageInfo pageInfo, String theme) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return mapper.themeClick(rowBounds, theme);
	}

	@Override
	public List<Road> allRoadList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return mapper.allRoadList(rowBounds);
	}

	@Override
	public int roadCount(String level, String runTime, String s_location, String crsLength, String roadNm) {
		StringTokenizer stTime = new StringTokenizer(runTime, "~");
		String fTime = stTime.nextToken();
		String lTime = stTime.nextToken();
		
		StringTokenizer stLength = new StringTokenizer(crsLength, "~");
		String fLength = stLength.nextToken();
		String lLength = stLength.nextToken();
		
		if(roadNm.equals("")) {
			roadNm = " ";
		} else {
			roadNm = "AND ROADNM LIKE '%" + roadNm + "%'";
		}
		
		return mapper.roadCount(level, fTime, lTime, s_location, fLength, lLength, roadNm);
	}

	@Override
	public int allRoadCount() {
		return mapper.allRoadCount();
	}

	@Override
	public int themeClickCount(String theme) {
		return mapper.themeClickCount(theme);
	}
}
