package volunteer;

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
	String gender;
	String name;
	
	//20200218 À±Áö Ãß°¡
	String detailaddress;
	public VolunteerVO() {
		
	}

	public VolunteerVO(VolunteerVO vo, String large1, String medium1, String large2, String medium2,
			String large3, String medium3) {
		setId(vo.getId());
		setPw(vo.getPw());
		setAddress(vo.getAddress());
		setMail(vo.getMail());
		setPhone(vo.getPhone());
		setPreference1(large1+" > "+medium1);
		setPreference2(large2+" > "+medium2);
		setPreference3(large3+" > "+medium3);
		setName(vo.getName());
		setGender(vo.getGender());
	}

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

}
