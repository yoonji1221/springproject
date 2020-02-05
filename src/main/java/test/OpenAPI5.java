package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class OpenAPI5 {
	public static void main(String[] args) throws IOException {

		BufferedReader br = null;
		/*
		 * String urlstr =
		 * "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrPartcptnItem"
		 * +
		 * "?serviceKey=cu5lTt61f79fVxxCAY8k8wyCUAX3YN0X7Pl3jo61yMe7Tc2eS%2Fy8oj9wTAKM17rVNL4wHiMk2stTkMM%2BH6O67A%3D%3D"
		 * + "&progrmRegistNo=2573069&_type=json"; // +
		 * "&pageNo=1&numOfRows=100&dataType=JSON&regId=11B20603"; // +&2608811";
		 */

		String urlstr = "http://openapi.1365.go.kr/openapi/service/rest/VolunteerPartcptnService/getVltrPartcptnItem"
				+ "?ServiceKey=cu5lTt61f79fVxxCAY8k8wyCUAX3YN0X7Pl3jo61yMe7Tc2eS%2Fy8oj9wTAKM17rVNL4wHiMk2stTkMM%2BH6O67A%3D%3D"
				+ "&progrmRegistNo=2611220&_type=json";
		
		URL url = new URL(urlstr);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		urlconnection.setRequestMethod("GET");
		br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
		String result = "";
		String line;
		while ((line = br.readLine()) != null) {
			result = result + line + "\n";
		}

		// json �Ľ�
		try {
			// JSONParse�� json�����͸� �־� �Ľ��� ���� JSONObject�� ��ȯ�Ѵ�.
			JSONParser jsonParse = new JSONParser();

			// JSONObject���� PersonsArray�� get�Ͽ� JSONArray�� �����Ѵ�.
			JSONObject responseObj = (JSONObject) jsonParse.parse(result);

			JSONObject bodyObj = (JSONObject) responseObj.get("response");
			JSONObject bodys = (JSONObject) bodyObj.get("body");
			JSONObject items = (JSONObject) bodys.get("items");
			// JSONObject item = (JSONObject) items.get("item");

			JSONObject item = (JSONObject) items.get("item");
//	      JSONArray personArray = (JSONArray) jsonObj.get("response/body");

			int progrmRegistNo=Integer.parseInt(item.get("progrmRegistNo").toString());
			int progrmBgnde=Integer.parseInt(item.get("progrmBgnde").toString());
			int actBeginTm=Integer.parseInt(item.get("actBeginTm").toString());
			int actEndTm=Integer.parseInt(item.get("actEndTm").toString());
			int noticeBgnde=Integer.parseInt(item.get("noticeBgnde").toString());
			int noticeEndde=Integer.parseInt(item.get("noticeEndde").toString());
			String srvcClCode=(String)(item.get("srvcClCode"));
			String progrmCn = (String)item.get("progrmCn");
			String progrmSj = (String)item.get("progrmSj");
			
			String mnnstNm=(String)(item.get("mnnstNm"));
			
			String nanmmbyNm=(String)(item.get("nanmmbyNm"));
			String nanmmbyNmAdmn=(String)(item.get("nanmmbyNmAdmn"));
			String postAdres=(String)(item.get("postAdres"));
			String telno=(String)(item.get("telno"));
			
			int rcritNmpr = Integer.parseInt(item.get("rcritNmpr").toString());
			int appTotal = Integer.parseInt(item.get("appTotal").toString());

			System.out.println("�����ȣ : "+progrmRegistNo);
			System.out.println("���糯¥ : "+progrmBgnde);
			System.out.println("������۽ð� : "+actBeginTm);
			System.out.println("��������ð� : "+actEndTm);
			System.out.println("�������� : "+noticeBgnde);
			System.out.println("�������� : "+noticeEndde);
			//����, ��û�ο� ����
			System.out.println("����о� : "+srvcClCode);
			System.out.println("�������� : "+progrmCn);
			System.out.println("�󼼳��� : "+progrmSj);
			
			
			
			System.out.println("������� : " + mnnstNm);
			System.out.println("��ϱ�� : " + nanmmbyNm);
			System.out.println("����ڸ� : " + nanmmbyNmAdmn);
			System.out.println("����� �ּ� : " + postAdres);
			System.out.println("����� ��ȣ : " + telno);
			System.out.println("�����ο� : " + rcritNmpr);
			System.out.println("��û�ο� : " + appTotal);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// System.out.println(result + "\n");

	}

}
