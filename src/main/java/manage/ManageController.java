package manage;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String requestVolunWork(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		int vid = 0;
		String url = "vinfoAllList";
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
		if(session.getAttribute("volid") != null ) {
			
			url = "redirect:vinfolist?vid="+vid;
			
			vid = (Integer)session.getAttribute("volid");
			System.out.println(vid+" : Manage session o");
			int progrmRegistNo = Integer.parseInt(request.getParameter("progrmRegistNo"));
			String postAdres = request.getParameter("postAdres");
			String actPlace = request.getParameter("actPlace");
			
			//이미 신청한 봉사 신청 못하게 막기
			ManageVO vo = new ManageVO();
			vo.setProgrmRegistNo(progrmRegistNo);
			vo.setVid(vid);
			int a = service.checkApplication(vo);
			if(a!=0) { //중복된 봉사값이 있을때
				out.println("<script>alert('이미 신청한 봉사입니다.'); location.href='/volunteer134/vinfolist'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();
			}
			else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("vid", vid);
			map.put("progrmRegistNo", progrmRegistNo);
			map.put("postAdres", postAdres);
			map.put("actPlace", actPlace);
			
			service.insertManage(map);
			service.updateApptotal(progrmRegistNo);
			
			out.println("<script>alert('봉사 신청이 완료되었습니다.'); location.href='/volunteer134/vinfolist'; </script>"); //history.go(-1);        
            out.flush();
            out.close();
			
			System.out.println("등록완료");
			}
		}else if(session.getAttribute("dbcid") != null){ //vid는 null인데 cid가 존재하면 (센터가 로그인)
		
            out.println("<script>alert('봉사 기관은 신청할 수 없습니다.'); location.href='/volunteer134/vinfolist'; </script>"); //history.go(-1);        
            out.flush();
            out.close();
		}else {
			/////////////////여기서 에러남... 실행은된당... 미스테리
			 out.println("<script>alert('로그인 후 신청해주세요'); location.href='/volunteer134/vinfolist'; </script>"); //history.go(-1);        
            out.flush();
            out.close();
            //url = "vinfoAllList";
		}
		return url;
	}

}
