package cn.com.rich.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.rich.dao.Rt_Top_StoreMapper;
import cn.com.rich.entity.Rt_Top_Store;
import cn.com.rich.entity.Rt_Top_StoreExample;
import cn.com.rich.service.RtTopStoreService;

public class RtTopStoreServiceImpl implements RtTopStoreService {
	@Autowired
	private Rt_Top_StoreMapper rtsm;
	
	@Override
	public int insertSelectiveSub(Rt_Top_Store record) {
		return rtsm.insertSelectiveSub(record);
	}

	@Override
	public List<Rt_Top_Store> selectByExample(Rt_Top_StoreExample example) {
		return rtsm.selectByExample(example);
	}

	@Override
	public int updateByPrimaryKeySelective(Rt_Top_Store record) {
		return rtsm.updateByPrimaryKeySelective(record);
	}

}
