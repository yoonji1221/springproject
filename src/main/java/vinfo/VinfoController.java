package vinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VinfoController {

	@Autowired
	VinfoService service;
	
	//봉사 전체 리스트
	@RequestMapping("/vinfolist")
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView();
		List<VinfoVO> list = service.vinfolist();
		
		mav.addObject("vinfolist", list);
		mav.setViewName("vinfoAllList");
		return mav;
	
	} 
}
