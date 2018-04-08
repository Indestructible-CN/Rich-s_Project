package cn.com.rich.dao;

import cn.com.rich.entity.Et_Store_Info;
import cn.com.rich.entity.Et_Store_InfoExample;
import cn.com.rich.entity.Et_Store_InfoWithBLOBs;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface Et_Store_InfoMapper {
    int countByExample(Et_Store_InfoExample example);

    int deleteByExample(Et_Store_InfoExample example);

    int deleteByPrimaryKey(String id);

    int insert(Et_Store_InfoWithBLOBs record);

    int insertSelective(Et_Store_InfoWithBLOBs record);

    List<Et_Store_InfoWithBLOBs> selectByExampleWithBLOBs(Et_Store_InfoExample example);

    List<Et_Store_Info> selectByExample(Et_Store_InfoExample example);

    Et_Store_InfoWithBLOBs selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Et_Store_InfoWithBLOBs record, @Param("example") Et_Store_InfoExample example);

    int updateByExampleWithBLOBs(@Param("record") Et_Store_InfoWithBLOBs record, @Param("example") Et_Store_InfoExample example);

    int updateByExample(@Param("record") Et_Store_Info record, @Param("example") Et_Store_InfoExample example);

    int updateByPrimaryKeySelective(Et_Store_InfoWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(Et_Store_InfoWithBLOBs record);

    int updateByPrimaryKey(Et_Store_Info record);
    
    int maxId();
    
    List<Et_Store_InfoWithBLOBs> selectByLmit(Map<String, Object> m);
    
    int selectByLmitCount(Map<String, Object> m);

    List<Et_Store_InfoWithBLOBs> selectByKey(Map<String, Object> m);
}