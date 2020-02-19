package center;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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

import vinfo.VinfoVO;

@Controller
public class CenterController {

   @Autowired
   CenterService service;

  //����
   //�������� �ڼ��� ����
   @RequestMapping(value="/centerdetail", method=RequestMethod.POST)
   public ModelAndView centerDetail(@RequestParam("cid") int cid) {
      ModelAndView mav= new ModelAndView();
      List<CenterVO> list = service.centerDetail(cid);
      mav.addObject("list", list);
      //�ٿ�
      List<VinfoVO> centerlist = service.getMyCenterCal(cid);
       mav.addObject("centerlist", centerlist);
      mav.setViewName("centerdetail");
      return mav;
   }
  
   // ���� �α���ȭ��
   @RequestMapping("/selectlogin/centerlogin")
   public ModelAndView centerloginView(HttpServletRequest req) {
      //HttpSession session = req.getSession();
      //session.setAttribute("sleep", 1004);
      ModelAndView mav = new ModelAndView();
      mav.setViewName("centerLogin");
      return mav;
      
   }

    // ���� �α���//0216ȿ������
    @RequestMapping(value="/selectlogin/centerlogin", method = RequestMethod.POST)
    public String centerlogin(@ModelAttribute("CenterVO") CenterVO vo, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{ 
       String path = null;
       HttpSession session = request.getSession();
      
       int cid = Integer.parseInt(request.getParameter("cid"));
       System.out.println(cid+"Ddddddddddddddd");
       String email=request.getParameter("email");
       
       CenterVO vo2= new CenterVO(vo, cid, email);
       List<CenterVO> centerloginlist = service.centerlogin(vo2);   
       if (centerloginlist.size()!=0) {//�α���o
          int c = (Integer)centerloginlist.get(0).getCid();
          session.setAttribute("dbcid",cid);
          session.setAttribute("dbadm", centerloginlist.get(0).getNanmmbyNmAdmn());//������̸��̾Ƽ� ����� ��
          System.out.println(session.getAttribute("dbcid")+" : centerController����");
          model.addAttribute("centerloginlist", centerloginlist);
          return "redirect:/home";
       }else {//�α���X
         response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('�Է��� ������ Ʋ�Ƚ��ϴ�.'); location.href='/volunteer134/selectlogin'; </script>"); //history.go(-1);        
            out.flush();
            out.close();         
      }
      
      return ""; 
    }
   

 // ���Ϳ��� �ø� ���� �޷º����ֱ�
    @RequestMapping(value ="/centercal", method = RequestMethod.GET) //�����û�� ���� Ķ���� �����ֱ�
    public ModelAndView getMyCenterCal(HttpServletRequest req) {
       ModelAndView mav = new ModelAndView();
       HttpSession session = req.getSession();
       
       //session.setAttribute("cid", 2057);///���߿���ġ��
       System.out.println(session.getAttribute("dbcid").toString()+"!!!!???????????!");
       int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session�� ��� cid��������
//       System.out.println(cid+"�ù�����������!!!!!!!!!!!!!!!!!!!!!!!!!");
       
       List<VinfoVO> mycentercallist = service.getMyCenterCal(cid);
       mav.addObject("mycentercal", mycentercallist);
       
       
       //���� ��¥
         SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");               
         String format_time1 = format1.format (System.currentTimeMillis());                              
         System.out.println("today = " + format_time1);
         mav.addObject("today", format_time1);
       mav.setViewName("centerCalForm");
       return mav;
    
    } 
   // ���͸��������� ���� form
   @RequestMapping(value ="/centerMypageForm", method = RequestMethod.GET)
   public ModelAndView getCenterMypage(HttpServletRequest req) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();
      int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session�� ��� cid��������
      List<CenterVO> centerMypageList = service.getCenterMypage(cid);
      mav.addObject("centerMypageList", centerMypageList);
      mav.setViewName("centerMypageForm");
      return mav;
   
   } 
   
   // ���͸��������� ���� update
   @RequestMapping(value ="/centerMypageForm", method = RequestMethod.POST)
   public String updateCenterMypage(CenterVO vo, HttpServletRequest req) {
      //ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();
      String url = "";
      //session.setAttribute("cid", 2057);///���߿���ġ��
     int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session�� ��� cid��������
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
   
   // �����ڵ� �ð� �Է����ִ� form
   @RequestMapping(value ="/insertVolTimeForm", method = RequestMethod.GET)
   public ModelAndView getRealtimeList(HttpServletRequest req) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();

      int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session�� ��� cid��������
      System.out.println(cid+"����̰�");
      List<VinfoVO> timeList = service.getRealtimeList(cid);

      mav.addObject("timeList", timeList);
      mav.setViewName("insertVolTimeForm");
      return mav;
   
   } 
   // �����ڵ� �ð� 0 -> update ����
   @RequestMapping(value ="/insertVolTimeForm", method = RequestMethod.POST)
   public String insertRealtime(VinfoVO vo, HttpServletRequest req,Model model,HttpServletResponse response) throws Exception {
      //ModelAndView mav = new ModelAndView();
      String url = "";
      HttpSession session = req.getSession();
     
      int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session�� ��� cid��������
      int vid = Integer.parseInt(req.getParameter("hvid").toString());
      System.out.println(vid+"::::::::::::"+cid);
      
      VinfoVO vo2 = new VinfoVO(vo, cid, vid);
      //ManageVO vo2 = new ManageVO(vo, cid, vid);
      int result = service.insertRealtime(vo2);
      if(result==1) {
         List<VinfoVO> timeList = service.getRealtimeList(cid);
         model.addAttribute(timeList);
         
         url = "redirect:/insertVolTimeForm?result=success";
 
      }
      else {
         url = "redirect:/insertVolTimeForm?result=fail";
      }

      return url;
   
   } 
}