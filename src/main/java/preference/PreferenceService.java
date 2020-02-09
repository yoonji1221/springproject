package preference;

import java.util.List;


public interface PreferenceService {

	//회원가입엣 선호도 뽑기
	public List<PreferenceVO> getPreList();
		
	//회원가입에서 미듐 선호도 뽑기
	public List<PreferenceVO> getMediumList(String large);
}
