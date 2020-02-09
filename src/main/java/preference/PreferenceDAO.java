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

	// ȸ�����Կ��� �ʿ��Ѽ�ȣ�� ����Ʈ �̱�
	public List<PreferenceVO> getPreList() {
		return session.selectList("db.preferlist");
	}
	
	// ȸ�����Կ��� �ʿ��� medium��ȣ�� ����Ʈ �̱�
		public List<PreferenceVO> getMediumList(String large) {
			return session.selectList("db.mediumlist", large);
		}

}
