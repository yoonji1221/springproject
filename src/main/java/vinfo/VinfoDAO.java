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
	
	//Ȩȭ�� - ��ü ���� ��ȸ
	public List<VinfoVO> vinfolist(){
		return session.selectList("db.vinfolist");
	}
	
	//��ü �Խù� ����
	public int getpaging(){
		return session.selectOne("db.getpaging");
}
	
	//����¡ ó�� �Խù� ��ȸ
	public List<VinfoVO> vinfolist(PagingVO vo){
		return session.selectList("db.vinfolistPaging", vo);
	}
}
