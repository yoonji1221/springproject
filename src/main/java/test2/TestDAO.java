package test2;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TestDAO {
	
	@Autowired
	SqlSession sqlSession;

	public void setSession(SqlSession session) {
		this.sqlSession = session;
	}
	
	public List<TestVO> getList(){
		List<TestVO> list = sqlSession.selectList("");
		return list;
	}
	
	public List<TestVO> getEmpDynamicwhere(HashMap<String, String> map){
		return sqlSession.selectList("test.insert", map);
	}

	public List<TestVO> insertvinfo(HashMap<String, Object> map){
		return sqlSession.selectList("test.vinfoinsert", map);
	}
}
