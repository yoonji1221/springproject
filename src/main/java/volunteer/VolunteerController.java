package volunteer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import api.Coolsms;

@Controller
public class VolunteerController {
	@Autowired
	VolunteerService volservice;

	// �ߺ�üũ
	@RequestMapping(value = "/volunjoin/user", method = RequestMethod.GET)
	@ResponseBody
	public int idcheck(@RequestParam("id") String id) {
		int result = volservice.idcheck(id);
		return result;
	}

	// ������ ȸ������
	@RequestMapping(value = "/volunjoin", method = RequestMethod.POST)
	public String join(VolunteerVO vo1, String large1, String medium1, String large2, String medium2, String large3,
			String medium3,HttpServletResponse response) throws Exception {
		String path = null;
		VolunteerVO vo = new VolunteerVO(vo1, large1, medium1, large2, medium2, large3, medium3);
		int result = volservice.join(vo);
		if (result == 1) {
			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('ȸ�����Կ� �����Ͽ����ϴ�.'); location.href='/volunteer134/home'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();  
			path = "redirect:/volunteer134/home";
		}
		return path;
	}

	@GetMapping(value = "/volunjoin/phonecheck")
	@ResponseBody
	public String sendSms(HttpServletRequest request) throws Exception {

			String api_key = "NCS27SU6OEJLBZFN";
			String api_secret = "5G0TPUHFTHQI0LOEKE3YRGXPM3VNM9KE";

			Coolsms coolsms = new Coolsms(api_key, api_secret);

			HashMap<String, String> set = new HashMap<String, String>();

			set.put("to", (String)request.getParameter("to")); // �޴»��
		    set.put("from", "01034071533"); // �����»��
		    set.put("text", "�����غ� ȸ������ ������ȣ�� ["+(String)request.getParameter("text")+"]�Դϴ�"); // ���ڳ���
			set.put("type", "sms"); // ���� Ÿ��

			System.out.println(set);

			JSONObject result = coolsms.send(set); // ������&���۰���ޱ�

			return "";


	}

	// �α���ȭ��
	@RequestMapping("/selectlogin")
	public ModelAndView login(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("selectlogin");
		return mav;
	}

	// ������ �α���ȭ��
	@RequestMapping(value = "/selectlogin/volunlogin", method = RequestMethod.GET)
	public ModelAndView volunloginView(HttpServletRequest req) {
		//HttpSession session = req.getSession();
//      session.setAttribute("sleep", 1004);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("volunLogin");
		return mav;
	}
	
	
	   // ������ �α���ȭ�� //0216ȿ������
	   @RequestMapping(value = "/selectlogin/volunlogin", method = RequestMethod.POST)
	   public ModelAndView volunlogin(@ModelAttribute("VolunteerVO") VolunteerVO vo, HttpServletRequest request,HttpSession session, HttpServletResponse response)
	         throws Exception {
	      
	      int result = volservice.volunlogin(vo);
	      ModelAndView mav = new ModelAndView();
	      int vid = 0;
	      String path = null;
	      if (result == 1) {
	         session.setAttribute("dbid", vo.getId());
	         vid = volservice.volunlogin2(vo);
	         session.setAttribute("volid", vid);
	         System.out.println((Integer) session.getAttribute("volid") + "<--�α����ϰ� ���Ǿ��̵�");
	         mav.addObject("vid", vid);
	         mav.setViewName("redirect:/home");
	      }else {
	         response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('�Է��� ������ Ʋ�Ƚ��ϴ�.'); location.href='/volunteer134/selectlogin'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();         
	      }
	      return mav;
	   }
	 //�α׾ƿ� // Ȩ���� 2016 ȿ�� ����
	   @RequestMapping(value = "/logout", method = RequestMethod.GET)
	   public String logout(HttpSession session) {
	      session.invalidate();
	      return "redirect:/home";
	   }
	

}