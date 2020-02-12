package center;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vinfo.VinfoVO;

@Service
public class CenterServiceImpl implements CenterService {
	@Autowired
	CenterDAO dao;

	@Override
	public int centerlogin(CenterVO vo) {
		return dao.centerlogin(vo);
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
	public String getManageList(int cid) {
		return dao.getManageList(cid);
	}


}
