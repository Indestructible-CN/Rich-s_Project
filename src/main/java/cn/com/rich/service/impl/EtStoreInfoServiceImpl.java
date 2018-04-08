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
	 * @return ����ɹ�����
	 *
	 */
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

	/**
	 * @param [Map]
	 *            ��Ӧ Et_Store_InfoWithBLOBs ������ limit ��Ӧ ��ҳ ��ʼ �� ����
	 * @return ���������Ķ��󼯺�
	 */
	@Override
	public List<Et_Store_InfoWithBLOBs> selectByLmit(Map<String, Object> m) {
		return esim.selectByLmit(m);
	}

	/**
	 * @param [Map]
	 *            ��Ӧ Et_Store_InfoWithBLOBs ������ limit ��Ӧ ��ҳ ��ʼ �� ����
	 * @return ��������������
	 *
	 */
	@Override
	public int selectByLmitCount(Map<String, Object> m) {
		return esim.selectByLmitCount(m);
	}

	/**
	 * @param [Et_Store_InfoWithBLOBs]
	 *            ��Ӧ Et_Store_InfoWithBLOBs
	 * @return ��������
	 *
	 */
	@Override
	public int updateByPrimaryKeySelective(Et_Store_InfoWithBLOBs record) {
		return esim.updateByPrimaryKeySelective(record);
	}

	/**
	 * @param [String id]
	 *            ��Ӧ ����ID
	 * @return ��ѯ���� Et_Store_InfoWithBLOBs
	 *
	 */
	@Override
	public Et_Store_InfoWithBLOBs selectByPrimaryKey(String id) {
		return esim.selectByPrimaryKey(id);
	}

	/**
	 * ���̲�ѯsql
	 *
	 * @param [Map]
	 *            ��Ӧ Et_Store_InfoWithBLOBs ������ limit ��Ӧ ��ҳ ��ʼ �� ����
	 * @return ���������Ķ��󼯺�
	 */
	@Override
	public List<Et_Store_InfoWithBLOBs> selectByKey(Map<String, Object> m) {
		return esim.selectByKey(m);
	}

}
