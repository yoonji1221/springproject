package admin;

import java.util.List;

import preference.PagingVO;
import volunteer.VolunteerVO;

public interface AdminService {

	//���� �α���
	public List<AdminVO> adminlogin();
	
	//userlist admin
	public List<VolunteerVO> adminuserlist();
	
	//userlist delete
		public int deleteuser(String id);
		public List<AdminVO> contactList();
	      
	      public int insertContact(AdminVO vo);
}
