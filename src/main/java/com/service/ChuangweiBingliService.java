package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ChuangweiBingliEntity;
import java.util.Map;

/**
 * 患者住院房屋 服务类
 */
public interface ChuangweiBingliService extends IService<ChuangweiBingliEntity> {

    /**
    * @param params 查询参数
    * @return 带分页的查询出来的数据
    */
     PageUtils queryPage(Map<String, Object> params);
}