package vinfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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

import center.CenterVO;
import preference.PagingVO;
import preference.PreferenceVO;

@Controller
public class VinfoController {

   @Autowired
   VinfoService service;

   //신지
   @RequestMapping(value="/vinfoupload",method=RequestMethod.GET)
   public ModelAndView insertVinfo(HttpServletRequest req) {
      ModelAndView mav= new ModelAndView();
      HttpSession session = req.getSession();

      
      System.out.println((Integer)session.getAttribute("dbcid")+"zazazazazaz");
   
      int cid = (Integer)session.getAttribute("dbcid");
      
      System.out.println(cid+"ciiiiiiiiiiiiiiiiiid");
      List<CenterVO> center = service.getCenterName(cid);
   
      mav.addObject("center",center);
      mav.addObject("cid",cid);
      
      //0216g효진수정
      List<PreferenceVO> large = service.largelist();
      
      mav.addObject("large", large);
      mav.setViewName("vinfoUpload");
      System.out.println(large.size());
      return mav;
   }
   
   @RequestMapping(value="/vinfoupload", method=RequestMethod.POST)
   public ModelAndView insertVinfoProcess(VinfoVO vo,HttpServletRequest request,
         HttpServletResponse response) throws Exception{
      ModelAndView mav= new ModelAndView();
      String large = request.getParameter("preference");
      String medium = request.getParameter("detailprefer");
      
      System.out.println(large+"**********************"+medium);
      
      int cid = Integer.parseInt(request.getParameter("cid"));
      String postAdres = request.getParameter("postAdres");
      
      vo  = new VinfoVO(vo, large, medium, cid, postAdres);
      
   
      int result= service.insertVinfo(vo);
      
      //result = 0 이면 false
      if (result == 0) {
         mav.setViewName("vinfoUpload");
      }else {
    	  
    	  response.setContentType("text/html; charset=UTF-8");
          PrintWriter out = response.getWriter();
          out.println("<script>alert('봉사 정보가 등록되었습니다.'); location.href='/volunteer134/centercal'; </script>"); //history.go(-1);        
          out.flush();
          out.close();    
    	  
         mav.setViewName("redirect:/centercal");
      }
      
      return mav;
   }
   
   @RequestMapping(value="/vinfoupload/precheck",method=RequestMethod.GET)
   @ResponseBody
      public List<VinfoVO> insertPrac(@RequestParam("selected_large") String selected_large) {
      List<VinfoVO> mlist = service.getMediumField(selected_large);
      System.out.println(mlist.size()+"mlist개수 찍히나 보자");
      return mlist;
   }
   

   // 봉사 전체 리스트 --내꼬
   @RequestMapping("/vinfolist")
   public ModelAndView boardList(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
         @RequestParam(value = "cntPerPage", required = false) String cntPerPage,HttpServletRequest req) throws Exception, SQLException {
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
//      HttpSession session = req.getSession();
//      int i = (Integer)session.getAttribute("volid");
//      System.out.println(i+"<--vinfo 세션");
      vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
      List<VinfoVO> list = service.vinfolistPaging(vo);
      List<VinfoVO> silist = service.silist();
      List<PreferenceVO> largelist = service.largelist();

      mav.addObject("silist", silist);
      mav.addObject("largelist", largelist);
      mav.addObject("paging", vo);
      mav.addObject("viewAll", list);
      mav.setViewName("vinfoAllList");
      //오늘 날짜  기준으로 모집시작일(20200301) >= 20200216 = 모집 대기
        // 모집마감일(20200101) < 20200216 = 모집 완료
        SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");               
        String format_time1 = format1.format (System.currentTimeMillis());                              
        System.out.println("today = " + format_time1);
        mav.addObject("today", format_time1);
        mav.setViewName("vinfoAllList");
        return mav;
      
   
   }

