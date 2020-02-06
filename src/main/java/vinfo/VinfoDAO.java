package vinfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class VinfoDAO {
	
	@Autowired
	SqlSession session;
	
	//홈화면 - 전체 봉사 조회
	public List<VinfoVO> vinfolist(){
		return session.selectList("volunteer.allvolunteer");
	}
	
}
