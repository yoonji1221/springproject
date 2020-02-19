package volunteer;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import preference.PreferenceVO;
import vinfo.ParameterVO;
import vinfo.VinfoVO;

@Controller
@RequestMapping("/volunteerMypage/*")
public class VolunteerMyController {

   @Autowired
   VolunteerService service;

   // ����
   // ��ȣ�� ��õ
   @RequestMapping(value = "/{vid}/recomanprefer")
   public ModelAndView recomanprefer(@PathVariable("vid") int vid, HttpServletRequest request)  {
      ModelAndView mav = new ModelAndView();
      HttpSession session = request.getSession();
      vid = (Integer)session.getAttribute("volid");
      List<VolunteerVO> resultvo = service.recomanprefer(vid); //�� vid�� �̿��� �������� ��ȣ���� �̾� vo�� ����
      System.out.println(resultvo.get(0).getPreference1()+"     "+resultvo.get(0).getPreference2()+"     "+resultvo.get(0).getPreference3());
      System.out.println(vid+"�̰Ŵ��̰�");
      
      String prefer1[] = resultvo.get(0).getPreference1().split(">");
      String preference1 = prefer1[0];
      String prefer2[] = resultvo.get(0).getPreference2().split(">");
      String preference2 = prefer2[0];
      String prefer3[] = resultvo.get(0).getPreference3().split(">");
      String preference3 = prefer3[0];
      String addr[] = resultvo.get(0).getAddress().split(" ");
      String address = addr[0];
      String detailaddress = addr[1];
      System.out.println(preference1+":::::::::"+preference2+"::::::::::"+preference3+"::::::::::"+address);
      if (resultvo.get(0).getId()!=null) {//�α��� ������ ���ǿ� ����� vid�� ��ȣ�� ��� ����������
    	  System.out.println(resultvo.get(0).getId()+"���̵�����̵���");
    	  resultvo.get(0).setPreference1(preference1);
    	  resultvo.get(0).setPreference2(preference2);
    	  resultvo.get(0).setPreference3(preference3);
    	  resultvo.get(0).setAddress(address);
    	  resultvo.get(0).setDetailaddress(detailaddress);
         List<VinfoVO> vinfolist = service.realrecoman(resultvo.get(0)); //�� vo�ȿ� preference1,2,3 �÷��� vinfo�� �о��ڵ�� �´°Ÿ� ��������
         System.out.println(vinfolist.size()+"��õ���簳��");
         session.setAttribute("dbid", service.recomanprefer(vid).get(0).getId());
         
         mav.addObject("vinfolist", vinfolist);
         mav.setViewName("recomanprefer");
         return mav;
      }
      return mav;
   }


