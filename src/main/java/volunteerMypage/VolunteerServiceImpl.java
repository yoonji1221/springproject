package volunteerMypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import manage.ManageVO;
import preference.PreferenceDAO;
import preference.PreferenceVO;
import vinfo.VinfoVO;

@Service
public class VolunteerServiceImpl implements VolunteerService {

	@Autowired
	VolunteerDAO dao;

	// ȸ������ ���� �� �Ϻ� ���� ���
	@Override
	public List<VolunteerVO> getVolunteer(int vid) {
		return dao.getVolunteer(vid);
	}

	@Override
	public List<PreferenceVO> getPreList() {
		return dao.getPreList();
	}

	@Override
	public List<PreferenceVO> getMediumList(String large) {
		return dao.getMediumList(large);
	}
	
	// ȸ������ �����ϱ�
	@Override
	public void updateVolunteer(VolunteerVO vo) {
		dao.updateVolunteer(vo);
	}

	// �� ȸ���� Ȱ���� ���������� �޷¿� ���
	@Override
	public List<VinfoVO> getVolunInfo(int vid) {
		return dao.getVolunInfo(vid);
	}

	// Ȱ���Ϸ��� �������� Ȯ���ϱ� - ��ü����
	@Override
	public List<VinfoVO> getVolunDetail(int progrmRegistNo) {
		return dao.getVolunDetail(progrmRegistNo);
	}

	// Ȱ���Ϸ��� �������� Ȯ���ϱ� - �����̸�
	@Override
	public String getCenterName(int progrmRegistNo) {
		return dao.getCenterName(progrmRegistNo);
	}

	//���� ����ϱ�
	@Override
	public void deleteManage(ManageVO vo) {
		dao.deleteManage(vo);
	}
	
	

}
