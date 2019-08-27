package global.sesoc.ConsolGame.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.ConsolGameStatusVO;
import global.sesoc.ConsolGame.dto.GameRank;
import global.sesoc.ConsolGame.dto.LendConsol;
import global.sesoc.ConsolGame.dto.LendConsolUser;
import global.sesoc.ConsolGame.dto.LendConsolUserTitle;

public interface GameListMapper {

	ArrayList<ConsolGameStatusVO> selectAll(Map<String, Object> map);

	ConsolGameStatusVO selectOneGame(ConsolGame consol);

	int reQuestlendGame(LendConsol lend);

	ArrayList<LendConsolUserTitle> RequestList(Map<String, Object> map);

	int confirmRequest(Map<String, Object> map);

	LendConsol selectlentGame(LendConsol lendConsol);

	int chaingOtherRequest(Map<String, Object> map);

	ArrayList<LendConsolUserTitle> selectAllLent(Map<String, Object> map);

	int returnGame(Map<String, Object> map);

	ArrayList<LendConsolUser> selectAllUserlent(LendConsolUser user);

	void checkDelayLendForAllLentBook();

	int countUser();

	int countNewUser();

	int countConsol();

	int countreserved();

	int countAllLent();

	int rentCount();

	int countReturned();

	int countDelayed();

	int countDelayReturened();

	List<GameRank> getRank();



}
