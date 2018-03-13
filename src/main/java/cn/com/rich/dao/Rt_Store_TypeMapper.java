package cn.com.rich.dao;

import cn.com.rich.entity.Rt_Store_Type;
import cn.com.rich.entity.Rt_Store_TypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface Rt_Store_TypeMapper {
    int countByExample(Rt_Store_TypeExample example);

    int deleteByExample(Rt_Store_TypeExample example);

    int deleteByPrimaryKey(String id);

    int insert(Rt_Store_Type record);

    int insertSelective(Rt_Store_Type record);

    List<Rt_Store_Type> selectByExample(Rt_Store_TypeExample example);

    Rt_Store_Type selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Rt_Store_Type record, @Param("example") Rt_Store_TypeExample example);

    int updateByExample(@Param("record") Rt_Store_Type record, @Param("example") Rt_Store_TypeExample example);

    int updateByPrimaryKeySelective(Rt_Store_Type record);

    int updateByPrimaryKey(Rt_Store_Type record);
}