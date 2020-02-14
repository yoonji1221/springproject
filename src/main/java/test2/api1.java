package test2;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.apache.ibatis.io.Resources;

public class api1 {

	
	 public final static String URL = "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrSearchWordList";
	 public final static String KEY = "cu5lTt61f79fVxxCAY8k8wyCUAX3YN0X7Pl3jo61yMe7Tc2eS%2Fy8oj9wTAKM17rVNL4wHiMk2stTkMM%2BH6O67A%3D%3D";
	 public static ArrayList<Integer> numlist = new ArrayList<Integer>();
	 public static ArrayList<String> rcritNmpr = new ArrayList<String>();
	 public static ArrayList<String> appTotal = new ArrayList<String>();
	 public static void main(String[] args) throws Exception {
		
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = builder.build(Resources.getResourceAsReader("test2/test-config.xml"));
		SqlSession session = factory.openSession(true);
		System.out.println(session.getConnection().getAutoCommit()); //false
		
		TestDAO dao = new TestDAO();
		dao.setSession(session);
		TestMybatisService service = new TestMybatisService(); //EmpDAO : Mybatis
		service.setDao(dao);
		
		int progrmRegistNo=0;
		String actPlace = null;
		String email = null;
		String nanmmbyNm = null;
		String nanmmbyNmAdmn = null;
		String postAdres = null;
		String telno = null;
		String mnnstNm = null;
		String appTotal2=null;
		String rcritNmpr2=null;
		BufferedReader br = null;

		URL url = new URL(URL+"?ServiceKey="+KEY+"&numOfRows=300&pageNo=3&progrmBgnde=20200101&progrmEndde=20200505&_type=json");
		 
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
	      //JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.   
	      JSONParser jsonParse = new JSONParser(); 
	      
	      //JSONObject에서 PersonsArray를 get하여 JSONArray에 저장한다.
	      JSONObject responseObj = (JSONObject) jsonParse.parse(result); 
	      
	      
	      JSONObject bodyObj = (JSONObject) responseObj.get("response");
	      JSONObject bodys = (JSONObject) bodyObj.get("body");
	      JSONObject items = (JSONObject) bodys.get("items");
    
	      JSONArray item = (JSONArray) items.get("item");
//	      JSONArray personArray = (JSONArray) jsonObj.get("response/body");
	      
	     
	      for(int i=0;i<item.size();i++){
				JSONObject tmp = (JSONObject)item.get(i);
			    progrmRegistNo=Integer.parseInt(tmp.get("progrmRegistNo").toString());
				actPlace=(String)(tmp.get("actPlace"));
				rcritNmpr2=(String)(tmp.get("rcritNmpr"));
				appTotal2=(String)(tmp.get("appTotal"));
				String progrmSj = (String)tmp.get("progrmSj");
				
				numlist.add(progrmRegistNo);
				rcritNmpr.add(rcritNmpr2);
				appTotal.add(appTotal2);
				
				System.out.println("봉사번호 : "+progrmRegistNo);
				System.out.println("봉사장소 : "+actPlace);
				System.out.println("봉사제목 : "+progrmSj);
				System.out.println("========================");
				System.out.println(numlist.size());
			}
	           
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	     
	 }
	
}
        
    
   

