package volunteerMypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import manage.ManageVO;
import preference.PreferenceVO;
import vinfo.VinfoVO;

@Component
public class VolunteerDAO {

	@Autowired
	SqlSession session;

	//회원정보 수정 전 일부 정보 출력
	public List<VolunteerVO> getVolunteer(int vid) {
		List<VolunteerVO> list = session.selectList("db.getVolunteer", vid);
		return list;
	}

	// 회원가입에서 필요한선호도 리스트 뽑기
	public List<PreferenceVO> getPreList() {
		return session.selectList("db.preferlist");
	}

	// 회원가입에서 필요한 medium선호도 리스트 뽑기
	public List<PreferenceVO> getMediumList(String large) {
		return session.selectList("db.mediumlist", large);
	}
	
	//마이페이지 수정하기
	public void updateVolunteer(VolunteerVO vo) {
		session.update("db.updateVolunteer", vo);
	}

	// 한 회원이 활동한 봉사정보를 달력에 출력
	public List<VinfoVO> getVolunInfo(int vid) {
		List<VinfoVO> list = session.selectList("db.progrmInfo", vid);
		return list;
	}

	// 활동완료한 봉사정보 확인하기 - 전체정보
	public List<VinfoVO> getVolunDetail(int progrmRegistNo) {
		List<VinfoVO> list = session.selectList("db.volunDetail1", progrmRegistNo);
		return list;
	}

	// 활동완료한 봉사정보 확인하기 - 센터이름
	public String getCenterName(int progrmRegistNo) {
		return session.selectOne("db.volunDetail2", progrmRegistNo);
	}
	
	//봉사취소하기
	public void deleteManage(ManageVO vo) {
		session.delete("db.deleteManage", vo);
	}

}
