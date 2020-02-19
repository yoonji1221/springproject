package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import preference.PagingVO;
import volunteer.VolunteerVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO dao;

	@Override
	public List<AdminVO> adminlogin() {
		return dao.adminlogin();
	}

	@Override
	public List<VolunteerVO> adminuserlist() {
		return dao.adminuserlist();
	}

	@Override
	public int deleteuser(String id) {
		return dao.deleteuser(id);
	}

	 @Override
	   public int insertContact(AdminVO vo) {
	      return dao.insertContact(vo);
	   }

	   @Override
	   public List<AdminVO> contactList() {
	      return dao.contactList();
	   }


}
