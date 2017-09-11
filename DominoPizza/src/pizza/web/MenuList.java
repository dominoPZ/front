package pizza.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pizza.service.BasketDTO;
import pizza.service.DoughDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaDTO;
import pizza.service.PizzaMenuList;
import pizza.service.impl.Daotest;
import pizza.service.impl.ServiceImpl;

@Controller
public class MenuList {
	
	@Resource(name="service")
	private ServiceImpl service;
	
/*	@RequestMapping("/test.pz")
	public String test() throws Exception{
		
		Map map = new HashMap();
		map.put("id", "test");
		service.test(map);
		return "/Pizza/view/Mainpage.jsp";
	}*/
	
	@RequestMapping("/menuList.pz")
	public String menuList(Model model, HttpServletRequest req) throws Exception{
		int ty=0;
		if(req.getParameter("ty")!=null)
		ty = Integer.parseInt(req.getParameter("ty"));
		System.out.println(ty);
		System.out.println(req.getServletContext().getRealPath("/Mypizza"));
		String sel="";
		String fro = "";
		String whe = "";
		req.setAttribute("pages", ty);
		if(ty==101) {
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P.P_NO ";
			fro = " pizza p join pizza_dough pd on p.p_no = pd.p_no join dough d on d.dough_no = pd.dough_no ";
			whe = " d.dough_no=4 ";
			req.setAttribute("gok", 1);
			req.setAttribute("bimg", "곡물베너.png");
		}
		else if(ty==102) {
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P_NO ";
			fro = " pizza p ";
			whe = " p_kind = '프리미엄' ";
			req.setAttribute("bimg", "프리미엄베너.png");
		}else if(ty==103) {
			sel = " P_NAME,P_SPRICE,P_LPRICE,P_IMG,P_NO ";
			fro = " pizza p ";
			whe = " p_kind = '클래식' ";
			req.setAttribute("bimg", "클래식베너.png");
		}else if(ty==104) {
			sel = " S_NAME,S_PRICE,S_IMG ";
			fro = " SIDE S ";
			req.setAttribute("bimg", "사이드베너.png");
		}
		
		Map map = new HashMap();
		String a = "1";
		map.put("P_LIST", "1");
		map.put("sel", sel);
		map.put("whe", whe);
		map.put("fro", fro);
		map.put("ty",ty);
		System.out.println("dao 전");
		
		
		List<PizzaMenuList> list = service.menuList(map);
		
		model.addAttribute("dto",list);
		
		String ret = "";
		
		if(ty==104)
		ret = "/WEB-INF/Pizza/view/Menu/Side_Menu.jsp";
		else
		ret= "/WEB-INF/Pizza/view/Menu/Pizza_Menu.jsp";
		
		return ret;
	}
	
	@RequestMapping("/AddrSelect.pz")
	public String AddrSelect(@RequestParam Map map, Model model, HttpServletRequest req) throws Exception{
		service.addrselect(map);
		
		
		return null;
		
	}
	
	
	@RequestMapping("/PizzaView.pz")
	public String PizzaView(@RequestParam Map map, Model model, HttpServletRequest req) throws Exception{
		if(!(req.getParameter("gok").length()>0))
		req.setAttribute("listval", 1);
		else
			req.setAttribute("listval", 4);
		
		PizzaDTO dto = service.pizzaview(map);
		
		List<DoughDTO> list = new Vector<DoughDTO>();
		List<PNutrientDTO> listpn = new Vector<PNutrientDTO>();
		
		listpn = service.pnutrient(map);
		
		list = service.doughlist(map);
		
		model.addAttribute("listpn",listpn);
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		return "/WEB-INF/Pizza/view/Menu/PizaaView.jsp";
		
	}
	
	
	@RequestMapping("/Basket.pz")
	public String Basket(@RequestParam Map map, HttpServletRequest req , HttpSession session) throws Exception{
		BasketDTO dto = new BasketDTO();
		dto.setDough(map.get("dough").toString());
		dto.setImg(map.get("img").toString());
		dto.setName(map.get("na").toString());
		String price="";
		char[] pri = map.get("price").toString().toCharArray();
		for(char cha : pri) {
			if(cha >= '0' && cha <= '9')
				price+=cha;
		}
		System.out.println(price);
		dto.setPrice(price);
		dto.setQty(map.get("qty").toString());
		dto.setSize(map.get("size").toString().toUpperCase().contains("L")?"L":"M");
		dto.setTopping(map.get("topping").toString());
		dto.setKind(map.get("kind").toString());
		dto.setDoughno(map.get("doughno").toString());
		List<BasketDTO> list = new Vector<>();
		if(session.getAttribute("list")!=null)
		list=(List<BasketDTO>)session.getAttribute("list");
		list.add(dto);
		req.setAttribute("list", list);
		session.setAttribute("list", list);
		session.setAttribute("num", list.size());
		return "/WEB-INF/Pizza/view/Menu/Basket.jsp";
	}
	
	
	@RequestMapping("Project.pz")
	public String Project(@RequestParam Map map, HttpSession session)  throws Exception {

		List<BasketDTO> list = (List<BasketDTO>)session.getAttribute("list");
		int i = 0;
		int k = 0;
		String id=session.getAttribute("ID").toString();
		
		Map maps= new HashMap<>();
		maps.put("id", id);
		maps.put("st_no", 3);
		maps.put("sa_addr", "서울특별시 금천구 가산동 월드메르디앙");
		i = service.sinsert(maps);
		for(BasketDTO dto : list ) {
			System.out.println("??");
	
			String price="";
			char[] pri = dto.getPrice().toCharArray();
			for(char cha : pri) {
				if(cha >= '0' && cha <= '9')
					price+=cha;
			}
			dto.setPrice(price);
			System.out.println(price);
			System.out.println(dto.getDoughno());
			

			
			// 5 - 2 - 4  직화스테이크 곡물도우

			System.out.println(dto.getQty());
			System.out.println("ASD");
			System.out.println("kind="+dto.getKind());
			System.out.println("");
			System.out.println("dougno="+dto.getDoughno());
			
			if(i==1) {
				k = service.stinsert(dto);
			}
			System.out.println("ASDasdasd");
		}
		
		return "/Pizza/MainPage.pz";
	}
	
	
}
