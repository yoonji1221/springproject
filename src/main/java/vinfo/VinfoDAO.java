package vinfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import preference.PagingVO;

@Component
public class VinfoDAO {
	
	@Autowired
	SqlSession session;
	
	//홈화면 - 전체 봉사 조회
	public List<VinfoVO> vinfolist(){
		return session.selectList("db.vinfolist");
	}
	
	//전체 게시물 개수
	public int getpaging(){
		return session.selectOne("db.getpaging");
}
	
	//페이징 처리 게시물 조회
	public List<VinfoVO> vinfolist(PagingVO vo){
		return session.selectList("db.vinfolistPaging", vo);
	}
}
