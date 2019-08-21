package global.sesoc.ConsolGame.dao;

import java.util.ArrayList;

import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.LendConsol;

public interface GameListMapper {

	ArrayList<ConsolGame> selectAll(ConsolGame consolGame);

	ConsolGame selectOneGame(ConsolGame consol);

	int reQuestlendGame(LendConsol lend);


}
