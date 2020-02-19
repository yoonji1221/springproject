package review;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import manage.ManageVO;

@Controller
public class ReviewController {

   @Autowired
   ReviewService service;

   //홈화면
   @RequestMapping("/home")
   public ModelAndView csstest() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("home");
      return mav;
   }
 //홈 드롭다운메뉴 - 봉사안내
   @RequestMapping("/aboutvolunteer")
   public ModelAndView aboutvolunteer() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("aboutvolunteer");
      return mav;
   }
   

   // 전체 리뷰 리스트(게시판)
   @RequestMapping("/reviewlist")
   public ModelAndView reviewList() {
      ModelAndView mav = new ModelAndView();
      List<ReviewVO> list = service.reviewlist();
      mav.addObject("list", list);
      mav.setViewName("reviewlist");
      return mav;
   }

   // 리뷰 자세히 보기(게시판)
   @RequestMapping(value = "/reviewdetail", method = RequestMethod.GET)
   public ModelAndView reviewDetail(@RequestParam("rid") int rid) {
      ModelAndView mav = new ModelAndView();
      List<ReviewVO> list2 = service.getreviewdetail(rid);
      service.updateViewcount(rid);
      mav.addObject("list2", list2);
      mav.setViewName("reviewdetail");
      return mav;
   }

// 내가 쓴 리뷰 리스트
   @RequestMapping("/myreviewlist/{vid}")
   public ModelAndView myreviewList(HttpServletRequest req, @PathVariable("vid") int vid) {
      ModelAndView mav = new ModelAndView();
      HttpSession session = req.getSession();
   
      vid = (Integer)session.getAttribute("volid");
      System.out.println(vid+"Zzzzzzzzzzz");
      List<ReviewVO> list = service.myreviewlist(vid);
      mav.addObject("list", list);

      mav.setViewName("myreviewlist");
       System.out.println(list.size() + " : 내가쓴리뷰개수"); 
      return mav;
   }


   // 리뷰 자세히 보기(마이페이지)
   @RequestMapping(value = "/reviewdetailmp", method = RequestMethod.GET)
   public ModelAndView reviewDetailMP(@RequestParam("rid") int rid) {
      ModelAndView mav = new ModelAndView();
      List<ReviewVO> list2 = service.getreviewdetail(rid);
      mav.addObject("list2", list2);
      mav.setViewName("reviewdetailMP");
      return mav;
   }

   // 리뷰 수정
   @RequestMapping("/reviewupdate")
   public String reviewUpdateProcess(@ModelAttribute ReviewVO vo, HttpSession session,HttpServletResponse response) throws Exception {
      service.reviewUpdate(vo);
     
      int vid = (Integer)session.getAttribute("volid");
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println("<script>alert('리뷰 수정이 완료되었습니다'); location.href='/volunteer134/myreviewlist/"+vid+"';</script>"); //history.go(-1);        
      out.flush();
      out.close(); 
      
      return "redirect:myreviewlist/" + vid;
   }

   // 리뷰 삭제
   @RequestMapping(value = "/reviewdelete", method = RequestMethod.POST)
   public String reviewDeleteProcess(@RequestParam int mid, HttpSession session,HttpServletResponse response) throws Exception {
      service.reviewDelete(mid);
      int vid = (Integer)session.getAttribute("volid");
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println("<script>alert('리뷰가 삭제되었습니다.'); location.href='/volunteer134/myreviewlist/"+vid+"';</script>"); //history.go(-1);        
      out.flush();
      out.close(); 
      
      
      return "";
   }
// 리뷰 작성
   @RequestMapping(value = "/reviewwrite", method = RequestMethod.GET)
   public String reviewWrite(HttpServletRequest req,HttpSession session, HttpServletResponse response) throws Exception  {
      //ModelAndView mav = new ModelAndView();
      
      //미래봉사 리뷰쓰는거 막기
      int volundate = Integer.parseInt(session.getAttribute("volundate").toString());
      
      System.out.println(volundate+"한번 시스아웃해봄 ");
      int vid = (Integer)session.getAttribute("volid");
      System.out.println(vid+"리뷰작성에 세션ID값");
      int clickdateRegistNo = (Integer)session.getAttribute("clickdateRegistNo");
      System.out.println(clickdateRegistNo+"여기!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      int progrmRegistNo = (Integer)session.getAttribute("progrmRegistNo1");
      System.out.println(progrmRegistNo+"리뷰작성에 세션regist값");
     
      //중복체크
      ManageVO vo = new ManageVO();
      vo.setVid(vid);
      vo.setProgrmRegistNo(progrmRegistNo);
      int result = service.reviewDupCheck(vo); //1이면 해당 봉사에 대해 이미쓴리뷰가있다
      
      String url = "";
  
      if(result==0) {
      if(clickdateRegistNo==progrmRegistNo && volundate <= 20200218) {
         url = "/reviewwrite";
//         mav.setViewName("reviewwrite");
//          return mav;
      }else if(clickdateRegistNo==progrmRegistNo && volundate > 20200218) { //완료 안된 봉사 리뷰  쓰려고 할 때
         response.setContentType("text/html; charset=UTF-8");
          PrintWriter out = response.getWriter();
          out.println("<script>alert('완료되지 않은 봉사입니다.'); location.href='/volunteer134/volunteerMypage/"+vid+"/Cal'; </script>"); //history.go(-1);        
          out.flush();
          out.close();
          //mav.setViewName("home");
          //return mav;
      }
      }
      else {
         response.setContentType("text/html; charset=UTF-8");
          PrintWriter out = response.getWriter();
          out.println("<script>alert('이미 리뷰를 작성하셨습니다.'); location.href='/volunteer134/volunteerMypage/"+vid+"/Cal'; </script>");
          out.flush();
          out.close();
          //mav.setViewName("home");
          //return mav;
      }
      return url;
      //return mav; // reviewwrite.jsp로 이동
   }
   
   
   @RequestMapping(value = "/reviewwrite", method = RequestMethod.POST)
   public ModelAndView reviewInsert(ReviewVO vo, HttpServletRequest request,@RequestParam String contents,@RequestParam String title,
 HttpServletResponse response, HttpSession session)throws Exception{
         ModelAndView mav= new ModelAndView();
         
         int vid = (Integer)session.getAttribute("volid");
         int progrmRegistNo = (Integer)session.getAttribute("progrmRegistNo1");
         System.out.println(vid+":"+progrmRegistNo);
         System.out.println(title+":"+contents+"232243243243");
         ReviewVO vo2 = new ReviewVO(vo);
         vo2.setVid(vid);
         vo2.setProgrmRegistNo(progrmRegistNo);
         vo2.setTitle(title);
         vo2.setContents(contents);
         
         
         
         System.out.println(vo.getVid()+vo.getProgrmRegistNo()+"332112");
         int result= service.reviewWrite(vo2);
         System.out.println(result+"kkkkkkkkkkkkkkkkkkkkkk");
         
         
         
      //성공하면 마이페이지 홈   
      if (result ==0) {
         mav.setViewName("reviewwrite");
      }else {
    	  response.setContentType("text/html; charset=UTF-8");
          PrintWriter out = response.getWriter();
          out.println("<script>alert('리뷰 작성이 완료되었습니다.'); location.href='/volunteer134/volunteerMypage/"+vid+"/Cal\'; </script>");
          out.flush();
          out.close();
         // mav.setViewName("redirect:/volunteerMypage/"+vid+"/Cal");
      }
    return mav;
   }
   


}