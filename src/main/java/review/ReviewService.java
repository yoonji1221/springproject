package review;

import java.util.List;



public interface ReviewService {

	public List<ReviewVO> reviewlist();
	
	public List<ReviewVO> myreviewlist(int vid);

	public List<ReviewVO> getreviewdetail(int rid);
	
	//Ŭ���� ��ȸ�� 1����
	public void updateViewcount();
	
	//���� �ۼ��ϱ�
	public void reviewWrite(ReviewVO vo);
	
	//���� ����
//	public List<ReviewVO> reviewSeclet(int mid);
	public void reviewUpdate(ReviewVO vo);
	
	//���� ����
	public void reviewDelete(int mid);
	
//	public List<ReviewVO> updateReview(ReviewVO vo);
	
}
