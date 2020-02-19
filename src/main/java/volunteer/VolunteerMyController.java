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

   // 윤지
   // 선호도 추천
   @RequestMapping(value = "/{vid}/recomanprefer")
   public ModelAndView recomanprefer(@PathVariable("vid") int vid, HttpServletRequest request)  {
      ModelAndView mav = new ModelAndView();
      HttpSession session = request.getSession();
      vid = (Integer)session.getAttribute("volid");
      List<VolunteerVO> resultvo = service.recomanprefer(vid); //그 vid를 이용해 봉사자의 선호도를 뽑아 vo에 저장
      System.out.println(resultvo.get(0).getPreference1()+"     "+resultvo.get(0).getPreference2()+"     "+resultvo.get(0).getPreference3());
      System.out.println(vid+"이거다이거");
      
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
      if (resultvo.get(0).getId()!=null) {//로그인 했을때 세션에 저장된 vid로 선호도 목록 가져왔을때
    	  System.out.println(resultvo.get(0).getId()+"아이디아이이디디디");
    	  resultvo.get(0).setPreference1(preference1);
    	  resultvo.get(0).setPreference2(preference2);
    	  resultvo.get(0).setPreference3(preference3);
    	  resultvo.get(0).setAddress(address);
    	  resultvo.get(0).setDetailaddress(detailaddress);
         List<VinfoVO> vinfolist = service.realrecoman(resultvo.get(0)); //그 vo안에 preference1,2,3 컬럼이 vinfo에 분야코드랑 맞는거만 가져오기
         System.out.println(vinfolist.size()+"추천봉사개수");
         session.setAttribute("dbid", service.recomanprefer(vid).get(0).getId());
         
         mav.addObject("vinfolist", vinfolist);
         mav.setViewName("recomanprefer");
         return mav;
      }
      return mav;
   }


   //봉사자 마이페이지 : 메인화면(업데이트전)
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
     
     //봉사자 마이페이지 : 선호도 출력하기
     @RequestMapping(value = "/{vid}/precheck", method = RequestMethod.GET)
        @ResponseBody
        public List<PreferenceVO> idcheck(@PathVariable("vid") int vid, @RequestParam("selected_large") String selected_large) {
           List<PreferenceVO> mlist = service.getMediumList(selected_large);
           return mlist;
        }
     
     //봉사자 마이페이지 : 메인화면(업데이트 완료)
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
        
        //redirect : 마이페이지로 수정하기 //0216
        return "redirect:/volunteerMypage/" + vid;
     }

  // 한 회원이 활동한 봉사정보를 달력에 출력
     @RequestMapping("/{vid}/Cal")
     public ModelAndView VolunteerMyPage(@PathVariable("vid") int vid) {
        ModelAndView mav = new ModelAndView();
        List<VinfoVO> list = service.getVolunInfo(vid);
        mav.addObject("list", list);
        
      //오늘 날짜
        SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");               
        String format_time1 = format1.format (System.currentTimeMillis());                              
        System.out.println("today = " + format_time1);
        mav.addObject("today", format_time1);
        mav.setViewName("volunteerMyPage_Cal");
        return mav;
     }

     // 활동완료한 봉사정보 확인하기
     // 봉사정보 조회하기 1
     @RequestMapping(value= {"/detail/{vid}"})
     public ModelAndView VolunteerDetail(@PathVariable("vid") int vid, @RequestParam(value="progrmRegistNo", required = false) int progrmRegistNo, HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        
        HttpSession session = req.getSession();
        
//        int i = (Integer)session.getAttribute("volid");
//        System.out.println(i+"<--detail 세션");
        
        session.setAttribute("progrmRegistNo1", progrmRegistNo);
        
        List<VinfoVO> list = service.getVolunDetail(progrmRegistNo);
        String volundate = list.get(0).getProgrmBgnde(); 
        int clickdateRegistNo = list.get(0).getProgrmRegistNo();
        
        session.setAttribute("clickdateRegistNo", clickdateRegistNo);
        System.out.println(volundate+"volundate 발런마이컨트롤에서 뽑음"+"clickdateRegistNo : "+clickdateRegistNo);
        session.setAttribute("volundate", volundate); //달력에서 클릭한 봉사의 봉사날짜 세션에 담음
        String mnnstNm = service.getCenterName(progrmRegistNo);
        mav.addObject("list", list);
        mav.addObject("mnnstNm", mnnstNm);
        mav.setViewName("volunDetail");
        return mav;
     }
     
  // 봉사정보 조회하기 2
     @RequestMapping(value= {"/detail"})
     public ModelAndView VolunteerDetail2(@RequestParam(value="progrmRegistNo", required = false) int progrmRegistNo, HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        
        HttpSession session = req.getSession();
//        int i = (Integer)session.getAttribute("volid");
//        System.out.println(i+"<--detail 세션");         
        List<VinfoVO> list = service.getVolunDetail(progrmRegistNo);
        String mnnstNm = service.getCenterName(progrmRegistNo);
        mav.addObject("list", list);
        mav.addObject("mnnstNm", mnnstNm);
        mav.setViewName("volunDetail");
        return mav;
     }
     
     // 봉사정보 조회하기 3
     @RequestMapping(value= {"/volundetail"})
     public ModelAndView VolunteerDetail3(@RequestParam(value="progrmRegistNo", required = false) int progrmRegistNo, HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        
        HttpSession session = req.getSession();
//        int i = (Integer)session.getAttribute("volid");
//        System.out.println(i+"<--detail 세션");         
        List<VinfoVO> list = service.getVolunDetail(progrmRegistNo);
        String mnnstNm = service.getCenterName(progrmRegistNo);
        mav.addObject("list", list);
        mav.addObject("mnnstNm", mnnstNm);
        mav.setViewName("volunDetail_center");
        return mav;
     }
     
     //봉사자의 신청현황 페이지(봉사 취소 및 조회)
     @RequestMapping("/{vid}/ApplicationList")
     public ModelAndView VolunApplication(@PathVariable("vid") int vid) {
        ModelAndView mav = new ModelAndView();
        List<VinfoVO> list = service.getVolunInfo(vid);
        mav.addObject("list", list);
        
      //오늘 날짜
        SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");               
        String format_time1 = format1.format (System.currentTimeMillis());                              
        System.out.println("today = " + format_time1);
        mav.addObject("today", format_time1);
        mav.setViewName("volunApplication");
        return mav;
     }
     
     //봉사자의 봉사 취소
     @RequestMapping("/{vid}/ApplicationList/Cancle")
     public String VolunCancle(@PathVariable("vid") int vid, @RequestParam(value="ProgrmRegistNo", required = false) int ProgrmRegistNo, ManageVO vo,
    		 HttpServletResponse response) throws Exception {
        vo.setVid(vid);
        vo.setProgrmRegistNo(ProgrmRegistNo);
        service.deleteManage(vo);
        service.deleteApptotal(ProgrmRegistNo);
        
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('봉사가 취소되었습니다'); location.href='/volunteer134/volunteerMypage/"+vid+"/ApplicationList';</script>"); //history.go(-1);        
        out.flush();
        out.close();
        
        
        return "";
     }
     
     //봉사자의 봉사 시간 조회//0217효진
     @RequestMapping("/{vid}/CheckTime")
     public ModelAndView VolunCheckTime(@PathVariable("vid") int vid) {
           ModelAndView mav = new ModelAndView();
           List<ParameterVO> list = service.checkTime(vid);
           mav.addObject("list", list);
           int sumTime = service.sumTime(vid);
           mav.addObject("sumTime", sumTime);
      //오늘 날짜
         SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");               
         String format_time1 = format1.format (System.currentTimeMillis());                              
         System.out.println("today = " + format_time1);
         mav.addObject("today", format_time1);
           mav.setViewName("volunCheckTime");
           return mav;
        }
     

   

}