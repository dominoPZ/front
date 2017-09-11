package pizza.service;

import java.util.List;
import java.util.Map;

public interface ToppingService {
	//목록용]
	List<ToppingDTO> selectList(Map map);
	//상세보기용]
	ToppingDTO selectOne(ToppingDTO dto);
	//입력/수정/삭제용]
	int insert(ToppingDTO dto);
	int update(ToppingDTO dto);
	int delete(ToppingDTO dto);
}
