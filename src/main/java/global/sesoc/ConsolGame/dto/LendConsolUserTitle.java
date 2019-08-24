package global.sesoc.ConsolGame.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LendConsolUserTitle {
	int lend;
	int gamenum;
	String usernum;
	String startdate;
	String enddate;
	String returndate;
	String status;
	String gametitle;
	String username; 
}
