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

	
	// ������ �α���ȭ��
		@RequestMapping("/selectlogin/adminlogin")
		public ModelAndView adminloginView() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminLogin");
			return mav;
			
		}
	//������ �α���
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
	            out.println("<script>alert('�Է��� ������ Ʋ�Ƚ��ϴ�.'); location.href='/volunteer134/selectlogin'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();         
	      }
		return path;
	}
	//������ ȸ����ϻ̱�
	@RequestMapping(value="/adminuserlist/user")
	public ModelAndView adminuserlist() {
		ModelAndView mav = new ModelAndView();
		List<VolunteerVO> list = service.adminuserlist();
		
		mav.addObject("userlist", list);
		mav.setViewName("adminuserlist");
		return mav;
	}
	//������ ȸ��Ż��
	@RequestMapping(value="/adminuserlist/deleteuser", method = RequestMethod.GET)
	@ResponseBody
	public int deleteuser(@RequestParam String id) {
		System.out.println(id);
		
		int delete = service.deleteuser(id);
		System.out.println(delete);
		return delete;
	}

	//�ٿ�contact
    //Ȩ���� contact ȭ�麸���ֱ�
    @RequestMapping("/contact")
    public ModelAndView contact() {
       ModelAndView mav = new ModelAndView();
       mav.setViewName("contact");
       return mav;
    }
    
  //���������������� contact ���뺸���ֱ�
    @RequestMapping("/contactList")
    public ModelAndView contactList() {
       ModelAndView mav = new ModelAndView();
       List<AdminVO> list = service.contactList();

    mav.addObject("contactList", list);
       mav.setViewName("contactList");
       return mav;
    }
    
    
  //contact ����db�� �ֱ�
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
