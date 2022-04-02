package walk.mvc.schedule.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import walk.mvc.schedule.model.mapper.ScheduleMapper;
import walk.mvc.schedule.model.vo.Schedule;


@Service
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	@Qualifier("scheduleMapper")
	private ScheduleMapper mapper;

	@Override
	public int insertSchedule(Schedule schedule) {
		return mapper.insertSchedule(schedule);
	}
	
	@Override
	public List<Schedule> scheduleListAll(String id) {
		return mapper.selectAll(id);
	}

	@Override
	public int deleteSchedule(int sno) {
		return mapper.deleteSchedule(sno);
	}

}