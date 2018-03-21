package cn.com.rich.service.impl;

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

}
