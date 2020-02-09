package vinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import preference.PagingVO;

@Service
public class VinfoServiceImpl implements VinfoService {
	@Autowired
	VinfoDAO dao;

	@Override
	public List<VinfoVO> vinfolist() {
		return dao.vinfolist();
	}

	@Override
	public int getpaging() {
		return dao.getpaging();
	}

	@Override
	public List<VinfoVO> vinfolistPaging(PagingVO vo) {
		return dao.vinfolist(vo);
	}

}
