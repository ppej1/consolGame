package global.sesoc.ConsolGame.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GameRank {
	
	int rank;
	int gamenum;
	String gametitle;
}
