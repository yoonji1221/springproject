package manage;

import java.util.HashMap;

import vinfo.VinfoVO;

public interface ManageService {
	
	//�����û
	public void insertManage(HashMap<String, Object> map);
	
	//�����û�� ��û�ο� + 1
	public void updateApptotal(int progrmRegistNo);

}
