package walk.mvc.schedule.model.service;

import java.util.List;

import walk.mvc.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	public int insertSchedule(Schedule schedule);
	List<Schedule> scheduleListAll(String id);
	int deleteSchedule(int sNo);  

}
