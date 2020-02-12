package review;

import java.util.List;



public interface ReviewService {

	public List<ReviewVO> reviewlist();
	
	public List<ReviewVO> myreviewlist(int vid);

	public List<ReviewVO> getreviewdetail(int rid);
	
	//클릭시 조회수 1증가
	public void updateViewcount();
	
	//리뷰 작성하기
	public void reviewWrite(ReviewVO vo);
	
	//리뷰 수정
//	public List<ReviewVO> reviewSeclet(int mid);
	public void reviewUpdate(ReviewVO vo);
	
	//리뷰 삭제
	public void reviewDelete(int mid);
	
//	public List<ReviewVO> updateReview(ReviewVO vo);
	
}
