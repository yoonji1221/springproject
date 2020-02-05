package test2;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class api5 {

	public final static String URL = "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrPartcptnItem";
	public final static String KEY = "cu5lTt61f79fVxxCAY8k8wyCUAX3YN0X7Pl3jo61yMe7Tc2eS%2Fy8oj9wTAKM17rVNL4wHiMk2stTkMM%2BH6O67A%3D%3D";

	public static void main(String[] args) throws Exception {
		api1.main(args);
		ArrayList<Integer> numlist = api1.numlist;
		ArrayList<String> rcritNmpr = api1.rcritNmpr;
		ArrayList<String> appTotal = api1.appTotal;
		System.out.println("넘어오는 리스트 사이즈" + numlist);
		
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = builder.build(Resources.getResourceAsReader("test2/test-config.xml"));
		SqlSession session = factory.openSession(true);
		System.out.println(session.getConnection().getAutoCommit()); // false

		TestDAO dao = new TestDAO();
		dao.setSession(session);
		TestMybatisService service = new TestMybatisService(); // EmpDAO : Mybatis
		service.setDao(dao);
		String actPlace = null;
		String email = null;
		String nanmmbyNm = null;
		String nanmmbyNmAdmn = null;
		String postAdres = null;
		String telno = null;
		String mnnstNm = null;

		BufferedReader br = null;

		int add = 0;

		for (int num : numlist) {
			add = num;
			// System.out.println(num);

			URL url = new URL(URL + "?ServiceKey=" + KEY + "&progrmRegistNo=" + add + "&_type=json");

			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while ((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
			// json 파싱
			JSONParser jsonParse = new JSONParser();
			JSONObject responseObj = (JSONObject) jsonParse.parse(result);
			JSONObject bodyObj = (JSONObject) responseObj.get("response");
			JSONObject bodys = (JSONObject) bodyObj.get("body");
			JSONObject items = (JSONObject) bodys.get("items");
			JSONObject item = (JSONObject) items.get("item");

			try {
				actPlace = item.get("actPlace").toString();
				email = item.get("email").toString();
				nanmmbyNm = item.get("nanmmbyNm").toString();
				nanmmbyNmAdmn = item.get("nanmmbyNmAdmn").toString();
				postAdres = item.get("postAdres").toString();
				telno = item.get("telno").toString();
				mnnstNm = item.get("mnnstNm").toString();
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("actPlace", actPlace);
			map.put("nanmmbyNm", nanmmbyNm);
			map.put("nanmmbyNmAdmn", nanmmbyNmAdmn);
			map.put("postAdres", postAdres);
			map.put("telno", telno);
			map.put("mnnstNm", mnnstNm);
			
			
			List<TestVO> list = service.getEmpDynamicwhere(map);
			for (TestVO vo : list) {
				System.out.println(vo.getNanmmbyNm() + " : " + vo.getNanmmbyNmAdmn());
			}

			HashMap<String, Object> map2 = new HashMap<String, Object>();
			
			map2.put("rcritNmpr",rcritNmpr);
			map2.put("appTotal", appTotal);
			map2.put("progrmRegistNo", numlist);
			
			List<TestVO> list2 = service.vinfoinsert(map2);
			for (TestVO vo2 : list2) {
				System.out.println(vo2.getNanmmbyNm() + " : " + vo2.getNanmmbyNmAdmn());
			}
			
		}
	}
}