   //������ ���������� : ����ȭ��(������Ʈ��)
     @RequestMapping(value = "/{vid}", method = RequestMethod.GET)
     public ModelAndView VolunteerMyMain(@PathVariable("vid") int vid, HttpSession session) {
        ModelAndView mav = new ModelAndView();      
        //vid = Integer.parseInt(session.getAttribute("vid").toString());
        List<VolunteerVO> list = service.getVolunteer(vid);
        mav.addObject("list", list);
        List<PreferenceVO> prelist = service.getPreList();
         mav.addObject("prelist", prelist);
        mav.setViewName("volunteerMyPage_Main22222");
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
     public String VolunteerMyMainUpdate(VolunteerVO vo, @PathVariable("vid") int vid, HttpServletRequest request) {
        
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
        
        //redirect : ������������ �����ϱ� //0216
        return "redirect:/volunteerMypage/" + vid;
     }

  // �� ȸ���� Ȱ���� ���������� �޷¿� ���
     @RequestMapping("/{vid}/Cal")
     public ModelAndView VolunteerMyPage(@PathVariable("vid") int vid) {
        ModelAndView mav = new ModelAndView();
        List<VinfoVO> list = service.getVolunInfo(vid);
        mav.addObject("list", list);
        
      //���� ��¥
        SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");               
        String format_time1 = format1.format (System.currentTimeMillis());                              
        System.out.println("today = " + format_time1);
        mav.addObject("today", format_time1);
        mav.setViewName("volunteerMyPage_Cal");
        return mav;
     }

     // Ȱ���Ϸ��� �������� Ȯ���ϱ�
     // �������� ��ȸ�ϱ� 1
     @RequestMapping(value= {"/detail/{vid}"})
     public ModelAndView VolunteerDetail(@PathVariable("vid") int vid, @RequestParam(value="progrmRegistNo", required = false) int progrmRegistNo, HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        
        HttpSession session = req.getSession();
        
//        int i = (Integer)session.getAttribute("volid");
//        System.out.println(i+"<--detail ����");
        
        session.setAttribute("progrmRegistNo1", progrmRegistNo);
        
        List<VinfoVO> list = service.getVolunDetail(progrmRegistNo);
        String volundate = list.get(0).getProgrmBgnde(); 
        int clickdateRegistNo = list.get(0).getProgrmRegistNo();
        
        session.setAttribute("clickdateRegistNo", clickdateRegistNo);
        System.out.println(volundate+"volundate �߷�������Ʈ�ѿ��� ����"+"clickdateRegistNo : "+clickdateRegistNo);
        session.setAttribute("volundate", volundate); //�޷¿��� Ŭ���� ������ ���糯¥ ���ǿ� ����
        String mnnstNm = service.getCenterName(progrmRegistNo);
        mav.addObject("list", list);
        mav.addObject("mnnstNm", mnnstNm);
        mav.setViewName("volunDetail");
        return mav;
     }
     
  // �������� ��ȸ�ϱ� 2
     @RequestMapping(value= {"/detail"})
     public ModelAndView VolunteerDetail2(@RequestParam(value="progrmRegistNo", required = false) int progrmRegistNo, HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        
        HttpSession session = req.getSession();
//        int i = (Integer)session.getAttribute("volid");
//        System.out.println(i+"<--detail ����");         
        List<VinfoVO> list = service.getVolunDetail(progrmRegistNo);
        String mnnstNm = service.getCenterName(progrmRegistNo);
        mav.addObject("list", list);
        mav.addObject("mnnstNm", mnnstNm);
        mav.setViewName("volunDetail");
        return mav;
     }
     
     // �������� ��ȸ�ϱ� 3
     @RequestMapping(value= {"/volundetail"})
     public ModelAndView VolunteerDetail3(@RequestParam(value="progrmRegistNo", required = false) int progrmRegistNo, HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        
        HttpSession session = req.getSession();
//        int i = (Integer)session.getAttribute("volid");
//        System.out.println(i+"<--detail ����");         
        List<VinfoVO> list = service.getVolunDetail(progrmRegistNo);
        String mnnstNm = service.getCenterName(progrmRegistNo);
        mav.addObject("list", list);
        mav.addObject("mnnstNm", mnnstNm);
        mav.setViewName("volunDetail_center");
        return mav;
     }
     
     //�������� ��û��Ȳ ������(���� ��� �� ��ȸ)
     @RequestMapping("/{vid}/ApplicationList")
     public ModelAndView VolunApplication(@PathVariable("vid") int vid) {
        ModelAndView mav = new ModelAndView();
        List<VinfoVO> list = service.getVolunInfo(vid);
        mav.addObject("list", list);
        
      //���� ��¥
        SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");               
        String format_time1 = format1.format (System.currentTimeMillis());                              
        System.out.println("today = " + format_time1);
        mav.addObject("today", format_time1);
        mav.setViewName("volunApplication");
        return mav;
     }
     
     //�������� ���� ���
     @RequestMapping("/{vid}/ApplicationList/Cancle")
     public String VolunCancle(@PathVariable("vid") int vid, @RequestParam(value="ProgrmRegistNo", required = false) int ProgrmRegistNo, ManageVO vo,
    		 HttpServletResponse response) throws Exception {
        vo.setVid(vid);
        vo.setProgrmRegistNo(ProgrmRegistNo);
        service.deleteManage(vo);
        service.deleteApptotal(ProgrmRegistNo);
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('���簡 ��ҵǾ����ϴ�'); location.href='/volunteer134/volunteerMypage/"+vid+"/ApplicationList';</script>"); //history.go(-1);        
        out.flush();
        out.close();
        
        
        return "";
     }
     
     //�������� ���� �ð� ��ȸ//0217ȿ��
     @RequestMapping("/{vid}/CheckTime")
     public ModelAndView VolunCheckTime(@PathVariable("vid") int vid) {
           ModelAndView mav = new ModelAndView();
           List<ParameterVO> list = service.checkTime(vid);
           mav.addObject("list", list);
           int sumTime = service.sumTime(vid);
           mav.addObject("sumTime", sumTime);
      //���� ��¥
         SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");               
         String format_time1 = format1.format (System.currentTimeMillis());                              
         System.out.println("today = " + format_time1);
         mav.addObject("today", format_time1);
           mav.setViewName("volunCheckTime");
           return mav;
        }
     

   

}