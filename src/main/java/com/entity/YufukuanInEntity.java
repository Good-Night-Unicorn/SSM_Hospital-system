package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;

/**
 * 预付款缴费
 *
 * @author 
 * @email
 */
@TableName("yufukuan_in")
public class YufukuanInEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public YufukuanInEntity() {

	}

	public YufukuanInEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @TableField(value = "id")

    private Integer id;


    /**
     * 预付款账户
     */
    @TableField(value = "yufukuan_id")

    private Integer yufukuanId;


    /**
     * 缴费金额
     */
    @TableField(value = "yufukuan_in_money")

    private Double yufukuanInMoney;


    /**
     * 缴费时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @TableField(value = "create_time",fill = FieldFill.INSERT)

    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：预付款账户
	 */
    public Integer getYufukuanId() {
        return yufukuanId;
    }


    /**
	 * 获取：预付款账户
	 */

    public void setYufukuanId(Integer yufukuanId) {
        this.yufukuanId = yufukuanId;
    }
    /**
	 * 设置：缴费金额
	 */
    public Double getYufukuanInMoney() {
        return yufukuanInMoney;
    }


    /**
	 * 获取：缴费金额
	 */

    public void setYufukuanInMoney(Double yufukuanInMoney) {
        this.yufukuanInMoney = yufukuanInMoney;
    }
    /**
	 * 设置：缴费时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：缴费时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "YufukuanIn{" +
            "id=" + id +
            ", yufukuanId=" + yufukuanId +
            ", yufukuanInMoney=" + yufukuanInMoney +
            ", insertTime=" + insertTime +
            ", createTime=" + createTime +
        "}";
    }
}
