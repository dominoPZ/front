package pizza.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainPageForward {

	@RequestMapping("/Pizza/MainPage.pz")
	public String main() throws Exception{
		
		return "/WEB-INF/Pizza/view/Mainpage.jsp";
	}
	
}
