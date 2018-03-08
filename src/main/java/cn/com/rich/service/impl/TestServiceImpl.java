package cn.com.rich.service.impl;
  
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.rich.dao.TestMapper;
import cn.com.rich.entity.Test;
import cn.com.rich.service.TestService;

public class TestServiceImpl implements TestService {
	@Autowired
	private TestMapper testMapper;
	
	public Test selectByPrimaryKey(Integer id) {
		return testMapper.selectByPrimaryKey(id);
	}
	
	

}
