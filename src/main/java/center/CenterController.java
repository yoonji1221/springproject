package center;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import preference.PagingVO;
import vinfo.VinfoVO;
import volunteer.VolunteerVO;

@Controller
public class CenterController {

	@Autowired
	CenterService service;

	// 센터 로그인화면
	@RequestMapping("/selectlogin/centerlogin")
	public ModelAndView centerloginView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("centerLogin");
		return mav;
		
	}

	// 센터 로그인
	@RequestMapping(value="/selectlogin/centerlogin", method = RequestMethod.POST)
	public String centerlogin(CenterVO vo, HttpSession session) {
		String path = null;
		int result = service.centerlogin(vo);
		if (result == 1) {
			session.setAttribute("cid", vo.getCid());
			path = "redirect:/vinfolist"; //임시로 해놓음  
		}
		return path;
	}

	///다연이
	@RequestMapping(value ="/centercal", method = RequestMethod.GET) //봉사신청을 위한 캘린더 보여주기
	public ModelAndView getMyCenterCal(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("cid", 2057);///나중에고치기
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session에 담긴 cid가져오기
		List<VinfoVO> mycentercallist = service.getMyCenterCal(cid);
		mav.addObject("mycentercal", mycentercallist);
		mav.setViewName("centerCalForm");
		return mav;
	
	} 
	///////////////////////////////////////////
	@RequestMapping(value ="/centerMypageForm", method = RequestMethod.GET)
	public ModelAndView getCenterMypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("cid", 2057);///나중에고치기
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session에 담긴 cid가져오기
		List<CenterVO> centerMypageList = service.getCenterMypage(cid);
		mav.addObject("centerMypageList", centerMypageList);
		mav.setViewName("centerMypageForm");
		return mav;
	
	} 
	
	@RequestMapping(value ="/centerMypageForm", method = RequestMethod.POST)
	public String updateCenterMypage(CenterVO vo, HttpSession session) {
		//ModelAndView mav = new ModelAndView();
		String url = "";
		session.setAttribute("cid", 2057);///나중에고치기
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session에 담긴 cid가져오기
		CenterVO vo1 = new CenterVO(vo, cid);
		int result = service.updateCenterMypage(vo1);
		if(result==1) {
			url = "redirect:/centerMypageForm?result=success";
		}
		else {
			url = "redirect:/centerMypageForm?result=fail";
		}

		return url;
	
	} 
	
	///////////////////////////////////////////
	@RequestMapping(value ="/insertVolTimeForm", method = RequestMethod.GET)
	public ModelAndView getManageList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("cid", 2137);///나중에고치기
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session에 담긴 cid가져오기
		System.out.println(cid);
		String manageList = service.getManageList(cid);
		System.out.println(manageList);

		mav.addObject("manageList", manageList);
		mav.setViewName("insertVolTimeForm");
		return mav;
	
	} 
	
	@RequestMapping(value ="/insertVolTimeForm", method = RequestMethod.POST)
	public String insertManageList(CenterVO vo, HttpSession session) {
		//ModelAndView mav = new ModelAndView();
		String url = "";
		session.setAttribute("cid", 2137);///나중에고치기
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session에 담긴 cid가져오기
		CenterVO vo1 = new CenterVO(vo, cid);
		int result = service.updateCenterMypage(vo1);
		if(result==1) {
			url = "redirect:/centerMypageForm?result=success";
		}
		else {
			url = "redirect:/centerMypageForm?result=fail";
		}

		return url;
	
	} 
}
