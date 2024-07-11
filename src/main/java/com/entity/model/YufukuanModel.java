package com.entity.model;

import com.entity.YufukuanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 预付款账户
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class YufukuanModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 患者
     */
    private Integer bingliId;


    /**
     * 预付款账户
     */
    private String yufukuanDanhaoNumber;


    /**
     * 预付款金额
     */
    private Double yufukuanMoney;


    /**
     * 添加时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 设置：主键
	 */
    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：患者
	 */
    public Integer getBingliId() {
        return bingliId;
    }


    /**
	 * 设置：患者
	 */
    public void setBingliId(Integer bingliId) {
        this.bingliId = bingliId;
    }
    /**
	 * 获取：预付款账户
	 */
    public String getYufukuanDanhaoNumber() {
        return yufukuanDanhaoNumber;
    }


    /**
	 * 设置：预付款账户
	 */
    public void setYufukuanDanhaoNumber(String yufukuanDanhaoNumber) {
        this.yufukuanDanhaoNumber = yufukuanDanhaoNumber;
    }
    /**
	 * 获取：预付款金额
	 */
    public Double getYufukuanMoney() {
        return yufukuanMoney;
    }


    /**
	 * 设置：预付款金额
	 */
    public void setYufukuanMoney(Double yufukuanMoney) {
        this.yufukuanMoney = yufukuanMoney;
    }
    /**
	 * 获取：添加时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：添加时间
	 */
    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
