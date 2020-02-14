package manage;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;




@Controller
public class ManageController {
	
	@Autowired
	ManageService service;
	
	//봉사신청
	@RequestMapping(value = "/requestVolunWork", method = RequestMethod.GET)
	public ModelAndView requestVolunWorkk(HttpServletRequest request) {
	    
		ModelAndView mav = new ModelAndView();
		mav.setViewName("volunDetail");
		return mav;
	}
	
	@RequestMapping(value = "/requestVolunWork", method = RequestMethod.POST)
	public String requestVolunWork(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int vid = 0;
		if(session.getAttribute("volid") != null ) {
			vid = (Integer)session.getAttribute("volid");
			System.out.println(vid+" : Manage session 0");
		}else {
			vid =1001;
			System.out.println(vid+" : Manage session X");
		}
		
		
//		HttpSession session = request.getSession();
//		SessionVO svo = (SessionVO)session.getAttribute("svo");
//	    int i = svo.getVid();
//	    System.out.println(i+"<--vinfo 세션");
	    
		//int vid = 1001;
		int progrmRegistNo = Integer.parseInt(request.getParameter("progrmRegistNo"));
		String postAdres = request.getParameter("postAdres");
		String actPlace = request.getParameter("actPlace");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("vid", vid);
		map.put("progrmRegistNo", progrmRegistNo);
		map.put("postAdres", postAdres);
		map.put("actPlace", actPlace);
		
		service.insertManage(map);
		service.updateApptotal(progrmRegistNo);
		System.out.println("등록완료");
		//return "/vinfolist";
		return "redirect:vinfolist?vid="+vid;
	}

}
