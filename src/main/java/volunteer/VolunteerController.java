package volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VolunteerController {

	@Autowired
	VolunteerService service;
	
	//봉사 전체 리스트
	@RequestMapping("/vlist")
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView();
		List<VolunteerVO> list = service.volunteerlist();
		
		mav.addObject("vlist", list);
		mav.setViewName("volunteerAllList");
		return mav;
	
	} 
}
