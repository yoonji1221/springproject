package preference;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vinfo.VinfoVO;

@Component
public class PreferenceDAO {

	@Autowired
	SqlSession session;

	// 회원가입에서 필요한선호도 리스트 뽑기
	public List<PreferenceVO> getPreList() {
		return session.selectList("db.preferlist");
	}
	
	// 회원가입에서 필요한 medium선호도 리스트 뽑기
		public List<PreferenceVO> getMediumList(String large) {
			return session.selectList("db.mediumlist", large);
		}

}
