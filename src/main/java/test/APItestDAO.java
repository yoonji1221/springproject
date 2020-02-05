package test;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Enumeration;

/*�����ͺ��̽��� �����Ͽ� ���ۿ� ���� ��������ǵ� Ŭ���� �Դϴ�.*/
public class APItestDAO {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	// jdbc ����̹� �ּ�
	static final String DB_URL = "jdbc:mysql://localhost:3306/yourWeather?useSSL=false";
	// DB ���� �ּ�
	// localhost�� �����Ϸ��� �����ͺ��̽� �ּҸ� �Է��Ͻø� �˴ϴ�. localhost�� ����ϸ� �˴ϴ�.
	// 3306�� �����ͺ��̽��� �����Ҷ� ����ϴ� ���͹�ȣ�Դϴ�. ��ġ�Ҷ� ������ ��Ʈ��ȣ�� ����մϴ�.
	// yourWeather���� �����Ϸ��� database�� name�� �Է����ݴϴ�.
	static final String USERNAME = "root";
	// DB ID
	static final String PASSWORD = "root";
	// DB Password
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	// VillageWeather��ü�� �Է¹����� ��ü���� �Ӽ��� �ʱ�ȭ�� �����͵��� �����ͺ��̽��� �μ�Ʈ�ϴ� �޼ҵ��Դϴ�.
	public void intertVillageWeather(int id, VillageWeather v) {
		String query = "INSERT INTO yourweather.Village_Weather" + " VALUE(" + id + ",'" + v.getBaseDate() + "','"
				+ v.getBaseTime() + "','" + v.getPop() + "','" + v.getPty() + "','" + v.getR06() + "','" + v.getReh()
				+ "','" + v.getS06() + "','" + v.getSky() + "','" + v.getT3h() + "','" + v.getTmn() + "','" + v.getTmx()
				+ "','" + v.getUuu() + "','" + v.getVvv() + "','" + v.getWav() + "','" + v.getVec() + "','" + v.getWsd()
				+ "');";
		System.out.print("YourWeather Database ���� : ");
		try {
			// �����ͺ��̽��� �����մϴ�.
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
			// �����ͺ��̽� ���� ����� ����մϴ�.
			if (conn != null) {
				System.out.println("����");
			} else {
				System.out.println("����");
			}
			System.out.println(query);
			// ����� �������� ����մϴ�.
			stmt = conn.createStatement();
			// �������� ������ Statement ��ü�� ����ϴ�.
			stmt.executeUpdate(query);
			// �������� �����ŵ�ϴ�.
			stmt.close();
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Class Not Found Exection");
		} catch (SQLException e) {
			System.out.println("SQL Exception : " + e.getMessage());
		}
	}
}
