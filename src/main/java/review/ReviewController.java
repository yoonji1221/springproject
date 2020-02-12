package review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {

   @Autowired
   ReviewService service;

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
      service.updateViewcount();
      mav.addObject("list2", list2);
      mav.setViewName("reviewdetail");
      return mav;
   }

   // 내가 쓴 리뷰 리스트
   @RequestMapping("/myreviewlist")
   public ModelAndView myreviewList(@RequestParam("vid") int vid, HttpSession session) {
      ModelAndView mav = new ModelAndView();
     // vid= Integer.parseInt(session.getAttribute("vid").toString()); //로그인 정보
      System.out.println(vid + "누가썼냐면!!");
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
   @RequestMapping(value = "/reviewupdate", method = RequestMethod.POST)
   public String reviewUpdateProcess(@ModelAttribute ReviewVO vo) throws Exception {
      service.reviewUpdate(vo);
      return "redirect:myreviewlist";
   }

   // 리뷰 삭제
   @RequestMapping(value = "/reviewdelete", method = RequestMethod.POST)
   public String reviewDeleteProcess(@RequestParam int mid) throws Exception {
      service.reviewDelete(mid);
      return "redirect:myreviewlist";
   }

   // 리뷰 작성
   @RequestMapping(value = "/reviewwrite", method = RequestMethod.GET)
   public ModelAndView reviewWrite() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("reviewwrite");
      return mav; // reviewwrite.jsp로 이동
   }

   @RequestMapping(value = "/reviewwrite", method = RequestMethod.POST)
   public String reviewInsert(@ModelAttribute ReviewVO vo) throws Exception {
      service.reviewWrite(vo);
      return "redirect:reviewlist";
   }

}