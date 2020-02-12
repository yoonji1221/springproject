package review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewDAO dao;

	@Override
	public List<ReviewVO> reviewlist() {
		return dao.reviewlist();
	}

	@Override
	public List<ReviewVO> myreviewlist(int vid) {
		return dao.myreviewlist(vid);
	}
	
	@Override
	public List<ReviewVO> getreviewdetail(int rid) {
		return dao.reviewdetail(rid);
	}

	@Override
	public void updateViewcount() {
		dao.updateViewcount();	
	}

	@Override
	public void reviewWrite(ReviewVO vo) {
		dao.reviewWrite(vo);
		
	}

	@Override
	public void reviewUpdate(ReviewVO vo) {
		dao.reviewUpdate(vo);
		
	}
	
	public void reviewDelete(int mid) {
		dao.reviewDelete(mid);
	}




	/*
	 * @Override public List<ReviewVO> reviewSeclet(int mid) { return
	 * dao.reviewSelect(mid); }
	 */
	
	


	
	
}
