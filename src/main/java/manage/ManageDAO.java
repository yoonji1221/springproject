package manage;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vinfo.VinfoVO;

@Component
public class ManageDAO {
	
	@Autowired
	SqlSession session;
	//봉사신청전에 봉사 신청중복 체크
	public int checkApplication(ManageVO vo) {
		return session.selectOne("db.checkApplication", vo);
	}
	//봉사신청
	public void insertManage(HashMap<String, Object> map) {
		session.insert("db.insertManage",map);
	}
	
	//봉사신청시 신청인원 + 1
	public void updateApptotal(int progrmRegistNo) {
		session.update("db.updateApptotal", progrmRegistNo);
	}
}
