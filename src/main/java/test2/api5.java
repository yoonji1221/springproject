package test2;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import vinfo.VinfoVO;

public class api5 {
   
    public final static String URL = "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrPartcptnItem";
    public final static String KEY = "cu5lTt61f79fVxxCAY8k8wyCUAX3YN0X7Pl3jo61yMe7Tc2eS%2Fy8oj9wTAKM17rVNL4wHiMk2stTkMM%2BH6O67A%3D%3D";
    public static void main(String[] args) throws Exception {
       
    //api1에 있던 값 호출하기   
      api1.main(args);
      ArrayList<Integer> numlist = api1.numlist;

      SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
      SqlSessionFactory factory = builder.build(Resources.getResourceAsReader("test2/test-config.xml"));
      SqlSession session = factory.openSession(true);
      System.out.println(session.getConnection().getAutoCommit()); //false
      
      TestDAO dao = new TestDAO();
      dao.setSession(session);
      TestMybatisService service = new TestMybatisService(); //EmpDAO : Mybatis
      service.setDao(dao);
      
      /////center
      String email = null;
      String nanmmbyNm = null;
      String nanmmbyNmAdmn = null;
      String postAdres = null;
      String telno = null;
      String mnnstNm = null;
      
      /////vinfo
    int progrmRegistNo = 0;
  	String progrmBgnde = null;
  	String actBeginTm = null;
  	String noticeBgnde = null;
  	String noticeEndde = null;
  	int rcritNmpr = 0;
  	//int appTotal;
  	String srvcClCode = null;
  	String progrmSj = null;
  	String progrmCn = null;
  	String actEndTm = null;
  	//int cid = 0;
  	String actPlace  = null;
  	String progrmEndde = null;
  	String actWkdy = null;
  	//String postAdres = null;

      BufferedReader br = null;
       
     //arraylist의 두번쨰값부터 비교
      for (Integer temp: numlist) {
     
      URL url = new URL(URL+"?ServiceKey="+KEY+"&progrmRegistNo="+temp+"&_type=json");
      
      HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
      urlconnection.setRequestMethod("GET");
      br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
      String result = "";
      String line;
           
      while ((line = br.readLine()) != null) {
         result = result + line + "\n";
      }
      //json 파싱 
      try { 
         JSONParser jsonParse = new JSONParser(); 
         
         JSONObject responseObj = (JSONObject) jsonParse.parse(result); 
         JSONObject bodyObj = (JSONObject) responseObj.get("response");
         JSONObject bodys = (JSONObject) bodyObj.get("body");
         JSONObject items = (JSONObject) bodys.get("items");
         JSONObject item = (JSONObject) items.get("item");
         
         //////center
         email = item.get("email").toString();
         nanmmbyNm = item.get("nanmmbyNm").toString();
         nanmmbyNmAdmn = item.get("nanmmbyNmAdmn").toString();
         postAdres = item.get("postAdres").toString();
         telno = item.get("telno").toString();
         mnnstNm = item.get("mnnstNm").toString(); 
         
         /////vinfo
         progrmRegistNo = Integer.parseInt(item.get("progrmRegistNo").toString());
     	 progrmBgnde = item.get("progrmBgnde").toString();
     	 actBeginTm = item.get("actBeginTm").toString();
     	 noticeBgnde = item.get("noticeBgnde").toString();
     	 noticeEndde = item.get("noticeEndde").toString();
     	 rcritNmpr = Integer.parseInt(item.get("rcritNmpr").toString());
     	 //appTotal;
     	 srvcClCode = item.get("srvcClCode").toString();
     	 progrmSj= item.get("progrmSj").toString();
     	 progrmCn= item.get("progrmCn").toString();
     	 actEndTm= item.get("actEndTm").toString();
     	//int cid;
     	 actPlace = item.get("actPlace").toString();
     	 progrmEndde= item.get("progrmEndde").toString();
     	 actWkdy= item.get("actWkdy").toString();
     	 //postAdres= item.get("postAdres").toString();

      }catch(Exception e) {
         e.printStackTrace();
      }
      
      ////center
     HashMap<String, String> map = new HashMap<String, String>();
      //map.put("actPlace", actPlace);
      map.put("email", email);
      map.put("nanmmbyNm", nanmmbyNm);
      map.put("nanmmbyNmAdmn", nanmmbyNmAdmn);
      map.put("postAdres", postAdres);
      map.put("telno", telno);
      map.put("mnnstNm", mnnstNm);
      
      service.check(map);
      //System.out.println("center 완료");
      
      ////vinfo 
//      HashMap<String, Object> map2 = new HashMap<String, Object>();
//      map2.put("progrmRegistNo", progrmRegistNo);
//      map2.put("progrmBgnde", progrmBgnde);
//      map2.put("actBeginTm", actBeginTm);
//      map2.put("noticeBgnde", noticeBgnde);
//      map2.put("noticeEndde", noticeEndde);
//      map2.put("rcritNmpr", rcritNmpr);
//      map2.put("srvcClCode", srvcClCode);
//      map2.put("progrmSj", progrmSj);
//      map2.put("progrmCn", progrmCn);
//      map2.put("actEndTm", actEndTm);
//      map2.put("actPlace", actPlace);
//      map2.put("progrmEndde", progrmEndde);
//      map2.put("actWkdy", actWkdy);
//      map2.put("postAdres", postAdres);
      
      VinfoVO vo = new VinfoVO();
      vo.setProgrmRegistNo(progrmRegistNo);
      vo.setActBeginTm(actBeginTm);
      vo.setProgrmBgnde(progrmBgnde);
      vo.setActBeginTm(actBeginTm);
      vo.setNoticeBgnde(noticeBgnde);
      vo.setNoticeEndde(noticeEndde);
      vo.setRcritNmpr(rcritNmpr);
      vo.setSrvcClCode(srvcClCode);
      vo.setProgrmSj(progrmSj);
      vo.setProgrmCn(progrmCn);
      vo.setActEndTm(actEndTm);
      vo.setActPlace(actPlace);
      vo.setProgrmEndde(progrmEndde);
      vo.setActWkdy(actWkdy);
      vo.setPostAdres(postAdres);
      
      service.insertVinfo(vo);
      service.updateCid(map);
      //System.out.println("vinfo 완료");
      
      
   }
}
}