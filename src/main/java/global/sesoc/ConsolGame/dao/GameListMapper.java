package global.sesoc.ConsolGame.dao;

import java.util.ArrayList;

import global.sesoc.ConsolGame.dto.ConsolGame;

public interface GameListMapper {

	ArrayList<ConsolGame> selectAll(ConsolGame consolGame);


}
