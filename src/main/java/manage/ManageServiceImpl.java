package manage;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vinfo.VinfoVO;

@Service
public class ManageServiceImpl implements ManageService {
	@Autowired
	ManageDAO dao;

	//�����û
	@Override
	public void insertManage(HashMap<String, Object> map) {
		dao.insertManage(map);	
	}

	@Override
	public int checkApplication(ManageVO vo) {
		return dao.checkApplication(vo);
	}

	//�����û�� ��û�ο� + 1
	@Override
	public void updateApptotal(int progrmRegistNo) {
		dao.updateApptotal(progrmRegistNo);		
	}
	
	
	
	
}
