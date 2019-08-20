package global.sesoc.ConsolGame.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class gameListController {
	
	
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
}
