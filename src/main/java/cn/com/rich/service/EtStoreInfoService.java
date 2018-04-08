package cn.com.rich.service;

import java.util.List;
import java.util.Map;

import cn.com.rich.entity.Et_Store_InfoWithBLOBs;

public interface EtStoreInfoService {

	public int insertEtStoreInfo(Et_Store_InfoWithBLOBs esiw);
	
	public int maxId();
	
	public List<Et_Store_InfoWithBLOBs> selectByLmit(Map<String, Object> m);
	
	public int selectByLmitCount(Map<String, Object> m);
	
	public int updateByPrimaryKeySelective(Et_Store_InfoWithBLOBs record);
	
	public Et_Store_InfoWithBLOBs selectByPrimaryKey(String id);

	public List<Et_Store_InfoWithBLOBs> selectByKey(Map<String, Object> m);
	
	
}
