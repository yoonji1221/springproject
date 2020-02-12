package volunteer;

import java.io.IOException;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

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
			String medium3) {
		String path = null;
		VolunteerVO vo = new VolunteerVO(vo1, large1, medium1, large2, medium2, large3, medium3);
		int result = volservice.join(vo);
		if (result == 1) {
			path = "redirect:/selectlogin/volunlogin";
		}
		return path;
	}

	// 로그인화면
	@RequestMapping("/selectlogin")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("selectlogin");
		return mav;
	}

	// 봉사자 로그인화면
	@RequestMapping("/selectlogin/volunlogin")
	public ModelAndView volunloginView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("volunLogin");
		return mav;
		
	}
	// 봉사자 로그인화면
		@RequestMapping(value = "/selectlogin/volunlogin", method = RequestMethod.POST)
		public String volunlogin(@ModelAttribute("VolunteerVO") VolunteerVO vo, HttpSession session) throws Exception {
			int result = volservice.volunlogin(vo);
			int vid = volservice.volunlogin2(vo);
			String path = null;
			if (result == 1) {
				session.setAttribute("vid", vid);
				session.setAttribute("dbid", vo.getId());
				// path = "redirect:/vinfolist";
				path = "redirect:/volunteerMypage/" + vid;
			}
			return path;
		}


}
