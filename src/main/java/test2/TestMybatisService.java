package test2;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestMybatisService implements TestService{
	
	@Autowired
	TestDAO dao;

	public void setDao(TestDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<TestVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TestVO> getEmpDynamicwhere(HashMap<String, String> map) {
		return dao.getEmpDynamicwhere(map);
	}

	@Override
	public List<TestVO> vinfoinsert(HashMap<String, Object> map) {
		return dao.insertvinfo(map);
	}


}
