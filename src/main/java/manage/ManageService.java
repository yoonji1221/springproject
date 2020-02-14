package manage;

import java.util.HashMap;

import vinfo.VinfoVO;

public interface ManageService {
	
	//봉사신청
	public void insertManage(HashMap<String, Object> map);
	
	//봉사신청시 신청인원 + 1
	public void updateApptotal(int progrmRegistNo);

}
