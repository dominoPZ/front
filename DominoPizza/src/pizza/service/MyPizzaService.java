package pizza.service;

import java.util.List;
import java.util.Map;

public interface MyPizzaService {
	//목록용]
	List<MyPizzaDTO> selectList(Map map);
	//상세보기용]
	MyPizzaDTO selectOne(MyPizzaDTO dto);
	//입력/수정/삭제용]
	int insert(MyPizzaDTO dto);
	int update(MyPizzaDTO dto);
	int delete(MyPizzaDTO dto);
}
