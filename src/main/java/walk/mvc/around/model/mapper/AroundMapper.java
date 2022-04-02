package walk.mvc.around.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import walk.mvc.around.model.vo.Around;
import walk.mvc.around.model.vo.AroundScheduleJoin;



@Mapper
public interface AroundMapper {
	public int insertAround(Around around);
	public List<Around> aroundSearchList(RowBounds rowBounds, String keyword);
	public int aroundSearchListCount(String keyword);
	public int insertS_Around(Map<String,Object> map);
	public List<AroundScheduleJoin> myTripList(String id);
}
