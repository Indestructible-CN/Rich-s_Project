package cn.com.rich.entity;

import java.util.Date;

public class Rt_Top_Store {
    private String id;

    private String storeId;

    private String topTag;

    private Integer topWeight;

    private String isDelete;

    private Date gmtModify;

    private Date gmtCreate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getStoreId() {
        return storeId;
    }

    public void setStoreId(String storeId) {
        this.storeId = storeId == null ? null : storeId.trim();
    }

    public String getTopTag() {
        return topTag;
    }

    public void setTopTag(String topTag) {
        this.topTag = topTag == null ? null : topTag.trim();
    }

    public Integer getTopWeight() {
        return topWeight;
    }

    public void setTopWeight(Integer topWeight) {
        this.topWeight = topWeight;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete == null ? null : isDelete.trim();
    }

    public Date getGmtModify() {
        return gmtModify;
    }

    public void setGmtModify(Date gmtModify) {
        this.gmtModify = gmtModify;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }
}