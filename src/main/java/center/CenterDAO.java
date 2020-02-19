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
   
   //���� �α���
   public List<CenterVO> centerlogin(CenterVO vo) {
      return sqlsession.selectList("db.centerlogin", vo);
   }
   //����
   public List<CenterVO> centerDetail(int cid){
		return sqlsession.selectList("db.centerdetail", cid);
	}
   
   //�ٿ���
   //Ȩȭ�� - ��ü ���� ��ȸ
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