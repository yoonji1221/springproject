package volunteer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import manage.ManageVO;
import preference.PreferenceVO;
import vinfo.ParameterVO;
import vinfo.VinfoVO;

@Component
public class VolunteerDAO {

	@Autowired
	SqlSession session;
	// ��ȣ�� ��� ��õ ����

	public List<VolunteerVO> recomanprefer(int vid) {
		return session.selectList("db.recomanprefer", vid);
	}

	public List<VinfoVO> realrecoman(VolunteerVO vo) {
		return session.selectList("db.realrecoman", vo);
	}

	// ���̵��ߺ�üũ
	public int idcheck(String id) {
		return session.selectOne("db.idcheck", id);
	}

	// ������ �α���
	public int volunlogin(VolunteerVO vo) {
		return session.selectOne("db.volunlogin", vo);
	}

	public int volunlogin2(VolunteerVO vo) {
		return session.selectOne("db.volunlogin2", vo);
	}

	// ������ ȸ������
	public int join(VolunteerVO vo) {
		return session.insert("db.join", vo);
	}

	/* =======ȿ��========= */
	// ȸ������ ���� �� �Ϻ� ���� ���
	public List<VolunteerVO> getVolunteer(int vid) {
		List<VolunteerVO> list = session.selectList("db.getVolunteer", vid);
		return list;
	}

	// ȸ�����Կ��� �ʿ��Ѽ�ȣ�� ����Ʈ �̱�
	public List<PreferenceVO> getPreList() {
		return session.selectList("db.preferlist");
	}

	// ȸ�����Կ��� �ʿ��� medium��ȣ�� ����Ʈ �̱�
	public List<PreferenceVO> getMediumList(String large) {
		return session.selectList("db.mediumlist", large);
	}

	// ���������� �����ϱ�
	public void updateVolunteer(VolunteerVO vo) {
		session.update("db.updateVolunteer", vo);
	}

	// �� ȸ���� Ȱ���� ���������� �޷¿� ���
	public List<VinfoVO> getVolunInfo(int vid) {
		List<VinfoVO> list = session.selectList("db.progrmInfo", vid);
		return list;
	}

	// Ȱ���Ϸ��� �������� Ȯ���ϱ� - ��ü����
	public List<VinfoVO> getVolunDetail(int progrmRegistNo) {
		List<VinfoVO> list = session.selectList("db.volunDetail1", progrmRegistNo);
		return list;
	}

	// Ȱ���Ϸ��� �������� Ȯ���ϱ� - �����̸�
	public String getCenterName(int progrmRegistNo) {
		return session.selectOne("db.volunDetail2", progrmRegistNo);
	}

	// ��������ϱ�
	public void deleteManage(ManageVO vo) {
		session.delete("db.deleteManage", vo);
	}

	// ���� ����ϸ� ��û�ο� - 1
	public void deleteApptotal(int progrmRegistNo) {
		session.update("db.deleteApptotal", progrmRegistNo);
	}

	// ������ - ���� �ð� Ȯ���ϱ�//0217ȿ��
	public List<ParameterVO> checkTime(int vid) {
		List<ParameterVO> list = session.selectList("db.checkTime", vid);
		return list;
	}

	public int sumTime(int vid) {
		return session.selectOne("db.sumTime", vid);
	}
}
