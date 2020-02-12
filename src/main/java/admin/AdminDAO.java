package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import preference.PagingVO;
import volunteer.VolunteerVO;

@Component
public class AdminDAO {

	@Autowired
	SqlSession session;

	// ������ �α���
	public List<AdminVO> adminlogin() {
		return session.selectList("db.adminlogin");
	}

	// ������ �α��� userlist
	public List<VolunteerVO> adminuserlist() {
		return session.selectList("db.adminuserlist");
	}
	
	// ������ userdelete
	public int deleteuser(String id) {
		int a = 0;
		int result = session.selectOne("db.deleteuser", id);
		if(result==1) {
			a = session.selectOne("db.deletereview", id);
		}
		return a;
	}
}
