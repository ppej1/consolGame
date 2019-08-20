package global.sesoc.ConsolGame.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.ConsolGame.dto.ConsolUser;

@Controller
public class MemberController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(ConsolUser user){
		System.out.println(user);
		return "index";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(){
		return "register";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(ConsolUser user){
		System.out.println(user);
		return "login";
	}	
	
	
}
