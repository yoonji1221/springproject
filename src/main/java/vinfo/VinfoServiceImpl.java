package vinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VinfoServiceImpl implements VinfoService {
	@Autowired
	VinfoDAO dao;

	@Override
	public List<VinfoVO> vinfolist() {
		return dao.vinfolist();
	}
	
}
