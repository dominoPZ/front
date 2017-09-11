package pizza.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pizza.service.MyPizzaDTO;
import pizza.service.SideDish_BeverageDTO;
import pizza.service.SideDish_PickleDTO;
import pizza.service.SideDish_SauceDTO;
import pizza.service.ToppingDTO;
import pizza.service.impl.MyPizzaServiceImpl;
import pizza.service.impl.SideDish_BeverageServiceImpl;
import pizza.service.impl.SideDish_PickleServiceImpl;
import pizza.service.impl.SideDish_SauceServiceImpl;
import pizza.service.impl.ToppingServiceImpl;

@Controller
public class MyPizzaController {
	@Resource(name="myPizzaService")
	private MyPizzaServiceImpl pizzaService;
	@Resource(name="toppingService")
	private ToppingServiceImpl toppService;
	@Resource(name="sideDish_BeverageService")
	private SideDish_BeverageServiceImpl sdds_Bvrg;
	@Resource(name="sideDish_PickleService")
	private SideDish_PickleServiceImpl sdds_Pickle;
	@Resource(name="sideDish_SauceService")
	private SideDish_SauceServiceImpl sdds_Sauce;
	
	//사이드 디쉬-음료페이지
	@RequestMapping("/Pizza/Menu/sidedish_beverage.pz")
	public String sidedish_beverage(Map map) throws Exception{
		List<SideDish_BeverageDTO> list = sdds_Bvrg.selectList(map);
		map.put("bvrg", list);
		return "/WEB-INF/Pizza/view/Menu/list_siddsh_bvrg.jsp";
	}
	
	//사이드 디쉬-피클&소스페이지
	@RequestMapping("/Pizza/Menu/sidedish_pickleNSouce.pz")
	public String sidedish_pickleNSouce(Map map) throws Exception{
		List<SideDish_PickleDTO> pickleList = sdds_Pickle.selectList(map);
		List<SideDish_SauceDTO> sauceList = sdds_Sauce.selectList(map);
		map.put("pickle", pickleList);
		map.put("sauce", sauceList);
		return "/WEB-INF/Pizza/view/Menu/list_siddsh_picNsce.jsp";
	}
	
	
	//하프앤하프 메뉴
	@RequestMapping("/Pizza/BuyPizza/hnh.pz")
	public String halfNHalf(Map map) throws Exception{
		//첫번째 피자 리스트 출력용]
		List<MyPizzaDTO> list = pizzaService.selectList(map);
		map.put("pizzaList", list);
		
		
		return "/WEB-INF/Pizza/view/BuyPizza/hnh.jsp";
	}
	//하프앤하프&마이키친페이지에서 장바구니 담기
	@RequestMapping("/Pizza/BuyPizza/addCart.pz")
	public String addCart(HttpSession session, Map map) throws Exception{
		if(session.getAttribute("id") == null || session.getAttribute("id") == ""){
			return "/WEB-INF/Pizza/view/BuyPizza/login.jsp";
		}
		
		return "/WEB-INF/Pizza/view/BuyPizza/basket.jsp";
	}	
	
	//마이키친 메뉴
	@RequestMapping("/Pizza/BuyPizza/mykitchen.pz")
	public String myKitchen() throws Exception{
		
		
		return "/WEB-INF/Pizza/view/BuyPizza/mykitchen.jsp";
	}
	//마이키친 영양성분
	@RequestMapping("/Pizza/BuyPizza/mykitchen_mkIngredient.pz")
	public String mykitchen_mkIngredient() throws Exception{
		
		
		return "/WEB-INF/Pizza/view/BuyPizza/mkIngredient.jsp";
	}
	//마이키친 토핑 추가하기
	@RequestMapping("/Pizza/BuyPizza/mykitchen_mkToppingLayer.pz")
	public String mykitchen_addTopping() throws Exception{
		
		
		return "/WEB-INF/Pizza/view/BuyPizza/mkToppingLayer.jsp";
	}
	
	
	//추가토핑안내 메뉴
	@RequestMapping("/Pizza/BuyPizza/topping.pz")
	public String addTopping(Map map1) throws Exception{
		//토핑 리스트 출력용]
		List<ToppingDTO> list = toppService.selectList(map1);
		List list1 = new Vector();
		String name = "";
		Map map = null;
		for(ToppingDTO dto: list){
			if( !name.equals(dto.getT_name().toString())){
				map = new HashMap();
				map.put("t_name",dto.getT_name());
				map.put(dto.getT_size()+"Price",dto.getT_price());
				map.put(dto.getT_size()+"Gram",dto.getT_gram());
				name = dto.getT_name();
				list1.add(map);
			}else{
				map.put(dto.getT_size()+"Price",dto.getT_price());
				map.put(dto.getT_size()+"Gram",dto.getT_gram());
				name = dto.getT_name();
			}
		}
		map1.put("toppingList", list1);
		return "/WEB-INF/Pizza/view/BuyPizza/topping.jsp";
	}
	
	//마이키친 토핑 추가하기
	@RequestMapping("/Pizza/BuyPizza/ecoupon.pz")
	public String ecoupon() throws Exception{
		
		
		return "/WEB-INF/Pizza/view/BuyPizza/ecoupon.jsp";
	}	
	
	
	
	
	
	
}