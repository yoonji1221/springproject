package vinfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class VinfoDAO {
	
	@Autowired
	SqlSession session;
	
	//Ȩȭ�� - ��ü ���� ��ȸ
	public List<VinfoVO> vinfolist(){
		return session.selectList("volunteer.allvolunteer");
	}
	
}
