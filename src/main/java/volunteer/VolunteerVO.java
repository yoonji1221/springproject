package volunteer;

import org.springframework.stereotype.Component;

@Component
public class VolunteerVO {
	int vid;
	String id;
	String pw;
	String address;
	String mail;
	String phone;
	String preference1;
	String preference2;
	String preference3;
	public int getVid() {
		return vid;
	}
	public void setVid(int vid) {
		this.vid = vid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPreference1() {
		return preference1;
	}
	public void setPreference1(String preference1) {
		this.preference1 = preference1;
	}
	public String getPreference2() {
		return preference2;
	}
	public void setPreference2(String preference2) {
		this.preference2 = preference2;
	}
	public String getPreference3() {
		return preference3;
	}
	public void setPreference3(String preference3) {
		this.preference3 = preference3;
	}
	
	
}
