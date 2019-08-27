package global.sesoc.ConsolGame.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.ConsolGame.dao.GameListRepository;
import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.ConsolGameStatusVO;
import global.sesoc.ConsolGame.dto.GameRank;
import global.sesoc.ConsolGame.dto.LendConsol;
import global.sesoc.ConsolGame.dto.LendConsolUser;
import global.sesoc.ConsolGame.dto.LendConsolUserTitle;

@Controller
public class GameListController {
	@Autowired
	GameListRepository repo;
	
	/*이동 */
	@RequestMapping(value = "/gameList", method = RequestMethod.GET)
	public String gameList(){
		repo.checkDelayLendForAllLentBook();
		
		return "board/gameList";
	}
	
	@RequestMapping(value = "/disboard", method = RequestMethod.GET)
	public String disboard(Model model){
		repo.checkDelayLendForAllLentBook();
		int userCount = repo.countUser();
		int newuserCount = repo.countNewUser();
		int consolGamecount = repo.countConsol();
		int rendALLCount = repo.countAllLent();
		int reservedCount = repo.countreserved();
		int lentCount = repo.rentCount();
		int returnedCount = repo.countReturned();
		int delayedCount = repo.countDelayed();
		int delayedReturnCount = repo.countDelayReturened();
		int allRentCount = lentCount+returnedCount+delayedCount+delayedReturnCount;
		List<GameRank> rank = repo.getRank();
		
		model.addAttribute("reservedCount", reservedCount);
		model.addAttribute("consolGamecount", consolGamecount);
		model.addAttribute("userCount", userCount);
		model.addAttribute("newuserCount", newuserCount);
		model.addAttribute("lentRate", ((lentCount+delayedCount)/(double)rendALLCount)*100);
		model.addAttribute("reservedRate", (reservedCount/(double)rendALLCount)*100);
		model.addAttribute("returnCount", (returnedCount/(double)allRentCount)*100);
		model.addAttribute("delayedCount", (delayedCount/(double)allRentCount)*100);
		model.addAttribute("delayedreturnCount", (delayedReturnCount/(double)(delayedReturnCount+delayedCount))*100);
		model.addAttribute("rank",rank);
		return "board/disboard";
	}
	@RequestMapping(value = "/checkLend", method = RequestMethod.GET)
	public String checkLend(){
		repo.checkDelayLendForAllLentBook();
		return "board/checkLend";
	}
	@RequestMapping(value = "/lendList", method = RequestMethod.GET)
	public String lendList(){
		repo.checkDelayLendForAllLentBook();
		return "board/lendList";
	}
	@RequestMapping(value = "/lendRequestList", method = RequestMethod.GET)
	public String lendRequestList(){
		repo.checkDelayLendForAllLentBook();
		return "board/lendRequestList";
	}
	@RequestMapping(value = "/overdueList", method = RequestMethod.GET)
	public String overdueList(){
		repo.checkDelayLendForAllLentBook();
		return "board/overdueList";
	}
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo(){
		repo.checkDelayLendForAllLentBook();
		return "board/userInfo";
	}
	@RequestMapping(value = "/gamedetail", method = RequestMethod.GET)
	public String gamedetail(ConsolGame consol, Model model){
		repo.checkDelayLendForAllLentBook();
		ConsolGameStatusVO result = repo.selectOneGame(consol);
		model.addAttribute("game",result);
		return "board/gameDetail";
	}
	
	
	
	
	@RequestMapping(value = "/reQuestlendGame", method = RequestMethod.POST)
	public String reQuestlendGame(LendConsol lend, HttpSession session){
		repo.checkDelayLendForAllLentBook();
		lend.setUsernum((String) session.getAttribute("loginnum"));
		int result= repo.reQuestlendGame(lend);
		if (result ==1 ) {
			return "redirect:/gameList";
		}else{
			return null;
		}
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//ajax 
	//게임 리스트 
	@RequestMapping(value = "/listOfGame", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<ConsolGameStatusVO> listOfGame(ConsolGame consolGame, String searchList, String searchItem){
		repo.checkDelayLendForAllLentBook();
		ArrayList<ConsolGameStatusVO> list = repo.selectAll(consolGame,searchList,searchItem);

		return list;
	}
	//대여 신청 목록
	@RequestMapping(value = "/requestGame", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<LendConsolUserTitle> requestGame(ConsolGame consolGame, String searchList, String searchItem){
		repo.checkDelayLendForAllLentBook();
		ArrayList<LendConsolUserTitle> list = repo.RequestList(consolGame,searchList,searchItem);
		return list;
	}
	
	
	@RequestMapping(value = "/confirmRequest", method = RequestMethod.POST)
	@ResponseBody
	public String confirmRequest(LendConsol lendConsol, String selectYN, String selectDate){
		repo.checkDelayLendForAllLentBook();
		int result = repo.confirmRequest(lendConsol,selectYN,selectDate);
		if (result == 1) {
			return "success";
		}
		return "fail";
	}
	
	// 대여 목록
	@RequestMapping(value = "/listOfLent", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<LendConsolUserTitle> listOfLent(LendConsol lendConsol, String searchList, String searchItem){
		repo.checkDelayLendForAllLentBook();
		ArrayList<LendConsolUserTitle> list = repo.selectAllLent(lendConsol,searchList,searchItem);
		return list;
	}
	// 대여 목록 - 반납
	@RequestMapping(value = "/returnGame", method = RequestMethod.POST)
	@ResponseBody
	public String returnGame(LendConsol lendConsol){
		int result = repo.returnGame(lendConsol);
		if (result == 1) {
			return "success";
		}
		return "fail";
	}	
	
	//대여 이력 조회
	@RequestMapping(value = "/checkLend", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<LendConsolUser> checkLend(LendConsolUser user, HttpSession session){
		repo.checkDelayLendForAllLentBook();
		user.setUsernum((String)session.getAttribute("loginnum"));
		ArrayList<LendConsolUser> list = repo.selectAllUserlent(user);
		return list;
	}
	//연체 목록
	@RequestMapping(value = "/listOfdelay", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<LendConsolUserTitle> listOfdelay(LendConsol lendConsol, String searchList, String searchItem){
		repo.checkDelayLendForAllLentBook();
		ArrayList<LendConsolUserTitle> list = repo.selectAllDelay(lendConsol,searchList,searchItem);
		return list;
	}	
	
	//연체
	@RequestMapping(value = "/returnDelayGame", method = RequestMethod.POST)
	@ResponseBody
	public String returnDelayGame(LendConsol lendConsol){
		System.out.println(lendConsol);
		int result = repo.returnDelayGame(lendConsol);
		if (result == 1) {
			return "success";
		}
		return "fail";
	}	
}
