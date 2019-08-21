package global.sesoc.ConsolGame.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.LendConsol;
@Repository
public class GameListRepository {
	@Autowired
	SqlSession session;
	
	public ArrayList<ConsolGame> selectAll(ConsolGame consolGame) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.selectAll(consolGame);
	}

	public ConsolGame selectOneGame(ConsolGame consol) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.selectOneGame(consol);
	}

	public int reQuestlendGame(LendConsol lend) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		lend.setStatus("reserved");
		return mapper.reQuestlendGame(lend);
	}



}
