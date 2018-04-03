package cn.com.rich.service;

import java.util.List;

import cn.com.rich.entity.Rt_Top_Store;
import cn.com.rich.entity.Rt_Top_StoreExample;

public interface RtTopStoreService {

	public int insertSelectiveSub(Rt_Top_Store record);
	
	public List<Rt_Top_Store> selectByExample(Rt_Top_StoreExample example);
	
	public int updateByPrimaryKeySelective(Rt_Top_Store record);
}
