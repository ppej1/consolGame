package global.sesoc.ConsolGame.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LendConsol {
	int lend;
	String usernum;
	String startdate;
	String enddate;
	String returndate;
	String status;
	int gamenum;
	ConsolUser user;
	ConsolGame game;
}
