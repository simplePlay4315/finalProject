package walk.mvc.around.model.service;

import java.util.List;
import java.util.Map;

import walk.mvc.common.util.PageInfo;

import walk.mvc.around.model.vo.Around;
import walk.mvc.around.model.vo.AroundScheduleJoin;

public interface AroundService {
	
	public int insertAround(Around around);
	
	public List<Around> aroundSearchList(PageInfo pageInfo,String keyword);
	
	public int aroundSearchListCount(String keyword);
	
	public int insertS_Around(Map<String,Object> map);
	
	public List<AroundScheduleJoin> myTripList(String id);

}
