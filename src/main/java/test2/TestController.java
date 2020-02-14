package test2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
   @Autowired
   TestService service;
   
   public final static String URL = "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrPartcptnItem";
   public final static String KEY = "cu5lTt61f79fVxxCAY8k8wyCUAX3YN0X7Pl3jo61yMe7Tc2eS%2Fy8oj9wTAKM17rVNL4wHiMk2stTkMM%2BH6O67A%3D%3D";

   @RequestMapping("/dbinsert")
   public ModelAndView insertDb() throws Exception {
	   
      ModelAndView mav = new ModelAndView();

      String actPlace = null;
      String email = null;
      String nanmmbyNm = null;
      String nanmmbyNmAdmn = null;
      String postAdres = null;
      String telno = null;
      String mnnstNm = null;

      BufferedReader br = null;

      URL url = new URL(URL+"?ServiceKey="+KEY+"&progrmRegistNo=2611220&_type=json");
       
      HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
      urlconnection.setRequestMethod("GET");
      br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
      String result = "";
      String line;
      while ((line = br.readLine()) != null) {
         result = result + line + "\n";
      }

      //json ÆÄ½Ì 
      try { 
         JSONParser jsonParse = new JSONParser(); 
         
         JSONObject responseObj = (JSONObject) jsonParse.parse(result); 
         JSONObject bodyObj = (JSONObject) responseObj.get("response");
         JSONObject bodys = (JSONObject) bodyObj.get("body");
         JSONObject items = (JSONObject) bodys.get("items");
         JSONObject item = (JSONObject) items.get("item");
         
         actPlace = item.get("actPlace").toString();
         email = item.get("email").toString();
         nanmmbyNm = item.get("nanmmbyNm").toString();
         nanmmbyNmAdmn = item.get("nanmmbyNmAdmn").toString();
         postAdres = item.get("postAdres").toString();
         telno = item.get("telno").toString();
         mnnstNm = item.get("mnnstNm").toString(); 
      }catch(Exception e) {
         e.printStackTrace();
      }
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("actPlace", actPlace);
      map.put("email", email);
      map.put("nanmmbyNm", nanmmbyNm);
      map.put("nanmmbyNmAdmn", nanmmbyNmAdmn);
      map.put("postAdres", postAdres);
      map.put("telno", telno);
      map.put("mnnstNm", mnnstNm);
      
      //service.getEmpDynamicwhere(map);

      mav.addObject("result2", "insert¿Ï·á");
      mav.setViewName("/test/test");
      
      return mav;
   }
}

