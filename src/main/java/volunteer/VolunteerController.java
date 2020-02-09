package volunteer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		System.out.println("결과 " + result);
		return result;
	}

	// 로그인화면
	@RequestMapping("/volunlogin")
	@ResponseBody
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("volunLogin");
		return mav;

	}

}
