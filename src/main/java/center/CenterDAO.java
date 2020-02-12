package center;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vinfo.VinfoVO;

@Component
public class CenterDAO {
	
	@Autowired
	SqlSession sqlsession;
	
	//센터 로그인
	public int centerlogin(CenterVO vo) {
		return sqlsession.selectOne("db.centerlogin", vo);
	}
	
	//다연이
	//홈화면 - 전체 봉사 조회
		public List<VinfoVO> getMyCenterCal(int cid){
			return sqlsession.selectList("db.mycentercallist",cid);
		}

		public List<CenterVO> getCenterMypage(int cid) {
			// TODO Auto-generated method stub
			return sqlsession.selectList("db.centermypagelist",cid);
		}

		public int updateCenterMypage(CenterVO vo) {
			// TODO Auto-generated method stub
			return sqlsession.update("db.centermypageupdate",vo);
		}

		public String getManageList(int cid) {
			int result1=sqlsession.selectOne("db.managelist1",cid);
			System.out.println(result1+"Aaaaa");
			String result2 =null;
			if( result1!=0) {
				return result2 = sqlsession.selectOne("db.managelist2",result1);
			}
			return result2;
		}
		
}