   //선호봉사, 지역 뽑기
   @RequestMapping(value="/vinfolist/search", method = RequestMethod.GET)
   @ResponseBody
   public List<VinfoVO> searchvinfo(@RequestParam(required = false) String address,
         @RequestParam(required = false) String detailaddress, @RequestParam(required = false) String preference,
         @RequestParam(required = false) String detailprefer){
      List<VinfoVO> resultlist =null;
      ParameterVO vo = new ParameterVO();
      String undefined = detailaddress.toString();
      if(detailaddress!=null && detailprefer!=null&& address!=null && preference!=null) {//모든 조건 조회dd
         vo.setAddress(address);
         vo.setDetailaddress(detailaddress);
         vo.setPreference(preference);
         vo.setDetailprefer(detailprefer);
         resultlist = service.allsearchresult(vo);
      }
      if(detailaddress.equals("전체") && detailprefer.equals("전체") && address!=null && preference!=null) { //둘다 큰것만 조회dd
            vo.setAddress(address);
            vo.setDetailaddress(detailaddress);
            vo.setPreference(preference);
            vo.setDetailprefer(detailprefer);
            return resultlist = service.fronttworesult(vo);
            
      }
//      if(detailaddress.equals(undefined) && detailprefer.equals("전체") && preference!=null) { //분야 큰것만 조회
//         System.out.println(detailaddress+"zzzzzzzzzzzs"+detailprefer+"zzzzzzzzzzzs"+address+"zzzzzzzzzzzs"+preference+"zzzzzzzzzzzs");
//         vo.setAddress(address);
//         vo.setDetailaddress(detailaddress);
//         vo.setPreference(preference);
//         vo.setDetailprefer(detailprefer);
//         resultlist = service.bigprefer(vo);
//         System.out.println(resultlist.size()+"aaaaaa");
//         return resultlist;
//      }
   
      if(detailaddress!=null && detailprefer.equals("") && address!=null && preference.equals("")) { //지역만 조회 dd
         vo.setAddress(address);
         vo.setDetailaddress(detailaddress);
         vo.setPreference(preference);
         vo.setDetailprefer(detailprefer);
         resultlist = service.addresssearch(vo);
         
      }   if(detailaddress.equals(undefined) && detailprefer!=null && address.equals("") && preference!=null) { //분야만 조회dd
         vo.setAddress(address);
         vo.setDetailaddress(detailaddress);
         vo.setPreference(preference);
         vo.setDetailprefer(detailprefer);
         resultlist = service.prefersearch(vo);
      }      
      if(detailaddress!=null && detailprefer.equals("전체") && address!=null && preference!=null) { //봉사지역 2개 봉사분야 1개검색dd
         vo.setAddress(address);
         vo.setDetailaddress(detailaddress);
         vo.setPreference(preference);
         vo.setDetailprefer(detailprefer);
         resultlist = service.searchresult(vo);
      }if(detailaddress.equals("전체") && detailprefer!=null && address!=null && preference!=null) { //봉사지역1개 봉사분야 2개검색dd
         vo.setAddress(address);
         vo.setDetailaddress(detailaddress);
         vo.setPreference(preference);
         vo.setDetailprefer(detailprefer);
         resultlist = service.searchresult(vo);
      }
      System.out.println(resultlist.size()+"사이즈~~");
      return resultlist;
   }
   // 봉사리스트 지역선택하면 나머지지역 뽑기
   @RequestMapping(value = "/vinfolist/addresscheck", method = RequestMethod.GET)
   @ResponseBody
   public List<VinfoVO> detailaddress(@RequestParam("selected_address") String selected_address) {
      List<VinfoVO> detaillist = service.detailaddress(selected_address);
      // System.out.println(detaillist.size()+"Zzzzzzzzzzzzzzz");
      return detaillist;
   }

   // 봉사리스트 분야 large 선택하면 medium 뽑기
   @RequestMapping(value = "/vinfolist/prefercheck", method = RequestMethod.GET)
   @ResponseBody
   public List<PreferenceVO> getmlist(@RequestParam("selected_large") String selected_large) {
      List<PreferenceVO> getmlist = service.getmlist(selected_large);
      return getmlist;
   }

   @RequestMapping("/vinfodetail")
   public ModelAndView vinfodetail(@RequestParam int progrmRegistNo) throws IndexOutOfBoundsException  {
      ModelAndView mav = new ModelAndView();
      List<VinfoVO> list = service.vinfodetail(progrmRegistNo);
      mav.addObject("list", list);
      mav.setViewName("volunDetail");
      return mav;
   }

   //효진
   // 봉사 정보 지도로 확인하기
   @RequestMapping(value = "/vinfoMap", method = RequestMethod.GET)
   public ModelAndView vinfoMap() {
      ModelAndView mav = new ModelAndView();
      List<CenterVO> list = service.getTotalCenter(); 
      List<VinfoVO> silist = service.silist();
      mav.addObject("silist", silist);
      mav.addObject("list", list);
      mav.setViewName("centerMap");
      return mav;
   }
   
   // 봉사 정보 지도로 확인하기
   @RequestMapping(value = "/vinfoMap/{cid}")
   public ModelAndView vinfoMapP(@PathVariable("cid") int cid) {
      ModelAndView mav = new ModelAndView();
      List<CenterVO> list = service.getTotalCenter();
      List<VinfoVO> vinfolist = service.centerVinfo(cid);
      String mnnstnm = service.centerName(cid);
      List<VinfoVO> silist = service.silist();
      mav.addObject("silist", silist);
      mav.addObject("viewAll", vinfolist);
      mav.addObject("list", list);
      mav.addObject("mnnstnm", mnnstnm);
      mav.addObject("test", cid);
      
      //02166효진수정
      SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");               
      String format_time1 = format1.format (System.currentTimeMillis());                              
      System.out.println("today = " + format_time1);
      mav.addObject("today", format_time1);
      mav.setViewName("centerMap");
      return mav;
   }
   
   @RequestMapping(value="/vinfoMap/search", method = RequestMethod.GET)
   @ResponseBody
   public List<CenterVO> searchAddress(@RequestParam(required = false) String address){
      List<CenterVO> list = service.searchAdd(address);
      for(int i = 0; i<list.size(); i++) {         
         System.out.println(i +" = " + list.get(i).getPostAdres());         
      }
      return list;   
   }


}