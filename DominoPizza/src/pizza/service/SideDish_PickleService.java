package pizza.service;

import java.util.List;
import java.util.Map;

public interface SideDish_PickleService {
	//목록용]
	List<SideDish_PickleDTO> selectList(Map map);
	//상세보기용]
	SideDish_PickleDTO selectOne(SideDish_PickleDTO dto);
	//입력/수정/삭제용]
	int insert(SideDish_PickleDTO dto);
	int update(SideDish_PickleDTO dto);
	int delete(SideDish_PickleDTO dto);
}
