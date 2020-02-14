package review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReviewDAO {
	@Autowired
	SqlSession session;
	
	public List<ReviewVO> reviewlist(){
		return session.selectList("db.reviewlist");
	}
	
	public List<ReviewVO> myreviewlist(int vid){
		return session.selectList("db.myreviewlist", vid);
	}
	
	public List<ReviewVO> reviewdetail(int rid){
		List<ReviewVO> list2= session.selectList("db.reviewdetail", rid);
		return list2;
	}
	
	public void updateViewcount() {
		session.update("db.updateviewcount");
	}
	
	public void reviewWrite(ReviewVO vo) {
		session.insert("db.reviewwrite", vo);
	}
	
	public void reviewUpdate(ReviewVO vo) {
		session.update("db.reviewupdate", vo);
	}

	/*
	 * public List<ReviewVO> reviewSelect(int mid){ return
	 * session.selectList("db.reviewselect", mid); }
	 */

	
	public void reviewDelete(int mid) {
		session.delete("db.reviewdelete", mid);
	}
}
