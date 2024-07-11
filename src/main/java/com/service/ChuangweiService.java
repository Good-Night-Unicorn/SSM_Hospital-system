package com.service;

import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ChuangweiEntity;
import java.util.Map;

/**
 * 床位 服务类
 */
public interface ChuangweiService extends IService<ChuangweiEntity> {

    /**
    * @param params 查询参数
    * @return 带分页的查询出来的数据
    */
     PageUtils queryPage(Map<String, Object> params);
}