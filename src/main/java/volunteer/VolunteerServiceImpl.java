package volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vinfo.VinfoVO;

@Service
public class VolunteerServiceImpl implements VolunteerService {
	@Autowired
	VolunteerDAO dao;

	@Override
	public int idcheck(String id) {
		return dao.idcheck(id);
	}

	
}
