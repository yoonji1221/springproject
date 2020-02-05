package test2;

import org.springframework.stereotype.Component;

public class TestVO {
	//vinfo
	int progrmRegistNo; //봉사번호
	String cid; //담당자email
	String progrmBgnde;//봉사날짜
	int actBeginTm;//봉사시작시간
	int actEndTm;//봉사종료시간
	String noticeBgnde;//모집시작
	String noticeEndde;//모집종료
	String rcritNmpr;//모집인원
	int appTotal;//신청인원
	String srvcClCode; //봉사분야
	String progrmSj; //봉사제목
	String progrmCn; //상세내용
	
	
	////center
	String actPlace;String email;
	String nanmmbyNm;
	String nanmmbyNmAdmn;
	String postAdres;
	String telno;
	String mnnstNm;
	
	
	
	TestVO(){}

	public TestVO(int progrmRegistNo, String cid, String progrmBgnde, int actBeginTm, int actEndTm, String noticeBgnde,
			String noticeEndde, String rcritNmpr, int appTotal, String srvcClCode, String progrmSj, String progrmCn) {
		super();
		this.progrmRegistNo = progrmRegistNo;
		this.cid = cid;
		this.progrmBgnde = progrmBgnde;
		this.actBeginTm = actBeginTm;
		this.actEndTm = actEndTm;
		this.noticeBgnde = noticeBgnde;
		this.noticeEndde = noticeEndde;
		this.rcritNmpr = rcritNmpr;
		this.appTotal = appTotal;
		this.srvcClCode = srvcClCode;
		this.progrmSj = progrmSj;
		this.progrmCn = progrmCn;
	}
	public int getProgrmRegistNo() {
		return progrmRegistNo;
	}
	public void setProgrmRegistNo(int progrmRegistNo) {
		this.progrmRegistNo = progrmRegistNo;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getProgrmBgnde() {
		return progrmBgnde;
	}
	public void setProgrmBgnde(String progrmBgnde) {
		this.progrmBgnde = progrmBgnde;
	}
	public int getActBeginTm() {
		return actBeginTm;
	}
	public void setActBeginTm(int actBeginTm) {
		this.actBeginTm = actBeginTm;
	}
	public int getActEndTm() {
		return actEndTm;
	}
	public void setActEndTm(int actEndTm) {
		this.actEndTm = actEndTm;
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
	public String getRcritNmpr() {
		return rcritNmpr;
	}
	public void setRcritNmpr(String rcritNmpr) {
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
	
	
	public String getActPlace() {
		return actPlace;
	}

	public void setActPlace(String actPlace) {
		this.actPlace = actPlace;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getMnnstNm() {
		return mnnstNm;
	}

	public void setMnnstNm(String mnnstNm) {
		this.mnnstNm = mnnstNm;
	}
	
}
