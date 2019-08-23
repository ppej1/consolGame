package global.sesoc.ConsolGame.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.LendConsol;
@Repository
public class GameListRepository {
	@Autowired
	SqlSession session;
	
	public ArrayList<ConsolGame> selectAll(ConsolGame consolGame, String searchList, String searchItem) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchList", searchList);
		map.put("consolGame", consolGame);
		
		
		
		return mapper.selectAll(map);
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

	public ArrayList<LendConsol> RequestList(ConsolGame consolGame, String searchList, String searchItem) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchList", searchList);
		map.put("consolGame", consolGame);
		
		return mapper.RequestList(map);
	}

	public int confirmRequest(LendConsol lendConsol, String selectYN) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		
		if(selectYN.equals("okBtn")){
			lendConsol.setStatus("lent");
		}else{
			lendConsol.setStatus("rejected");
		}
		
		return mapper.confirmRequest(lendConsol);
	}



}
