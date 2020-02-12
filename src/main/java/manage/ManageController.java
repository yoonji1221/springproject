package manage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManageController {
	
	@Autowired
	ManageService service;
	
	@RequestMapping("/requestVolunWork")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("volunDetail");
		return mav;
	}

}
