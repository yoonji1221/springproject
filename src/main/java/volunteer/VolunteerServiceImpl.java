package volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.ManageVO;
import preference.PreferenceVO;
import vinfo.ParameterVO;
import vinfo.VinfoVO;

@Service
public class VolunteerServiceImpl implements VolunteerService {
	@Autowired
	VolunteerDAO dao;

	@Override
	public List<VolunteerVO> recomanprefer(int vid) {
		return dao.recomanprefer(vid);
	}

	@Override
	public List<VinfoVO> realrecoman(VolunteerVO vo) {
		return dao.realrecoman(vo);
	}

	@Override
	public int idcheck(String id) {
		return dao.idcheck(id);
	}

	@Override
	public int volunlogin(VolunteerVO vo) {
		return dao.volunlogin(vo);
	}

	@Override
	public int join(VolunteerVO vo) {
		return dao.join(vo);
	}

	/* =======효진========= */
	// 회원정보 수정 전 일부 정보 출력
	@Override
	public List<VolunteerVO> getVolunteer(int vid) {
		return dao.getVolunteer(vid);
	}

	@Override
	public List<PreferenceVO> getPreList() {
		return dao.getPreList();
	}

	@Override
	public List<PreferenceVO> getMediumList(String large) {
		return dao.getMediumList(large);
	}

	// 회원정보 수정하기
	@Override
	public void updateVolunteer(VolunteerVO vo) {
		dao.updateVolunteer(vo);
	}

	// 한 회원이 활동한 봉사정보를 달력에 출력
	@Override
	public List<VinfoVO> getVolunInfo(int vid) {
		return dao.getVolunInfo(vid);
	}

	// 활동완료한 봉사정보 확인하기 - 전체정보
	@Override
	public List<VinfoVO> getVolunDetail(int progrmRegistNo) {
		return dao.getVolunDetail(progrmRegistNo);
	}

	// 활동완료한 봉사정보 확인하기 - 센터이름
	@Override
	public String getCenterName(int progrmRegistNo) {
		return dao.getCenterName(progrmRegistNo);
	}

	// 봉사 취소하기
	@Override
	public void deleteManage(ManageVO vo) {
		dao.deleteManage(vo);
	}

	@Override
	public int volunlogin2(VolunteerVO vo) {
		return dao.volunlogin2(vo);
	}

	// 봉사 취소하면 신청인원 - 1
	@Override
	public void deleteApptotal(int progrmRegistNo) {
		dao.deleteApptotal(progrmRegistNo);
	}

	// 봉사자 - 봉사 시간 확인하기//0217효진
	public List<ParameterVO> checkTime(int vid) {
		return dao.checkTime(vid);
	}

	@Override
	public int sumTime(int vid) {
		return dao.sumTime(vid);
	}

}
