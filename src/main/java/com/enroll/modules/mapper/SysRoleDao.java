package com.enroll.modules.mapper;

import com.enroll.modules.pojo.SysRoleEntity;

import java.util.List;


/**
 * 角色管理
 *
 * @author hsc
 *
 * Jul 20, 2017
 */
public interface SysRoleDao extends BaseDao<SysRoleEntity> {
	
	/**
	 * 查询用户创建的角色ID列表
	 */
	List<Long> queryRoleIdList(Long createUserId);
	
	int deleteRoleMenuBatch(Object[] id);
	
	int deleteuserRoleBatch(Object[] id);
}
