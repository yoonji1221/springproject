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

	// ���� �α���ȭ��
	@RequestMapping("/selectlogin/centerlogin")
	public ModelAndView centerloginView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("centerLogin");
		return mav;
		
	}

	// ���� �α���
	@RequestMapping(value="/selectlogin/centerlogin", method = RequestMethod.POST)
	public String centerlogin(CenterVO vo, HttpSession session) {
		String path = null;
		int result = service.centerlogin(vo);
		if (result == 1) {
			session.setAttribute("cid", vo.getCid());
			path = "redirect:/vinfolist"; //�ӽ÷� �س���  
		}
		return path;
	}

	///�ٿ���
	@RequestMapping(value ="/centercal", method = RequestMethod.GET) //�����û�� ���� Ķ���� �����ֱ�
	public ModelAndView getMyCenterCal(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("cid", 2057);///���߿���ġ��
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session�� ��� cid��������
		List<VinfoVO> mycentercallist = service.getMyCenterCal(cid);
		mav.addObject("mycentercal", mycentercallist);
		mav.setViewName("centerCalForm");
		return mav;
	
	} 
	///////////////////////////////////////////
	@RequestMapping(value ="/centerMypageForm", method = RequestMethod.GET)
	public ModelAndView getCenterMypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.setAttribute("cid", 2057);///���߿���ġ��
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session�� ��� cid��������
		List<CenterVO> centerMypageList = service.getCenterMypage(cid);
		mav.addObject("centerMypageList", centerMypageList);
		mav.setViewName("centerMypageForm");
		return mav;
	
	} 
	
	@RequestMapping(value ="/centerMypageForm", method = RequestMethod.POST)
	public String updateCenterMypage(CenterVO vo, HttpSession session) {
		//ModelAndView mav = new ModelAndView();
		String url = "";
		session.setAttribute("cid", 2057);///���߿���ġ��
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session�� ��� cid��������
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
		session.setAttribute("cid", 2137);///���߿���ġ��
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session�� ��� cid��������
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
		session.setAttribute("cid", 2137);///���߿���ġ��
		int cid=Integer.parseInt(session.getAttribute("cid").toString());/////session�� ��� cid��������
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
