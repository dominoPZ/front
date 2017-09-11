package pizza.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;


import pizza.service.impl.Daotest;

public interface Service {
	

	//
	int test(Map map) throws Exception;

	List<PizzaMenuList> menuList(Map map) throws Exception;
	
	int selectaddr(Map map) throws Exception;

}
