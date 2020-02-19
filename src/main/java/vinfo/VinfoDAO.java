package vinfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import center.CenterVO;
import preference.PagingVO;
import preference.PreferenceVO;

@Component
public class VinfoDAO {

	@Autowired
	SqlSession session;
	
	//홈화면 - 전체 봉사 조회
/*	public List<VinfoVO> vinfolist(){
		return session.selectList("db.allvolunteer");
	}
	*/
	//봉사 분야 조회
	public List<String> getAllField(){
		return session.selectList("db.allfield");
	}
	
	public List<VinfoVO> getMediumField(String large) {
		return session.selectList("db.mediumfield", large);
	}
	
	
	public List<VinfoVO> getM() {
		return session.selectList("db.m");
	}
	
	//센터에서 봉사 정보 입력
	public int insertVinfo(VinfoVO vo) {
		return session.insert("db.insertvinfo", vo);
		
	}
	public  List<CenterVO> getCenterName(int cid){
		return session.selectList("db.centername", cid);
	}
	
//////////////////////////////////////
	// 홈화면 - 전체 봉사 조회 - 쓰지않음
	public List<VinfoVO> vinfolist() {
		return session.selectList("db.vinfolist");
	}

	// 전체 게시물 개수
	public int getpaging() {
		return session.selectOne("db.getpaging");
	}

	// 페이징 처리 게시물 조회
	public List<VinfoVO> vinfolist(PagingVO vo) {
		return session.selectList("db.vinfolistPaging", vo);
	}

	// 도,시 리스트
	public List<VinfoVO> silist() {
		return session.selectList("db.silist");
	}

	// 도,시 리스트선택후 나머지 주소
	public List<VinfoVO> detailaddress(String selected_address) {
		return session.selectList("db.detailaddress", selected_address);
	}

	// 봉사 분야 검색 large 리스트
	public List<PreferenceVO> largelist() {
		return session.selectList("db.preferlist");
	}

	// 봉사 분야 검색 medium 리스트
	public List<PreferenceVO> getmlist(String selected_large) {
		return session.selectList("db.mediumlist", selected_large);
	}

	// 봉사지역 분류 검색
	public List<VinfoVO> searchadres(String address) {
		return session.selectList("db.searchadres", address);
	}

	// 봉사분야 분류 검색
	public List<VinfoVO> searchprefer(String detailprefer) {
		return session.selectList("db.searchprefer", detailprefer);
	}

	// 조건 검색 결과
	public List<VinfoVO> searchresult(ParameterVO vo) {
		return session.selectList("db.searchresult", vo);
	}

	// 전체 조건 검색 결과
	public List<VinfoVO> allsearchresult(ParameterVO vo) {
		return session.selectList("db.allsearchresult", vo);
	}

	// prefer 조건 검색 결과
	public List<VinfoVO> prefersearch(ParameterVO vo) {
		return session.selectList("db.prefersearch", vo);
	}

	// address 조건 검색 결과
	public List<VinfoVO> addresssearch(ParameterVO vo) {
		return session.selectList("db.addresssearch", vo);
	}

	// address 조건 검색 결과
	public List<VinfoVO> fronttworesult(ParameterVO vo) {
		return session.selectList("db.fronttworesult", vo);
	}
	// address 조건 검색 결과
	public List<VinfoVO> bigprefer(ParameterVO vo) {
		return session.selectList("db.bigprefers", vo);
	}
	
	//봉사 디테일
	public List<VinfoVO> vinfodetail(int progrmRegistNo){
		return session.selectList("db.vinfodetail",progrmRegistNo);
	}
	
	//효진
		//센터정보(전체) 지도에 표시하기 
		public List<CenterVO> getTotalCenter(){
			return session.selectList("db.centerTotal");
		}
		
		//센터가 가진 전체 봉사 정보
		public List<VinfoVO> centerVinfo(int cid){
			return session.selectList("db.centervinfo", cid);
		}
		
		//cid로 기관 이름 조회
			public String centerName(int cid) {
				return session.selectOne("db.centerName", cid);
			}
		
		//지도에서 주소 검색
		public List<CenterVO> searchAdd(String address){
			return session.selectList("db.searchAdd", address);
		}
}
