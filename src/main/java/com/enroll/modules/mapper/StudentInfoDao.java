package com.enroll.modules.mapper;

import com.enroll.modules.pojo.AreaEntity;
import com.enroll.modules.pojo.Nation;
import com.enroll.modules.pojo.StuInfoEntity;

import java.util.List;

/**
 * @author hsc
 *
 * Sep 13, 2017
 */
public interface StudentInfoDao  extends BaseDao<StuInfoEntity> {

	List<AreaEntity> queryAreaList();
	
	List<Nation> queryNationList();
}
