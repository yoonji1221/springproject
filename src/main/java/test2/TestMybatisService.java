package test2;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vinfo.VinfoVO;

@Service
public class TestMybatisService implements TestService{
	
	@Autowired
	TestDAO dao;

	public void setDao(TestDAO dao) {
		this.dao = dao;
	}


	@Override
	public int check(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return dao.check(map);
	}


	@Override
	public void insertVinfo(VinfoVO vo) {
		
		dao.insertVinfo(vo);
	}


	@Override
	public void updateCid(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		dao.updateCid(map);
	}
	
	
	
	
	
	
	
	


}
