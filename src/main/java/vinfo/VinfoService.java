package vinfo;

import java.util.List;

import preference.PagingVO;

public interface VinfoService {

	//��� ���� ��ȸ
	public List<VinfoVO> vinfolist();
		
	//�Խù� �� ����
	public int getpaging();
	
	//����¡ ó�� �Խù� ��ȸ
	public List<VinfoVO> vinfolistPaging(PagingVO vo);
	
	
}
