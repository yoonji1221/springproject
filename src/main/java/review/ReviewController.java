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

   // ��ü ���� ����Ʈ(�Խ���)
   @RequestMapping("/reviewlist")
   public ModelAndView reviewList() {
      ModelAndView mav = new ModelAndView();
      List<ReviewVO> list = service.reviewlist();
      mav.addObject("list", list);
      mav.setViewName("reviewlist");
      return mav;
   }

   // ���� �ڼ��� ����(�Խ���)
   @RequestMapping(value = "/reviewdetail", method = RequestMethod.GET)
   public ModelAndView reviewDetail(@RequestParam("rid") int rid) {
      ModelAndView mav = new ModelAndView();
      List<ReviewVO> list2 = service.getreviewdetail(rid);
      service.updateViewcount();
      mav.addObject("list2", list2);
      mav.setViewName("reviewdetail");
      return mav;
   }

   // ���� �� ���� ����Ʈ
   @RequestMapping("/myreviewlist")
   public ModelAndView myreviewList(@RequestParam("vid") int vid, HttpSession session) {
      ModelAndView mav = new ModelAndView();
     // vid= Integer.parseInt(session.getAttribute("vid").toString()); //�α��� ����
      System.out.println(vid + "������ĸ�!!");
      List<ReviewVO> list = service.myreviewlist(vid);
      mav.addObject("list", list);
 
      mav.setViewName("myreviewlist");
      System.out.println(list.size() + " : ���������䰳��");
      return mav;
   }

   // ���� �ڼ��� ����(����������)
   @RequestMapping(value = "/reviewdetailmp", method = RequestMethod.GET)
   public ModelAndView reviewDetailMP(@RequestParam("rid") int rid) {
      ModelAndView mav = new ModelAndView();
      List<ReviewVO> list2 = service.getreviewdetail(rid);
      mav.addObject("list2", list2);
      mav.setViewName("reviewdetailMP");
      return mav;
   }

   // ���� ����
   @RequestMapping(value = "/reviewupdate", method = RequestMethod.POST)
   public String reviewUpdateProcess(@ModelAttribute ReviewVO vo) throws Exception {
      service.reviewUpdate(vo);
      return "redirect:myreviewlist";
   }

   // ���� ����
   @RequestMapping(value = "/reviewdelete", method = RequestMethod.POST)
   public String reviewDeleteProcess(@RequestParam int mid) throws Exception {
      service.reviewDelete(mid);
      return "redirect:myreviewlist";
   }

   // ���� �ۼ�
   @RequestMapping(value = "/reviewwrite", method = RequestMethod.GET)
   public ModelAndView reviewWrite() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("reviewwrite");
      return mav; // reviewwrite.jsp�� �̵�
   }

   @RequestMapping(value = "/reviewwrite", method = RequestMethod.POST)
   public String reviewInsert(@ModelAttribute ReviewVO vo) throws Exception {
      service.reviewWrite(vo);
      return "redirect:reviewlist";
   }

}