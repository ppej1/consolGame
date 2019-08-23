package global.sesoc.ConsolGame.dao;

import java.util.ArrayList;
import java.util.Map;

import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.LendConsol;

public interface GameListMapper {

	ArrayList<ConsolGame> selectAll(Map<String, Object> map);

	ConsolGame selectOneGame(ConsolGame consol);

	int reQuestlendGame(LendConsol lend);

	ArrayList<LendConsol> RequestList(Map<String, Object> map);

	int confirmRequest(LendConsol lendConsol);


}
