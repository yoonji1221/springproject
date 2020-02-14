package admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import preference.PagingVO;
import volunteer.VolunteerVO;

@Controller
public class AdminController {

	@Autowired
	AdminService service;

	
	// 관리자 로그인화면
		@RequestMapping("/selectlogin/adminlogin")
		public ModelAndView adminloginView() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminLogin");
			return mav;
			
		}
	//관리자 로그인
	@RequestMapping(value="/selectlogin/adminlogin", method = RequestMethod.POST)
	public String adminlogin() {
		String path = null;
		List<AdminVO> admin = service.adminlogin();
		String adminid = admin.get(0).getAdminid();
		String adminpw = admin.get(0).getAdminpw();
		System.out.println(adminid +":"+adminpw);
		if(adminid.equals("admin") && adminpw.equals("1234")) {
			path = "redirect:/adminuserlist/user";
		}
		return path;
	}
	//관리자 회원목록뽑기
	@RequestMapping(value="/adminuserlist/user")
	public ModelAndView adminuserlist() {
		ModelAndView mav = new ModelAndView();
		List<VolunteerVO> list = service.adminuserlist();
		
		mav.addObject("userlist", list);
		mav.setViewName("adminuserlist");
		return mav;
	}
	//관리자 회원탈퇴
	@RequestMapping(value="/adminuserlist/deleteuser", method = RequestMethod.GET)
	@ResponseBody
	public int deleteuser(@RequestParam String id) {
		System.out.println(id);
		
		int delete = service.deleteuser(id);
		System.out.println(delete);
		return delete;
	}

}
