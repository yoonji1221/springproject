package review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import manage.ManageVO;

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
	
	public void updateViewcount(int rid) {
		session.update("db.updateviewcount", rid);
	}
	
	  public int reviewWrite(ReviewVO vo) {
	      return session.insert("db.reviewwrite", vo);
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
	
	
	//////////dÀ±Áö///////////¸®ºä ¶Ç¾²±â ¸·±â
	public int reviewDupCheck(ManageVO vo) {
		return session.selectOne("db.reviewDupCheck", vo);
	}
}
