package preference;

import java.util.List;


public interface PreferenceService {

	//ȸ�����Կ� ��ȣ�� �̱�
	public List<PreferenceVO> getPreList();
		
	//ȸ�����Կ��� �̵� ��ȣ�� �̱�
	public List<PreferenceVO> getMediumList(String large);
}
