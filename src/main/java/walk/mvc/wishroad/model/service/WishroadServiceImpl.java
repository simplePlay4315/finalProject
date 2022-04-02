package walk.mvc.wishroad.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.aspectj.lang.annotation.Around;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import walk.mvc.around.model.mapper.AroundMapper;
import walk.mvc.common.util.PageInfo;
import walk.mvc.road.model.vo.Road;
import walk.mvc.wishroad.model.mapper.WishroadMapper;


@Service
public class WishroadServiceImpl implements WishroadService{
	
	@Autowired
	@Qualifier("wishroadMapper")
	private WishroadMapper mapper;

	@Override
	public int insertWishroad(int uno, int rdno) {
		return mapper.insertWishroad(uno, rdno);
	}
	
	@Override
	public List<Road> myWishRoad(PageInfo pageInfo, int uno) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		return mapper.myWishroad(rowBounds, uno);
	}

	@Override
	public int myWishroadCount(int uno) {
		return mapper.myWishroadCount(uno);
	}
	

}