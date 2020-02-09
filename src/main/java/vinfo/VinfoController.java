package vinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import preference.PagingVO;

@Controller
public class VinfoController {

	@Autowired
	VinfoService service;

	// 봉사 전체 리스트
	@RequestMapping("/vinfolist")
	public ModelAndView boardList(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
		ModelAndView mav = new ModelAndView();
		int total = service.getpaging();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<VinfoVO> list = service.vinfolistPaging(vo);
		
		mav.addObject("paging", vo);
		mav.addObject("viewAll", list);
		mav.setViewName("vinfoAllList");
		return mav;
	}
}
