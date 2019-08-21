package global.sesoc.ConsolGame.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.ConsolGame.dao.MemberRepository;
import global.sesoc.ConsolGame.dto.ConsolUser;

@Controller
public class MemberController {
	@Autowired
	MemberRepository repo;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(ConsolUser user, HttpSession session,Model model){
		System.out.println(user);
		ConsolUser result = repo.selectOneUser(user);
		System.out.println(result);
		if (result != null) {
			session.setAttribute("loginId", result.getUserid());
			session.setAttribute("loginName", result.getUsername());
			session.setAttribute("loginLevel", result.getUserlevel());
			session.setAttribute("loginnum", result.getUsernum());

			return "index";
		}else{
			model.addAttribute("fail", "아이디 또는 비밀번호가 틀립니다.");
		}
		return "login";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(){
		return "register";
	}
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signup(ConsolUser user){
		int result = repo.insertMember(user);
		if (result == 0) {
			return "register";
		}
		return "login";
	}	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "login";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model,ConsolUser user){
		user.setUserid((String)session.getAttribute("loginId"));
		ConsolUser result = repo.selectOneUser(user);
		model.addAttribute("loginUser",result);
		return "modify";
	}
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyform(HttpSession session, Model model,ConsolUser user){
		user.setUsernum((String)session.getAttribute("loginnum"));
		int result = repo.updateUser(user);
		if (result == 1) {
			return "redirect:/index";
		}
		return "modify";
	}	
}
