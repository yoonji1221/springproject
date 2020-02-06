package volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VolunteerServiceImpl implements VolunteerService {
	@Autowired
	VolunteerDAO dao;

	@Override
	public List<VolunteerVO> volunteerlist() {
		return dao.volunteerlist();
	}
	
}
