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

	// 관리자 로그인
	public List<AdminVO> adminlogin() {
		return session.selectList("db.adminlogin");
	}

	// 관리자 로그인 userlist
	public List<VolunteerVO> adminuserlist() {
		return session.selectList("db.adminuserlist");
	}
	
	// 관리자 userdelete
	public int deleteuser(String id) {
		return session.delete("db.deleteuser", id);
	}
	public int insertContact(AdminVO vo) {
	      return session.insert("db.insertContact", vo);
	   }
	   
	   public List<AdminVO> contactList() {
	      return session.selectList("db.contactList");
	   }
}
