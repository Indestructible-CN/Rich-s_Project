package cn.com.rich.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.rich.dao.Et_Store_InfoMapper;
import cn.com.rich.entity.Et_Store_InfoWithBLOBs;
import cn.com.rich.service.EtStoreInfoService;


public class EtStoreInfoServiceImpl implements EtStoreInfoService {
	@Autowired
	private Et_Store_InfoMapper esim;
	
	//�̼���Ϣ����
	@Override
	public int insertEtStoreInfo(Et_Store_InfoWithBLOBs esiw) {
		return esim.insert(esiw);
	}
	/**
	 * @return ���ֵID
	 *
	 */
	@Override
	public int maxId() {
		return esim.maxId();
	}
	/**
	 * @param [Map]  
	 * record ��Ӧ  Et_Store_InfoWithBLOBs ����
	 * limit ��Ӧ ��ҳ ��ʼ �� ����
	 * @return ���󼯺�
	 */
	@Override
	public List<Et_Store_InfoWithBLOBs> selectByLmit(Map<String, Object> m) {
		return esim.selectByLmit(m);
	}
	@Override
	public int selectByLmitCount(Map<String, Object> m) {
		return esim.selectByLmitCount(m);
	}

}
