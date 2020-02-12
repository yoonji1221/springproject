package preference;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PreferenceController {

	@Autowired
	PreferenceService preservice;

	@RequestMapping("/volunjoin")
	public ModelAndView joinVolunteer() {
		ModelAndView mav = new ModelAndView();
		List<PreferenceVO> prelist = preservice.getPreList();
		mav.addObject("prelist", prelist);
		mav.setViewName("volunJoinPage");
		return mav;
	}

	//ȸ������ ȭ�鿡�� ��ȣ�� �̱�
	@RequestMapping(value = "/volunjoin/precheck", method = RequestMethod.GET)
	@ResponseBody
	public List<PreferenceVO> idcheck(@RequestParam("selected_large") String selected_large) {
		List<PreferenceVO> mlist = preservice.getMediumList(selected_large);
		//System.out.println(mlist.size()+"������");
		return mlist;
	}

}
