package center;
///sdfg
public class CenterVO {

   String mnnstNm;
   int cid;
   String actplace;
   String nanmmbyNm;
   String nanmmbyNmAdmn;
   String email;
   String postAdres;
   String telno;

   

public CenterVO() {}
   public CenterVO(CenterVO vo, int cid) {
	      setMnnstNm(vo.getMnnstNm());
	      setNanmmbyNm(vo.getNanmmbyNm());
	      setNanmmbyNmAdmn(vo.getNanmmbyNmAdmn());
	      setTelno(vo.getTelno());
	      setPostAdres(vo.getPostAdres());
	      setCid(cid);
	   }
   public CenterVO(CenterVO vo, int cid, String email) {
      setCid(cid);
      setEmail(email);
   }
   public String getMnnstNm() {
      return mnnstNm;
   }
   public void setMnnstNm(String mnnstNm) {
      this.mnnstNm = mnnstNm;
   }
   public int getCid() {
      return cid;
   }
   public void setCid(int cid) {
      this.cid = cid;
   }
   public String getActplace() {
      return actplace;
   }
   public void setActplace(String actplace) {
      this.actplace = actplace;
   }
   public String getNanmmbyNm() {
      return nanmmbyNm;
   }
   public void setNanmmbyNm(String nanmmbyNm) {
      this.nanmmbyNm = nanmmbyNm;
   }
   public String getNanmmbyNmAdmn() {
      return nanmmbyNmAdmn;
   }
   public void setNanmmbyNmAdmn(String nanmmbyNmAdmn) {
      this.nanmmbyNmAdmn = nanmmbyNmAdmn;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPostAdres() {
      return postAdres;
   }
   public void setPostAdres(String postAdres) {
      this.postAdres = postAdres;
   }
   public String getTelno() {
      return telno;
   }
   public void setTelno(String telno) {
      this.telno = telno;
   }

}