package admin;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String adminlogin(HttpServletResponse response,HttpServletRequest request)  throws Exception  {
		String path = null;
		List<AdminVO> admin = service.adminlogin();
		String adminid = request.getParameter("adminid");
		String adminpw = request.getParameter("adminpw");
		System.out.println(adminid +":"+adminpw);
		if(adminid.equals("admin") && adminpw.equals("1234")) {
			path = "redirect:/adminuserlist/user";
		}else {
	         response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('입력한 정보가 틀렸습니다.'); location.href='/volunteer134/selectlogin'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();         
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

	//다연contact
    //홈에서 contact 화면보여주기
    @RequestMapping("/contact")
    public ModelAndView contact() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("contact");
       return mav;
    }
    
  //관리자페이지에서 contact 내용보여주기
    @RequestMapping("/contactList")
    public ModelAndView contactList() {
       ModelAndView mav = new ModelAndView();
       List<AdminVO> list = service.contactList();

    mav.addObject("contactList", list);
       mav.setViewName("contactList");
       return mav;
    }
    
    
  //contact 내용db에 넣기
    @RequestMapping(value ="/insertContact", method = RequestMethod.POST)
    public String insertContact(AdminVO vo, HttpServletRequest req,Model model) {
       String url = "";
       
       String yourname = req.getParameter("yourname");
         String subject = req.getParameter("subject");
         String youremail = req.getParameter("youremail");
         String message = req.getParameter("message");
         
         System.out.println(yourname+":~:"+subject+"@@"+youremail+"zz"+message);
       
         service.insertContact(vo);
         
          url = "redirect:/contact";

       return url;

    } 
}
