package center;

import java.util.List;

import preference.PagingVO;
import vinfo.VinfoVO;

public interface CenterService {

	//���� �α���
	public int centerlogin(CenterVO vo);
	
	
	//�ٿ���

	public List<VinfoVO> getMyCenterCal(int cid);

	public List<CenterVO> getCenterMypage(int cid);

	public int updateCenterMypage(CenterVO vo);

	public String getManageList(int cid);

}
