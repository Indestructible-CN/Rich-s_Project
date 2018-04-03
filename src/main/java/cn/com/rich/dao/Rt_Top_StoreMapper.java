package cn.com.rich.dao;

import cn.com.rich.entity.Rt_Top_Store;
import cn.com.rich.entity.Rt_Top_StoreExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface Rt_Top_StoreMapper {
    int countByExample(Rt_Top_StoreExample example);

    int deleteByExample(Rt_Top_StoreExample example);

    int deleteByPrimaryKey(String id);

    int insert(Rt_Top_Store record);

    int insertSelective(Rt_Top_Store record);

    List<Rt_Top_Store> selectByExample(Rt_Top_StoreExample example);

    Rt_Top_Store selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Rt_Top_Store record, @Param("example") Rt_Top_StoreExample example);

    int updateByExample(@Param("record") Rt_Top_Store record, @Param("example") Rt_Top_StoreExample example);

    int updateByPrimaryKeySelective(Rt_Top_Store record);

    int updateByPrimaryKey(Rt_Top_Store record);
    
    int insertSelectiveSub(Rt_Top_Store record);
}