package walk.mvc.schedule.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import walk.mvc.schedule.model.vo.Schedule;

@Mapper
public interface ScheduleMapper {
	
	public int insertSchedule(Schedule schedule);
	List<Schedule> selectAll(String id);
	int deleteSchedule(int sno); 
}
