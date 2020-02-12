package vinfo;

import java.util.HashMap;
import java.util.List;

import preference.PagingVO;
import preference.PreferenceVO;

public interface VinfoService {

	// ���� �о� ��ȸ
	public List<String> getAllField();// large

	public List<VinfoVO> getMediumField(String large);// medium

	public List<VinfoVO> getM();// medium

	// ���Ϳ��� ���� ���� �Է�
	public int insertVinfo(VinfoVO vo);

	// ��� ���� ��ȸ
	public List<VinfoVO> vinfolist();

	// �Խù� �� ����
	public int getpaging();

	// ����¡ ó�� �Խù� ��ȸ
	public List<VinfoVO> vinfolistPaging(PagingVO vo);

	// ��,�� ����Ʈ
	public List<VinfoVO> silist();

	// ��,�� ����Ʈ������ ����Ʈ ���
	public List<VinfoVO> detailaddress(String selected_address);

	// ����о� �˻��� large �̱�
	public List<PreferenceVO> largelist();

	// ����о� �˻� medium �̱�
	public List<PreferenceVO> getmlist(String selected_large);

	// �������� �˻� �̱�
	public List<VinfoVO> searchadres(String address);

	// ���� �о� �˻� �̱�
	public List<VinfoVO> searchprefer(String detailprefer);

	// ���� �˻� ���
	public List<VinfoVO> searchresult(ParameterVO vo);

	// ��� ���� �˻� ���
	public List<VinfoVO> allsearchresult(ParameterVO vo);

	// ��ȣ���� �˻� ���
	public List<VinfoVO> prefersearch(ParameterVO vo);

	// ������ �˻� ���
	public List<VinfoVO> addresssearch(ParameterVO vo);

	public List<VinfoVO> fronttworesult(ParameterVO vo);

	public List<VinfoVO> bigprefer(ParameterVO vo);
	
	//����detail
	public List<VinfoVO> vinfodetail(int progrmRegistNo);
}
