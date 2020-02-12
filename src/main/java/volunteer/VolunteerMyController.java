package volunteer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import manage.ManageVO;
import preference.PreferenceController;
import preference.PreferenceService;
import preference.PreferenceServiceImpl;
import preference.PreferenceVO;
import vinfo.VinfoVO;

@Controller
@RequestMapping("/volunteerMypage/*")
public class VolunteerMyController {

	@Autowired
	VolunteerService service;

	
	//������ ���������� : ����ȭ��(������Ʈ��)
	@RequestMapping(value = "/{vid}", method = RequestMethod.GET)
	public ModelAndView VolunteerMyMain(@PathVariable("vid") int vid, HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		//vid = Integer.parseInt(session.getAttribute("vid").toString());
		List<VolunteerVO> list = service.getVolunteer(vid);
		mav.addObject("list", list);
		List<PreferenceVO> prelist = service.getPreList();
	    mav.addObject("prelist", prelist);
		mav.setViewName("volunteerMyPage_Main");
		return mav;
	}
	
	//������ ���������� : ��ȣ�� ����ϱ�
	@RequestMapping(value = "/{vid}/precheck", method = RequestMethod.GET)
	   @ResponseBody
	   public List<PreferenceVO> idcheck(@PathVariable("vid") int vid, @RequestParam("selected_large") String selected_large) {
	      List<PreferenceVO> mlist = service.getMediumList(selected_large);
	      return mlist;
	   }
	
	//������ ���������� : ����ȭ��(������Ʈ �Ϸ�)
	@RequestMapping(value = "/{vid}", method = RequestMethod.POST)
	public ModelAndView VolunteerMyMainUpdate(VolunteerVO vo, @PathVariable("vid") int vid, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String large1 = request.getParameter("large1");
		String medium1 = request.getParameter("medium1");
		String large2 = request.getParameter("large2");
		String medium2 = request.getParameter("medium2");
		String large3 = request.getParameter("large3");
		String medium3 = request.getParameter("medium3");		
		vo.setPreference1(large1+" > "+medium1);
		vo.setPreference2(large2+" > "+medium2);
		vo.setPreference3(large3+" > "+medium3);	
		service.updateVolunteer(vo);
		mav.setViewName("VoMypageUpdateSuccess");
		//redirect : ������������ �����ϱ�
		return mav;
	}

	// �� ȸ���� Ȱ���� ���������� �޷¿� ���
	@RequestMapping("/{vid}/Cal")
	public ModelAndView VolunteerMyPage(@PathVariable("vid") int vid) {
		ModelAndView mav = new ModelAndView();
		List<VinfoVO> list = service.getVolunInfo(vid);
		mav.addObject("list", list);
		mav.setViewName("volunteerMyPage_Cal");
		return mav;
	}

	// Ȱ���Ϸ��� �������� Ȯ���ϱ�
	@RequestMapping("/{vid}/Cal/{progrmRegistNo}")
	public ModelAndView VolunteerMyPage(@PathVariable("vid") int vid, @PathVariable("progrmRegistNo") int progrmRegistNo) {
		ModelAndView mav = new ModelAndView();
		List<VinfoVO> list = service.getVolunDetail(progrmRegistNo);
		String mnnstNm = service.getCenterName(progrmRegistNo);
		mav.addObject("list", list);
		mav.addObject("mnnstNm", mnnstNm);
		mav.setViewName("volunDetail");
		return mav;
	}
	
	//�������� ��û��Ȳ ������(���� ��� �� ��ȸ)
	@RequestMapping("/{vid}/ApplicationList")
	public ModelAndView VolunApplication(@PathVariable("vid") int vid) {
		ModelAndView mav = new ModelAndView();
		List<VinfoVO> list = service.getVolunInfo(vid);
		mav.addObject("list", list);
		mav.setViewName("volunApplication");
		return mav;
	}
	
	//�������� ���� ���
	@RequestMapping("/{vid}/ApplicationList/Cancle")
	public String VolunCancle(@PathVariable("vid") int vid, @RequestParam(value="ProgrmRegistNo", required = false) int ProgrmRegistNo, ManageVO vo) {
		vo.setVid(vid);
		vo.setProgrmRegistNo(ProgrmRegistNo);
		service.deleteManage(vo);
		return "redirect:/volunteerMypage/{vid}/ApplicationList";
	}
	

}
