package center;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import manage.ManageVO;
import vinfo.VinfoVO;

@Component
public class CenterDAO {
   
   @Autowired
   SqlSession sqlsession;
   
   //센터 로그인
   public List<CenterVO> centerlogin(CenterVO vo) {
      return sqlsession.selectList("db.centerlogin", vo);
   }
   //신지
   public List<CenterVO> centerDetail(int cid){
		return sqlsession.selectList("db.centerdetail", cid);
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

      public List<VinfoVO> getRealtimeList(int cid) {
         // TODO Auto-generated method stub
         return sqlsession.selectList("db.timelist",cid);
      }

      public int insertRealtime(VinfoVO vo) {
         // TODO Auto-generated method stub
         return sqlsession.update("db.inserttime",vo);
      }
      
}