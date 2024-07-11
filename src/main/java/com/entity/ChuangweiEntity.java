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
 * 床位
 *
 * @author 
 * @email
 */
@TableName("chuangwei")
public class ChuangweiEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public ChuangweiEntity() {

	}

	public ChuangweiEntity(T t) {
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
     * 楼栋
     */
    @TableField(value = "building")

    private String building;


    /**
     * 单元
     */
    @TableField(value = "unit")

    private String unit;


    /**
     * 房间号
     */
    @TableField(value = "room")

    private String room;


    /**
     * 是否入住
     */
    @TableField(value = "chuangwei_yesno_types")

    private Integer chuangweiYesnoTypes;


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
	 * 设置：楼栋
	 */
    public String getBuilding() {
        return building;
    }


    /**
	 * 获取：楼栋
	 */

    public void setBuilding(String building) {
        this.building = building;
    }
    /**
	 * 设置：单元
	 */
    public String getUnit() {
        return unit;
    }


    /**
	 * 获取：单元
	 */

    public void setUnit(String unit) {
        this.unit = unit;
    }
    /**
	 * 设置：房间号
	 */
    public String getRoom() {
        return room;
    }


    /**
	 * 获取：房间号
	 */

    public void setRoom(String room) {
        this.room = room;
    }
    /**
	 * 设置：是否入住
	 */
    public Integer getChuangweiYesnoTypes() {
        return chuangweiYesnoTypes;
    }


    /**
	 * 获取：是否入住
	 */

    public void setChuangweiYesnoTypes(Integer chuangweiYesnoTypes) {
        this.chuangweiYesnoTypes = chuangweiYesnoTypes;
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
        return "Chuangwei{" +
            "id=" + id +
            ", building=" + building +
            ", unit=" + unit +
            ", room=" + room +
            ", chuangweiYesnoTypes=" + chuangweiYesnoTypes +
            ", createTime=" + createTime +
        "}";
    }
}
