package volunteer;

import java.util.List;

import manage.ManageVO;
import preference.PreferenceVO;
import vinfo.ParameterVO;
import vinfo.VinfoVO;

public interface VolunteerService {

	// 선호도 기반 추천 봉사
	public List<VolunteerVO> recomanprefer(int vid);

	public List<VinfoVO> realrecoman(VolunteerVO vo);

	// 아이디 중복체크
	public int idcheck(String id);

	// 봉사자 로그인
	public int volunlogin(VolunteerVO vo);

	public int volunlogin2(VolunteerVO vo);

	// 봉사자 회원가입
	public int join(VolunteerVO vo);

	/* =======효진========= */
	// 회원정보 수정 전 일부 정보 출력
	public List<VolunteerVO> getVolunteer(int vid);

	// 마이페이지 수정 : 선호도 뽑기
	public List<PreferenceVO> getPreList();

	// 마이페이지 수정 : 선호도 뽑기
	public List<PreferenceVO> getMediumList(String large);

	// 마이페이지 수정하기
	public void updateVolunteer(VolunteerVO vo);

	// 한 회원이 활동한 봉사정보를 달력에 출력
	public List<VinfoVO> getVolunInfo(int vid);

	// 활동완료한 봉사정보 확인하기 - 전체정보
	public List<VinfoVO> getVolunDetail(int progrmRegistNo);

	// 활동완료한 봉사정보 확인하기 - 센터이름
	public String getCenterName(int progrmRegistNo);

	// 봉사 취소하기
	public void deleteManage(ManageVO vo);

	// 봉사 취소하면 신청인원 - 1
	public void deleteApptotal(int progrmRegistNo);

	// 봉사자 - 봉사 시간 확인하기//0217효진
	public List<ParameterVO> checkTime(int vid);

	public int sumTime(int vid);
}
