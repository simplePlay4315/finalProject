package walk.mvc.road.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Road {

	private int rdNo;
	private String roadNm;
	private String crsLength;
	private String runTime;
	private String level;
	private String intro;
	private String s_location;
	private String f_location;
	private String circle;
	private String theme;
	private String crsPic;
	private String route;
	private int likes;
	private String mapx;
	private String mapy;

	
}
