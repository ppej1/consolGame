package global.sesoc.ConsolGame.dao;

import java.util.List;

import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.LendConsol;

public interface GameListMapper {

	List<ConsolGame> selectAll(ConsolGame consolGame);

}
