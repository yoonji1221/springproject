package vinfo;

import java.util.List;

import preference.PagingVO;

public interface VinfoService {

	//모든 봉사 조회
	public List<VinfoVO> vinfolist();
		
	//게시물 총 개수
	public int getpaging();
	
	//페이징 처리 게시물 조회
	public List<VinfoVO> vinfolistPaging(PagingVO vo);
	
	
}
