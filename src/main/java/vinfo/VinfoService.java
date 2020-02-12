package vinfo;

import java.util.HashMap;
import java.util.List;

import preference.PagingVO;
import preference.PreferenceVO;

public interface VinfoService {

	// 봉사 분야 조회
	public List<String> getAllField();// large

	public List<VinfoVO> getMediumField(String large);// medium

	public List<VinfoVO> getM();// medium

	// 센터에서 봉사 정보 입력
	public int insertVinfo(VinfoVO vo);

	// 모든 봉사 조회
	public List<VinfoVO> vinfolist();

	// 게시물 총 개수
	public int getpaging();

	// 페이징 처리 게시물 조회
	public List<VinfoVO> vinfolistPaging(PagingVO vo);

	// 도,시 리스트
	public List<VinfoVO> silist();

	// 도,시 리스트선택후 리스트 출력
	public List<VinfoVO> detailaddress(String selected_address);

	// 봉사분야 검색시 large 뽑기
	public List<PreferenceVO> largelist();

	// 봉사분야 검색 medium 뽑기
	public List<PreferenceVO> getmlist(String selected_large);

	// 봉사지역 검색 뽑기
	public List<VinfoVO> searchadres(String address);

	// 봉사 분야 검색 뽑기
	public List<VinfoVO> searchprefer(String detailprefer);

	// 조건 검색 결과
	public List<VinfoVO> searchresult(ParameterVO vo);

	// 모든 조건 검색 결과
	public List<VinfoVO> allsearchresult(ParameterVO vo);

	// 선호도만 검색 결과
	public List<VinfoVO> prefersearch(ParameterVO vo);

	// 지역만 검색 결과
	public List<VinfoVO> addresssearch(ParameterVO vo);

	public List<VinfoVO> fronttworesult(ParameterVO vo);

	public List<VinfoVO> bigprefer(ParameterVO vo);
	
	//봉사detail
	public List<VinfoVO> vinfodetail(int progrmRegistNo);
}
