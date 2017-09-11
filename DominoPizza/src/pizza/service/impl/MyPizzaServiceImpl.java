package pizza.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import pizza.service.MyPizzaDTO;
import pizza.service.MyPizzaService;

@Service("myPizzaService")
public class MyPizzaServiceImpl implements MyPizzaService{
	@Resource(name="myPizzaDAO")
	private MyPizzaDAO dao;
	@Override
	public List<MyPizzaDTO> selectList(Map map) {
		return dao.selectList(map);
	}
	@Override
	public MyPizzaDTO selectOne(MyPizzaDTO dto) {
		return dao.selectOne(dto);
	}
	@Override
	public int insert(MyPizzaDTO dto) {
		return dao.insert(dto);
	}
	@Override
	public int update(MyPizzaDTO dto) {
		return dao.update(dto);
	}
	@Override
	public int delete(MyPizzaDTO dto) {
		return dao.delete(dto);
	}
}
