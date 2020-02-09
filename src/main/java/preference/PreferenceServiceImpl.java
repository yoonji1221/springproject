package preference;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PreferenceServiceImpl implements PreferenceService {
	@Autowired
	PreferenceDAO dao;

	@Override
	public List<PreferenceVO> getPreList() {
		return dao.getPreList();
	}

	@Override
	public List<PreferenceVO> getMediumList(String large) {
		return dao.getMediumList(large);
	}
	
		
}
