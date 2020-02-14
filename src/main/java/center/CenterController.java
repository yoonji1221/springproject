package center;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import vinfo.VinfoVO;

@Controller
public class CenterController {

   @Autowired
   CenterService service;

   // 센터 로그인화면
   @RequestMapping("/selectlogin/centerlogin")
   public ModelAndView centerloginView(HttpServletRequest req) {
      //HttpSession session = req.getSession();
      //session.setAttribute("sleep", 1004);
      ModelAndView mav = new ModelAndView();
      mav.setViewName("centerLogin");
      return mav;
      
   }

    // 센터 로그인
    @RequestMapping(value="/selectlogin/centerlogin", method = RequestMethod.POST)
    public String centerlogin(@ModelAttribute("CenterVO") CenterVO vo, HttpServletRequest request, Model model) throws Exception{ 
       String path = null;
       HttpSession session = request.getSession();
      

       int cid = Integer.parseInt(request.getParameter("cid"));
       System.out.println(cid+"Ddddddddddddddd");
       String email=request.getParameter("email");
       
       CenterVO vo2= new CenterVO(vo, cid, email);
       List<CenterVO> centerloginlist = service.centerlogin(vo2);   
       if (centerloginlist.size()!=0) {//로그인o
          int c = (Integer)centerloginlist.get(0).getCid();
          session.setAttribute("dbcid",cid);
          session.setAttribute("dbadm", centerloginlist.get(0).getNanmmbyNmAdmn());//담당자이름뽑아서 헤더에 씀
          System.out.println(session.getAttribute("dbcid")+" : centerController에서");
          model.addAttribute("centerloginlist", centerloginlist);
          return "redirect:/vinfolist";
       }
      
      return ""; 
    }
   

   // 센터에서 올린 봉사 달력보여주기
   @RequestMapping(value ="/centercal", method = RequestMethod.GET) //봉사신청을 위한 캘린더 보여주기
   public ModelAndView getMyCenterCal(HttpServletRequest req) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();
      
      //session.setAttribute("cid", 2057);///나중에고치기
      System.out.println(session.getAttribute("dbcid").toString()+"!!!!???????????!");
      int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session에 담긴 cid가져오기
//      System.out.println(cid+"시발제발좀떠라!!!!!!!!!!!!!!!!!!!!!!!!!");
      
      List<VinfoVO> mycentercallist = service.getMyCenterCal(cid);
      mav.addObject("mycentercal", mycentercallist);
      mav.setViewName("centerCalForm");
      return mav;
   
   } 
   // 센터마이페이지 수정 form
   @RequestMapping(value ="/centerMypageForm", method = RequestMethod.GET)
   public ModelAndView getCenterMypage(HttpServletRequest req) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();
      int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session에 담긴 cid가져오기
      List<CenterVO> centerMypageList = service.getCenterMypage(cid);
      mav.addObject("centerMypageList", centerMypageList);
      mav.setViewName("centerMypageForm");
      return mav;
   
   } 
   
   // 센터마이페이지 수정 update
   @RequestMapping(value ="/centerMypageForm", method = RequestMethod.POST)
   public String updateCenterMypage(CenterVO vo, HttpServletRequest req) {
      //ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();
      String url = "";
      //session.setAttribute("cid", 2057);///나중에고치기
     int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session에 담긴 cid가져오기
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
   
   // 봉사자들 시간 입력해주는 form
   @RequestMapping(value ="/insertVolTimeForm", method = RequestMethod.GET)
   public ModelAndView getRealtimeList(HttpServletRequest req) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();

      int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session에 담긴 cid가져오기
      System.out.println(cid+"모야이거");
      List<VinfoVO> timeList = service.getRealtimeList(cid);

      mav.addObject("timeList", timeList);
      mav.setViewName("insertVolTimeForm");
      return mav;
   
   } 
   // 봉사자들 시간 0 -> update 해줌
   @RequestMapping(value ="/insertVolTimeForm", method = RequestMethod.POST)
   public String insertRealtime(VinfoVO vo, HttpServletRequest req,Model model) {
      //ModelAndView mav = new ModelAndView();
      String url = "";
      HttpSession session = req.getSession();
     
      int cid=Integer.parseInt(session.getAttribute("dbcid").toString());/////session에 담긴 cid가져오기
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