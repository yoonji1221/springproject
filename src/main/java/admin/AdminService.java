package admin;

import java.util.List;

import preference.PagingVO;
import volunteer.VolunteerVO;

public interface AdminService {

	//센터 로그인
	public List<AdminVO> adminlogin();
	
	//userlist admin
	public List<VolunteerVO> adminuserlist();
	
	//userlist delete
		public int deleteuser(String id);
		public List<AdminVO> contactList();
	      
	      public int insertContact(AdminVO vo);
}
