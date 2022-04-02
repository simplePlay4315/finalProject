package walk.mvc.schedule.model.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Schedule {
	
	private int sno;
	private String title;
	private String id;
	
	@DateTimeFormat(pattern="yyyy-mm-dd")
	private Date s_date;
	
	private int rdNo;
	private String roadNm;
	private String around;
}
