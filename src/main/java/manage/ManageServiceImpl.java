package manage;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vinfo.VinfoVO;

@Service
public class ManageServiceImpl implements ManageService {
	@Autowired
	ManageDAO dao;

	//봉사신청
	@Override
	public void insertManage(HashMap<String, Object> map) {
		dao.insertManage(map);	
	}

	//봉사신청시 신청인원 + 1
	@Override
	public void updateApptotal(int progrmRegistNo) {
		dao.updateApptotal(progrmRegistNo);		
	}
	
	
	
	
}
