package cn.com.rich.service;

import cn.com.rich.entity.Et_Store_InfoWithBLOBs;

public interface EtStoreInfoService {

	public int insertEtStoreInfo(Et_Store_InfoWithBLOBs esiw);
	
	public int maxId();
	
}
