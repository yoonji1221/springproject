package admin;

public class AdminVO {
	String adminid;
	String adminpw;
	String yourname;
	   String subject;
	   String youremail;
	   String message;


	   public String getYourname() {
	      return yourname;
	   }

	   public void setYourname(String yourname) {
	      this.yourname = yourname;
	   }

	   public String getSubject() {
	      return subject;
	   }

	   public void setSubject(String subject) {
	      this.subject = subject;
	   }

	   public String getYouremail() {
	      return youremail;
	   }

	   public void setYouremail(String youremail) {
	      this.youremail = youremail;
	   }

	   public String getMessage() {
	      return message;
	   }

	   public void setMessage(String message) {
	      this.message = message;
	   }
	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpw() {
		return adminpw;
	}

	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}

}
