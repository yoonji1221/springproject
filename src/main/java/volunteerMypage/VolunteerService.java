package volunteerMypage;

import java.util.List;

import manage.ManageVO;
import preference.PreferenceVO;
import vinfo.VinfoVO;

public interface VolunteerService {
	
	//ȸ������ ���� �� �Ϻ� ���� ���
	public List<VolunteerVO> getVolunteer(int vid);
	
	//���������� ���� : ��ȣ�� �̱�
	public List<PreferenceVO> getPreList();
	      
	//���������� ���� : ��ȣ�� �̱�
    public List<PreferenceVO> getMediumList(String large);
    
    //���������� �����ϱ�
    public void updateVolunteer(VolunteerVO vo); 
	
	// �� ȸ���� Ȱ���� ���������� �޷¿� ���
	public List<VinfoVO> getVolunInfo(int vid);
	
	//Ȱ���Ϸ��� �������� Ȯ���ϱ� - ��ü����
	public List<VinfoVO> getVolunDetail(int progrmRegistNo);
	
	//Ȱ���Ϸ��� �������� Ȯ���ϱ� - �����̸�
	public String getCenterName(int progrmRegistNo);
	
	//���� ����ϱ�
	public void deleteManage(ManageVO vo);
	

}
