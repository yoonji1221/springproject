package test;

	import java.io.BufferedReader;
	import java.io.IOException;
	import java.io.InputStreamReader;
	import java.net.HttpURLConnection;
	import java.net.URL;
	import org.json.simple.JSONArray;
	import org.json.simple.JSONObject;
	import org.json.simple.parser.JSONParser;

	public class OpenAPI1{
	   public static void main(String[] args) throws IOException {

	      BufferedReader br = null;
	      String urlstr ="http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrSearchWordList"
	                 + "?ServiceKey=cu5lTt61f79fVxxCAY8k8wyCUAX3YN0X7Pl3jo61yMe7Tc2eS%2Fy8oj9wTAKM17rVNL4wHiMk2stTkMM%2BH6O67A%3D%3D"
	                 + "&numOfRows=100&progrmBgnde=20200101&progrmEndde=20200505&_type=json";
	      
	      URL url = new URL(urlstr);
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
				int progrmRegistNo=Integer.parseInt(tmp.get("progrmRegistNo").toString());
				String actPlace=(String)(tmp.get("actPlace"));
				String nanmmbyNm=(String)(tmp.get("nanmmbyNm"));
				int progrmBgnde=Integer.parseInt(tmp.get("progrmBgnde").toString());
				int actBeginTm=Integer.parseInt(tmp.get("actBeginTm").toString());
				int actEndTm=Integer.parseInt(tmp.get("actEndTm").toString());
				int noticeBgnde=Integer.parseInt(tmp.get("noticeBgnde").toString());
				int noticeEndde=Integer.parseInt(tmp.get("noticeEndde").toString());
			//	int rcritNmpr=Integer.parseInt(tmp.get("rcritNmpr").toString());
			//	int appTotal=Integer.parseInt(tmp.get("appTotal").toString());
				String srvcClCode=(String)(tmp.get("srvcClCode"));
				String progrmSj = (String)tmp.get("progrmSj");
			

				System.out.println("봉사번호 : "+progrmRegistNo);
				//mnnstNm 없고
				System.out.println("봉사장소 : "+actPlace);
				System.out.println("등록기관 : " + nanmmbyNm);
				//nanmmbyAdmn 담당자명, 주소, 전화번호, 이메일 없고
				System.out.println("=================================================");
			
				
				System.out.println("봉사날짜 : "+progrmBgnde);
				System.out.println("봉사시작시간 : "+actBeginTm);
				System.out.println("봉사종료시간 : "+actEndTm);
				System.out.println("모집시작 : "+noticeBgnde);
				System.out.println("모집종료 : "+noticeEndde);
			//	System.out.println("모집인원 : "+rcritNmpr);
			//	System.out.println("신청인원 : "+appTotal);
				System.out.println("봉사분야 : "+srvcClCode);
				System.out.println("봉사제목 : "+progrmSj);
				System.out.println("========================");
			}
	           
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      

	      

	         //   System.out.println(result + "\n");

	   }

	}

