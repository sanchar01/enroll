package com.enroll.modules.service.impl;

import com.enroll.modules.mapper.StudentInfoListDao;
import com.enroll.modules.pojo.StuInfoEntity;
import com.enroll.modules.service.StudentInfoListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author hsc
 *
 * Mar 20, 2018
 */
@Service
public class StudentInfoListServiceImpl implements StudentInfoListService {
	
	@Autowired
    private StudentInfoListDao studentInfoListDao;

	@Override
	public List<StuInfoEntity> queryList(Map<String, Object> map) {
		
		return studentInfoListDao.queryList(map);
	}

	@Override
	public int queryTotal(Map<String, Object> map) {
		
		return studentInfoListDao.queryTotal(map);
	}
}
