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

	/**
	 * @return 插入成功条数
	 *
	 */
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
	 *            对应 Et_Store_InfoWithBLOBs 及对象 limit 对应 分页 开始 和 结束
	 * @return 符合条件的对象集合
	 */
	@Override
	public List<Et_Store_InfoWithBLOBs> selectByLmit(Map<String, Object> m) {
		return esim.selectByLmit(m);
	}

	/**
	 * @param [Map]
	 *            对应 Et_Store_InfoWithBLOBs 及对象 limit 对应 分页 开始 和 结束
	 * @return 符合条件的条数
	 *
	 */
	@Override
	public int selectByLmitCount(Map<String, Object> m) {
		return esim.selectByLmitCount(m);
	}

	/**
	 * @param [Et_Store_InfoWithBLOBs]
	 *            对应 Et_Store_InfoWithBLOBs
	 * @return 更新条数
	 *
	 */
	@Override
	public int updateByPrimaryKeySelective(Et_Store_InfoWithBLOBs record) {
		return esim.updateByPrimaryKeySelective(record);
	}

	/**
	 * @param [String id]
	 *            对应 主键ID
	 * @return 查询对象 Et_Store_InfoWithBLOBs
	 *
	 */
	@Override
	public Et_Store_InfoWithBLOBs selectByPrimaryKey(String id) {
		return esim.selectByPrimaryKey(id);
	}

	/**
	 * 商铺查询sql
	 *
	 * @param [Map]
	 *            对应 Et_Store_InfoWithBLOBs 及对象 limit 对应 分页 开始 和 结束
	 * @return 符合条件的对象集合
	 */
	@Override
	public List<Et_Store_InfoWithBLOBs> selectByKey(Map<String, Object> m) {
		return esim.selectByKey(m);
	}

}
