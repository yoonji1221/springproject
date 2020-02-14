package test2;

import java.util.HashMap;
import java.util.List;

import vinfo.VinfoVO;

public interface TestService {
	
	public int check(HashMap<String, String> map);
	
	public void insertVinfo(VinfoVO vo);
	
	public void updateCid(HashMap<String, String> map);
	
}
