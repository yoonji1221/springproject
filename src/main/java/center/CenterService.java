package center;

import java.util.List;

import manage.ManageVO;
import preference.PagingVO;
import vinfo.VinfoVO;

public interface CenterService {

   //���� �α���
   public List<CenterVO> centerlogin(CenterVO vo);
   
   public List<CenterVO> centerDetail(int cid);
   // �ٿ���
   // ���Ϳ��� �ø� ���� �޷º����ֱ�
   public List<VinfoVO> getMyCenterCal(int cid);
   // ���͸��������� ���� form
   public List<CenterVO> getCenterMypage(int cid);
   // ���͸��������� ���� update
   public int updateCenterMypage(CenterVO vo);
   // �����ڵ� �ð� �Է����ִ� form
   public List<VinfoVO> getRealtimeList(int cid);
   // �����ڵ� �ð� �Է� 0-> update
   public int insertRealtime(VinfoVO vo2);

}