package vinfo;

public class VinfoVO {

	int progrmRegistNo;
	String progrmBgnde;
	String actBeginTm;
	String noticeBgnde;
	String noticeEndde;
	int rcritNmpr;
	int appTotal;
	String srvcClCode;
	String progrmSj;
	String progrmCn;
	String actEndTm;
	int cid;
	String actPlace;
	String progrmEndde;
	String actWkdy;
	String postAdres;
	public VinfoVO() {

	}

	public VinfoVO(VinfoVO vo, String large, String medium) {
		setProgrmRegistNo(vo.progrmRegistNo);
		setProgrmSj(vo.progrmSj);
		setProgrmBgnde(vo.progrmBgnde);
		setActBeginTm(vo.actBeginTm);
		setActEndTm(vo.actEndTm);
		setNoticeBgnde(vo.noticeBgnde);
		setNoticeEndde(vo.noticeEndde);
		setRcritNmpr(vo.rcritNmpr);
		setActPlace(vo.actPlace);
		setProgrmCn(vo.progrmCn);
		srvcClCode=large+" > "+medium;
	}
	public int getProgrmRegistNo() {
		return progrmRegistNo;
	}
	public void setProgrmRegistNo(int progrmRegistNo) {
		this.progrmRegistNo = progrmRegistNo;
	}
	public String getProgrmBgnde() {
		return progrmBgnde;
	}
	public void setProgrmBgnde(String progrmBgnde) {
		this.progrmBgnde = progrmBgnde;
	}
	public String getActBeginTm() {
		return actBeginTm;
	}
	public void setActBeginTm(String actBeginTm) {
		this.actBeginTm = actBeginTm;
	}
	public String getNoticeBgnde() {
		return noticeBgnde;
	}
	public void setNoticeBgnde(String noticeBgnde) {
		this.noticeBgnde = noticeBgnde;
	}
	public String getNoticeEndde() {
		return noticeEndde;
	}
	public void setNoticeEndde(String noticeEndde) {
		this.noticeEndde = noticeEndde;
	}
	public int getRcritNmpr() {
		return rcritNmpr;
	}
	public void setRcritNmpr(int rcritNmpr) {
		this.rcritNmpr = rcritNmpr;
	}
	public int getAppTotal() {
		return appTotal;
	}
	public void setAppTotal(int appTotal) {
		this.appTotal = appTotal;
	}
	public String getSrvcClCode() {
		return srvcClCode;
	}
	public void setSrvcClCode(String srvcClCode) {
		this.srvcClCode = srvcClCode;
	}
	public String getProgrmSj() {
		return progrmSj;
	}
	public void setProgrmSj(String progrmSj) {
		this.progrmSj = progrmSj;
	}
	public String getProgrmCn() {
		return progrmCn;
	}
	public void setProgrmCn(String progrmCn) {
		this.progrmCn = progrmCn;
	}
	public String getActEndTm() {
		return actEndTm;
	}
	public void setActEndTm(String actEndTm) {
		this.actEndTm = actEndTm;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getActPlace() {
		return actPlace;
	}
	public void setActPlace(String actPlace) {
		this.actPlace = actPlace;
	}
	public String getProgrmEndde() {
		return progrmEndde;
	}
	public void setProgrmEndde(String progrmEndde) {
		this.progrmEndde = progrmEndde;
	}
	public String getActWkdy() {
		return actWkdy;
	}
	public void setActWkdy(String actWkdy) {
		this.actWkdy = actWkdy;
	}
	public String getPostAdres() {
		return postAdres;
	}
	public void setPostAdres(String postAdres) {
		this.postAdres = postAdres;
	}
	

}
