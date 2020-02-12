package vinfo;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import preference.PagingVO;
import preference.PreferenceVO;

@Service
public class VinfoServiceImpl implements VinfoService {
	@Autowired
	VinfoDAO dao;
	@Override
	public List<String> getAllField() {
		return dao.getAllField();
	}
	
	@Override
	public List<VinfoVO> getMediumField(String large) {
		return dao.getMediumField(large);
	}
	
	@Override
	public List<VinfoVO> getM() {
		return dao.getM();
	}

	@Override
	public int insertVinfo(VinfoVO vo) {
		return dao.insertVinfo(vo);
	}

	////////
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

	@Override
	public List<VinfoVO> silist() {
		return dao.silist();
	}

	@Override
	public List<VinfoVO> detailaddress(String selected_address) {
		return dao.detailaddress(selected_address);
	}

	@Override
	public List<PreferenceVO> largelist() {
		return dao.largelist();
	}

	@Override
	public List<PreferenceVO> getmlist(String selected_large) {
		return dao.getmlist(selected_large);
	}

	@Override
	public List<VinfoVO> searchadres(String address) {
		return dao.searchadres(address);
	}

	@Override
	public List<VinfoVO> searchprefer(String detailprefer) {
		return dao.searchprefer(detailprefer);
	}

	@Override
	public List<VinfoVO> searchresult(ParameterVO vo) {
		return dao.searchresult(vo);
	}

	@Override
	public List<VinfoVO> allsearchresult(ParameterVO vo) {
		return dao.allsearchresult(vo);
	}

	@Override
	public List<VinfoVO> prefersearch(ParameterVO vo) {
		return dao.prefersearch(vo);
	}

	@Override
	public List<VinfoVO> addresssearch(ParameterVO vo) {
		return dao.addresssearch(vo);
	}

	@Override
	public List<VinfoVO> fronttworesult(ParameterVO vo) {
		return dao.fronttworesult(vo);
	}

	@Override
	public List<VinfoVO> bigprefer(ParameterVO vo) {
		return dao.bigprefer(vo);
	}

	@Override
	public List<VinfoVO> vinfodetail(int progrmRegistNo) {
		return dao.vinfodetail(progrmRegistNo);
	}
	
	
	
	
}
