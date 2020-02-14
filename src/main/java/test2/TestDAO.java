package test2;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vinfo.VinfoVO;

@Component
public class TestDAO {
	
	@Autowired
	SqlSession sqlSession;

	public void setSession(SqlSession session) 
	{
		this.sqlSession = session;
	}

	
	
	public int check(HashMap<String, String> map) {
		int i = sqlSession.selectOne("test.check", map);
		if(i != 1) {
			sqlSession.insert("test.insert", map);
		}
		return 0;
	}
	
	public void insertVinfo(VinfoVO vo) {
		sqlSession.insert("test.insertVinfo", vo);
	}
	
	public void updateCid(HashMap<String, String> map) {
		sqlSession.update("test.updateCid",map);
	}
}
