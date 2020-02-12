package center;

import java.util.List;

import preference.PagingVO;
import vinfo.VinfoVO;

public interface CenterService {

	//센터 로그인
	public int centerlogin(CenterVO vo);
	
	
	//다연이

	public List<VinfoVO> getMyCenterCal(int cid);

	public List<CenterVO> getCenterMypage(int cid);

	public int updateCenterMypage(CenterVO vo);

	public String getManageList(int cid);

}
