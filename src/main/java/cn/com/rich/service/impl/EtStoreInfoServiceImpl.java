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
	
	//商家信息插入
	@Override
	public int insertEtStoreInfo(Et_Store_InfoWithBLOBs esiw) {
		return esim.insert(esiw);
	}
	/**
	 * @return 最大值ID
	 *
	 */
	@Override
	public int maxId() {
		return esim.maxId();
	}
	/**
	 * @param [Map]  
	 * record 对应  Et_Store_InfoWithBLOBs 对象
	 * limit 对应 分页 开始 和 结束
	 * @return 对象集合
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
