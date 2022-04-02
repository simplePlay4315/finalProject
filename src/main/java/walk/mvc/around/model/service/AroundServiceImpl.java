package walk.mvc.around.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import walk.mvc.around.model.mapper.AroundMapper;
import walk.mvc.around.model.vo.Around;
import walk.mvc.around.model.vo.AroundScheduleJoin;
import walk.mvc.common.util.PageInfo;


@Service
public class AroundServiceImpl implements AroundService{
	
	@Autowired
	@Qualifier("aroundMapper")
	private AroundMapper mapper;
	
	public int insertAround(Around around){
		return mapper.insertAround(around);
	}
	
	
	public int insertS_Around(Map<String,Object> map) {
		return mapper.insertS_Around(map);
	}

	@Override
	public List<AroundScheduleJoin> myTripList(String id) {
		return mapper.myTripList(id);
	}

	@Override
	public List<Around> aroundSearchList(PageInfo pageInfo, String keyword) {
		int offset = (pageInfo.getCurrentPage()-1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return mapper.aroundSearchList(rowBounds, keyword);
	}

	@Override
	public int aroundSearchListCount(String keyword) {
		return mapper.aroundSearchListCount(keyword);
	}



	}