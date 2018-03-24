package cn.com.rich.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.rich.dao.Rt_Store_TypeMapper;
import cn.com.rich.entity.Rt_Store_Type;
import cn.com.rich.service.RtStoreTypeService;

public class RtStoreTypeServiceImpl implements RtStoreTypeService {
	@Autowired
	private Rt_Store_TypeMapper rstm;

	@Override
	public List<Rt_Store_Type> selectByExample() {
		return rstm.selectByExample(null);
	}

}
