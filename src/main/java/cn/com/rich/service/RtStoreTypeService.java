package cn.com.rich.service;

import java.util.List;

import cn.com.rich.entity.Et_Store_Info;
import cn.com.rich.entity.Rt_Store_Type;

public interface RtStoreTypeService {

	public List<Rt_Store_Type> selectByExample();
	
	public int insertSelectiveSub(Rt_Store_Type record);
	
	public int updateByPrimaryKeySelective(Rt_Store_Type record);
	
}
