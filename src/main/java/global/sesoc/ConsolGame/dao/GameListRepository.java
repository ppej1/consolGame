package global.sesoc.ConsolGame.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.ConsolGameStatusVO;
import global.sesoc.ConsolGame.dto.GameRank;
import global.sesoc.ConsolGame.dto.LendConsol;
import global.sesoc.ConsolGame.dto.LendConsolUser;
import global.sesoc.ConsolGame.dto.LendConsolUserTitle;
@Repository
public class GameListRepository {
	@Autowired
	SqlSession session;
	
	public ArrayList<ConsolGameStatusVO> selectAll(ConsolGame consolGame, String searchList, String searchItem) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchList", searchList);
		map.put("consolGame", consolGame);
		
		
		
		return mapper.selectAll(map);
	}

	public ConsolGameStatusVO selectOneGame(ConsolGame consol) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.selectOneGame(consol);
	}

	public int reQuestlendGame(LendConsol lend) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		lend.setStatus("reserved");
		return mapper.reQuestlendGame(lend);
	}

	public ArrayList<LendConsolUserTitle> RequestList(ConsolGame consolGame, String searchList, String searchItem) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchList", searchList);
		map.put("consolGame", consolGame);
		
		return mapper.RequestList(map);
	}

	public int confirmRequest(LendConsol lendConsol, String selectYN,  String selectDate) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		
		if(selectYN.equals("okBtn")){
			lendConsol.setStatus("lent");
		}else{
			lendConsol.setStatus("rejected");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("lendConsol", lendConsol);
		map.put("selectDate", selectDate);
		
		int result = mapper.confirmRequest(map);
		if (result == 1) {
			if (lendConsol.getStatus() =="lent") {
				LendConsol gamenum = mapper.selectlentGame(lendConsol);
				gamenum.setLend(lendConsol.getLend());
				map.put("gamenum",gamenum);
				map.put("after", "rejected");
				map.put("before", "reserved");
				int ok = mapper.chaingOtherRequest(map); 
				return ok;
			}
		}
		return result;
	}

	public ArrayList<LendConsolUserTitle> selectAllLent(LendConsol lendConsol, String searchList, String searchItem) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchList", searchList);
		map.put("lendConsol", lendConsol);
		map.put("status", "lent");
		return mapper.selectAllLent(map);
	}

	public int returnGame(LendConsol lendConsol) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("lendConsol", lendConsol);
		map.put("after", "returned");
		map.put("before", "lent");
		return mapper.returnGame(map); 
	}

	public ArrayList<LendConsolUser> selectAllUserlent(LendConsolUser user) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.selectAllUserlent(user); 
	}

	public void checkDelayLendForAllLentBook() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		mapper.checkDelayLendForAllLentBook();
	}

	public int returnDelayGame(LendConsol lendConsol) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("lendConsol", lendConsol);
		map.put("after", "delay_returned");
		map.put("before", "delayed");
		return mapper.returnGame(map);
	}

	public ArrayList<LendConsolUserTitle> selectAllDelay(LendConsol lendConsol, String searchList, String searchItem) {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		Map<String, Object> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchList", searchList);
		map.put("lendConsol", lendConsol);
		map.put("status", "delayed");
		return mapper.selectAllLent(map);
	}

	public int countUser() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.countUser();
	}

	public int countNewUser() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.countNewUser();
	}

	public int countConsol() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.countConsol();
	}

	public int countreserved() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.countreserved();
	}

	public int countAllLent() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.countAllLent();
	}

	public int rentCount() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.rentCount();
	}

	public int countReturned() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.countReturned();
	}

	public int countDelayed() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.countDelayed();
	}

	public int countDelayReturened() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.countDelayReturened();
	}

	public List<GameRank> getRank() {
		GameListMapper mapper = session.getMapper(GameListMapper.class);
		return mapper.getRank();
	}







}
