package test2;

import java.util.HashMap;
import java.util.List;

public interface TestService {
	
	public List<TestVO> getList();
	
	//동적 조회
	public List<TestVO> getEmpDynamicwhere(HashMap<String, String> map);
	
	public List<TestVO> vinfoinsert(HashMap<String, Object> map);
	
}
