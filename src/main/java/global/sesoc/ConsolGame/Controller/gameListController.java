package global.sesoc.ConsolGame.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.ConsolGame.dao.GameListRepository;
import global.sesoc.ConsolGame.dto.ConsolGame;
import global.sesoc.ConsolGame.dto.LendConsol;

@Controller
public class GameListController {
	@Autowired
	GameListRepository repo;
	
	/*이동 */
	@RequestMapping(value = "/gameList", method = RequestMethod.GET)
	public String gameList(){
		
		return "board/gameList";
	}
	
	@RequestMapping(value = "/disboard", method = RequestMethod.GET)
	public String disboard(){
		
		return "board/disboard";
	}
	@RequestMapping(value = "/chart", method = RequestMethod.GET)
	public String chart(){
		
		return "board/chart";
	}	
	@RequestMapping(value = "/checkLend", method = RequestMethod.GET)
	public String checkLend(){
		
		return "board/checkLend";
	}
	@RequestMapping(value = "/lendList", method = RequestMethod.GET)
	public String lendList(){
		
		return "board/lendList";
	}
	@RequestMapping(value = "/lendRequestList", method = RequestMethod.GET)
	public String lendRequestList(){
		
		return "board/lendRequestList";
	}
	@RequestMapping(value = "/overdueList", method = RequestMethod.GET)
	public String overdueList(){
		
		return "board/overdueList";
	}
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo(){
		
		return "board/userInfo";
	}
	@RequestMapping(value = "/gamedetail", method = RequestMethod.GET)
	public String gamedetail(ConsolGame consol, Model model){
		ConsolGame result = repo.selectOneGame(consol);
		model.addAttribute("game",result);
		System.out.println(result);
		return "board/gameDetail";
	}
	
	
	
	
	@RequestMapping(value = "/reQuestlendGame", method = RequestMethod.POST)
	public String reQuestlendGame(LendConsol lend, HttpSession session){
		lend.setUsernum((String) session.getAttribute("loginnum"));
		System.out.println(lend);
		int result= repo.reQuestlendGame(lend);
		if (result ==1 ) {
			return "redirect:/gameList";
		}else{
			return null;
		}
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//ajax 
	@RequestMapping(value = "/listOfGame", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<ConsolGame> listOfGame(ConsolGame consolGame, String searchList, String searchItem){
		System.out.println("리스트 : "+ searchList + " 아이템 : " + searchItem);

		ArrayList<ConsolGame> list = repo.selectAll(consolGame,searchList,searchItem);
		System.out.println(list);
		return list;
	}
	
}
