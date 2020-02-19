package center;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.ManageDAO;
import manage.ManageVO;
import vinfo.VinfoVO;

@Service
public class CenterServiceImpl implements CenterService {
   @Autowired
   CenterDAO dao;

   @Override
   public List<CenterVO> centerlogin(CenterVO vo) {
      return dao.centerlogin(vo);
   }
	@Override
	public List<CenterVO> centerDetail(int cid) {
		return dao.centerDetail(cid);
	}
   //´Ù¿¬ÀÌ
   @Override
   public List<VinfoVO> getMyCenterCal(int cid) {
      // TODO Auto-generated method stub
      return dao.getMyCenterCal(cid);
   }

   @Override
   public List<CenterVO> getCenterMypage(int cid) {
      // TODO Auto-generated method stub
      return dao.getCenterMypage(cid);
   }

   @Override
   public int updateCenterMypage(CenterVO vo) {
      int result = dao.updateCenterMypage(vo);
      return result;
   }

   @Override
   public List<VinfoVO> getRealtimeList(int cid) {
      return dao.getRealtimeList(cid);
   }

   @Override
   public int insertRealtime(VinfoVO vo) {
      int result = dao.insertRealtime(vo);
      return result;
   }




}