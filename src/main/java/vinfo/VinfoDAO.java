package vinfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import center.CenterVO;
import preference.PagingVO;
import preference.PreferenceVO;

@Component
public class VinfoDAO {

	@Autowired
	SqlSession session;
	
	//Ȩȭ�� - ��ü ���� ��ȸ
/*	public List<VinfoVO> vinfolist(){
		return session.selectList("db.allvolunteer");
	}
	*/
	//���� �о� ��ȸ
	public List<String> getAllField(){
		return session.selectList("db.allfield");
	}
	
	public List<VinfoVO> getMediumField(String large) {
		return session.selectList("db.mediumfield", large);
	}
	
	
	public List<VinfoVO> getM() {
		return session.selectList("db.m");
	}
	
	//���Ϳ��� ���� ���� �Է�
	public int insertVinfo(VinfoVO vo) {
		return session.insert("db.insertvinfo", vo);
		
	}
	public  List<CenterVO> getCenterName(int cid){
		return session.selectList("db.centername", cid);
	}
	
//////////////////////////////////////
	// Ȩȭ�� - ��ü ���� ��ȸ - ��������
	public List<VinfoVO> vinfolist() {
		return session.selectList("db.vinfolist");
	}

	// ��ü �Խù� ����
	public int getpaging() {
		return session.selectOne("db.getpaging");
	}

	// ����¡ ó�� �Խù� ��ȸ
	public List<VinfoVO> vinfolist(PagingVO vo) {
		return session.selectList("db.vinfolistPaging", vo);
	}

	// ��,�� ����Ʈ
	public List<VinfoVO> silist() {
		return session.selectList("db.silist");
	}

	// ��,�� ����Ʈ������ ������ �ּ�
	public List<VinfoVO> detailaddress(String selected_address) {
		return session.selectList("db.detailaddress", selected_address);
	}

	// ���� �о� �˻� large ����Ʈ
	public List<PreferenceVO> largelist() {
		return session.selectList("db.preferlist");
	}

	// ���� �о� �˻� medium ����Ʈ
	public List<PreferenceVO> getmlist(String selected_large) {
		return session.selectList("db.mediumlist", selected_large);
	}

	// �������� �з� �˻�
	public List<VinfoVO> searchadres(String address) {
		return session.selectList("db.searchadres", address);
	}

	// ����о� �з� �˻�
	public List<VinfoVO> searchprefer(String detailprefer) {
		return session.selectList("db.searchprefer", detailprefer);
	}

	// ���� �˻� ���
	public List<VinfoVO> searchresult(ParameterVO vo) {
		return session.selectList("db.searchresult", vo);
	}

	// ��ü ���� �˻� ���
	public List<VinfoVO> allsearchresult(ParameterVO vo) {
		return session.selectList("db.allsearchresult", vo);
	}

	// prefer ���� �˻� ���
	public List<VinfoVO> prefersearch(ParameterVO vo) {
		return session.selectList("db.prefersearch", vo);
	}

	// address ���� �˻� ���
	public List<VinfoVO> addresssearch(ParameterVO vo) {
		return session.selectList("db.addresssearch", vo);
	}

	// address ���� �˻� ���
	public List<VinfoVO> fronttworesult(ParameterVO vo) {
		return session.selectList("db.fronttworesult", vo);
	}
	// address ���� �˻� ���
	public List<VinfoVO> bigprefer(ParameterVO vo) {
		return session.selectList("db.bigprefers", vo);
	}
	
	//���� ������
	public List<VinfoVO> vinfodetail(int progrmRegistNo){
		return session.selectList("db.vinfodetail",progrmRegistNo);
	}
	
	//ȿ��
		//��������(��ü) ������ ǥ���ϱ� 
		public List<CenterVO> getTotalCenter(){
			return session.selectList("db.centerTotal");
		}
		
		//���Ͱ� ���� ��ü ���� ����
		public List<VinfoVO> centerVinfo(int cid){
			return session.selectList("db.centervinfo", cid);
		}
		
		//cid�� ��� �̸� ��ȸ
			public String centerName(int cid) {
				return session.selectOne("db.centerName", cid);
			}
		
		//�������� �ּ� �˻�
		public List<CenterVO> searchAdd(String address){
			return session.selectList("db.searchAdd", address);
		}
}
