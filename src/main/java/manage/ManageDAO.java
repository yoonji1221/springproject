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
	
	//�����û
	public void insertManage(HashMap<String, Object> map) {
		session.insert("db.insertManage",map);
	}
	
	//�����û�� ��û�ο� + 1
	public void updateApptotal(int progrmRegistNo) {
		session.update("db.updateApptotal", progrmRegistNo);
	}
}
