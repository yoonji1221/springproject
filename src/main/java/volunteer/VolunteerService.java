package volunteer;

import java.util.List;

import manage.ManageVO;
import preference.PreferenceVO;
import vinfo.ParameterVO;
import vinfo.VinfoVO;

public interface VolunteerService {

	// ��ȣ�� ��� ��õ ����
	public List<VolunteerVO> recomanprefer(int vid);

	public List<VinfoVO> realrecoman(VolunteerVO vo);

	// ���̵� �ߺ�üũ
	public int idcheck(String id);

	// ������ �α���
	public int volunlogin(VolunteerVO vo);

	public int volunlogin2(VolunteerVO vo);

	// ������ ȸ������
	public int join(VolunteerVO vo);

	/* =======ȿ��========= */
	// ȸ������ ���� �� �Ϻ� ���� ���
	public List<VolunteerVO> getVolunteer(int vid);

	// ���������� ���� : ��ȣ�� �̱�
	public List<PreferenceVO> getPreList();

	// ���������� ���� : ��ȣ�� �̱�
	public List<PreferenceVO> getMediumList(String large);

	// ���������� �����ϱ�
	public void updateVolunteer(VolunteerVO vo);

	// �� ȸ���� Ȱ���� ���������� �޷¿� ���
	public List<VinfoVO> getVolunInfo(int vid);

	// Ȱ���Ϸ��� �������� Ȯ���ϱ� - ��ü����
	public List<VinfoVO> getVolunDetail(int progrmRegistNo);

	// Ȱ���Ϸ��� �������� Ȯ���ϱ� - �����̸�
	public String getCenterName(int progrmRegistNo);

	// ���� ����ϱ�
	public void deleteManage(ManageVO vo);

	// ���� ����ϸ� ��û�ο� - 1
	public void deleteApptotal(int progrmRegistNo);

	// ������ - ���� �ð� Ȯ���ϱ�//0217ȿ��
	public List<ParameterVO> checkTime(int vid);

	public int sumTime(int vid);
}
