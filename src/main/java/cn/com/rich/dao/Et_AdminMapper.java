package cn.com.rich.dao;

import cn.com.rich.entity.Et_Admin;
import cn.com.rich.entity.Et_AdminExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface Et_AdminMapper {
    int countByExample(Et_AdminExample example);

    int deleteByExample(Et_AdminExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Et_Admin record);

    int insertSelective(Et_Admin record);

    List<Et_Admin> selectByExample(Et_AdminExample example);
    Et_Admin selectByPrimaryKey(Integer id);
    Et_Admin login(Et_Admin admin);

    int updateByExampleSelective(@Param("record") Et_Admin record, @Param("example") Et_AdminExample example);

    int updateByExample(@Param("record") Et_Admin record, @Param("example") Et_AdminExample example);

    int updateByPrimaryKeySelective(Et_Admin record);

    int updateByPrimaryKey(Et_Admin record);
}