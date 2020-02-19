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
	
	//�����û
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
			
			//�̹� ��û�� ���� ��û ���ϰ� ����
			ManageVO vo = new ManageVO();
			vo.setProgrmRegistNo(progrmRegistNo);
			vo.setVid(vid);
			int a = service.checkApplication(vo);
			if(a!=0) { //�ߺ��� ���簪�� ������
				out.println("<script>alert('�̹� ��û�� �����Դϴ�.'); location.href='/volunteer134/vinfolist'; </script>"); //history.go(-1);        
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
			
			out.println("<script>alert('���� ��û�� �Ϸ�Ǿ����ϴ�.'); location.href='/volunteer134/vinfolist'; </script>"); //history.go(-1);        
            out.flush();
            out.close();
			
			System.out.println("��ϿϷ�");
			}
		}else if(session.getAttribute("dbcid") != null){ //vid�� null�ε� cid�� �����ϸ� (���Ͱ� �α���)
		
            out.println("<script>alert('���� ����� ��û�� �� �����ϴ�.'); location.href='/volunteer134/vinfolist'; </script>"); //history.go(-1);        
            out.flush();
            out.close();
		}else {
			/////////////////���⼭ ������... �������ȴ�... �̽��׸�
			 out.println("<script>alert('�α��� �� ��û���ּ���'); location.href='/volunteer134/vinfolist'; </script>"); //history.go(-1);        
            out.flush();
            out.close();
            //url = "vinfoAllList";
		}
		return url;
	}

}
