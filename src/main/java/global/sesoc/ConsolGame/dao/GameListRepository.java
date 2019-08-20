package global.sesoc.ConsolGame.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.LendConsol;
@Repository
public class GameListRepository {
	@Autowired
	SqlSession session;
	
	public List<ConsolGame> selectAll(ConsolGame consolGame) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.selectAll(consolGame);
	}

}
