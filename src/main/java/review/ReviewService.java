package review;

import java.util.List;

import manage.ManageVO;



public interface ReviewService {

	public List<ReviewVO> reviewlist();
	
	public List<ReviewVO> myreviewlist(int vid);

	public List<ReviewVO> getreviewdetail(int rid);
	
	//Ŭ���� ��ȸ�� 1����
	public void updateViewcount(int rid);
	
	//���� �ۼ��ϱ�
	   public int reviewWrite(ReviewVO vo);
	
	//���� ����
//	public List<ReviewVO> reviewSeclet(int mid);
	public void reviewUpdate(ReviewVO vo);
	
	//���� ����
	public void reviewDelete(int mid);
	
//	public List<ReviewVO> updateReview(ReviewVO vo);
	
	//���� ���丷��
	public int reviewDupCheck(ManageVO vo);
	
}
