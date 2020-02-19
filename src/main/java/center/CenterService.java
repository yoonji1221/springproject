package center;

import java.util.List;

import manage.ManageVO;
import preference.PagingVO;
import vinfo.VinfoVO;

public interface CenterService {

   //센터 로그인
   public List<CenterVO> centerlogin(CenterVO vo);
   
   public List<CenterVO> centerDetail(int cid);
   // 다연이
   // 센터에서 올린 봉사 달력보여주기
   public List<VinfoVO> getMyCenterCal(int cid);
   // 센터마이페이지 수정 form
   public List<CenterVO> getCenterMypage(int cid);
   // 센터마이페이지 수정 update
   public int updateCenterMypage(CenterVO vo);
   // 봉사자들 시간 입력해주는 form
   public List<VinfoVO> getRealtimeList(int cid);
   // 봉사자들 시간 입력 0-> update
   public int insertRealtime(VinfoVO vo2);

}