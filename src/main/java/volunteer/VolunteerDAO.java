package volunteer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vinfo.VinfoVO;

@Component
public class VolunteerDAO {
	
	@Autowired
	SqlSession session;
	
	//���̵��ߺ�üũ
		public int idcheck(String id){
			return session.selectOne("db.idcheck", id);
		}
	
}
