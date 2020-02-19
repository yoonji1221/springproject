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

	// 중복체크
	@RequestMapping(value = "/volunjoin/user", method = RequestMethod.GET)
	@ResponseBody
	public int idcheck(@RequestParam("id") String id) {
		int result = volservice.idcheck(id);
		return result;
	}

	// 봉사자 회원가입
	@RequestMapping(value = "/volunjoin", method = RequestMethod.POST)
	public String join(VolunteerVO vo1, String large1, String medium1, String large2, String medium2, String large3,
			String medium3,HttpServletResponse response) throws Exception {
		String path = null;
		VolunteerVO vo = new VolunteerVO(vo1, large1, medium1, large2, medium2, large3, medium3);
		int result = volservice.join(vo);
		if (result == 1) {
			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('회원가입에 성공하였습니다.'); location.href='/volunteer134/home'; </script>"); //history.go(-1);        
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

			set.put("to", (String)request.getParameter("to")); // 받는사람
		    set.put("from", "01034071533"); // 보내는사람
		    set.put("text", "봉사해봉 회원가입 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
			set.put("type", "sms"); // 문자 타입

			System.out.println(set);

			JSONObject result = coolsms.send(set); // 보내기&전송결과받기

			return "";


	}

	// 로그인화면
	@RequestMapping("/selectlogin")
	public ModelAndView login(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("selectlogin");
		return mav;
	}

	// 봉사자 로그인화면
	@RequestMapping(value = "/selectlogin/volunlogin", method = RequestMethod.GET)
	public ModelAndView volunloginView(HttpServletRequest req) {
		//HttpSession session = req.getSession();
//      session.setAttribute("sleep", 1004);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("volunLogin");
		return mav;
	}
	
	
	   // 봉사자 로그인화면 //0216효진수정
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
	         System.out.println((Integer) session.getAttribute("volid") + "<--로그인하고 세션아이디");
	         mav.addObject("vid", vid);
	         mav.setViewName("redirect:/home");
	      }else {
	         response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('입력한 정보가 틀렸습니다.'); location.href='/volunteer134/selectlogin'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();         
	      }
	      return mav;
	   }
	 //로그아웃 // 홈으로 2016 효진 수정
	   @RequestMapping(value = "/logout", method = RequestMethod.GET)
	   public String logout(HttpSession session) {
	      session.invalidate();
	      return "redirect:/home";
	   }
	

}