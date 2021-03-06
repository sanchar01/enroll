package com.enroll.modules.mapper;

import com.enroll.modules.pojo.SysRoleMenuEntity;

import java.util.List;

/**
 * 角色与菜单对应关系
 *
 * @author hsc
 *
 * Jul 20, 2017
 */
public interface SysRoleMenuDao extends BaseDao<SysRoleMenuEntity> {
	
	/**
	 * 根据角色ID，获取菜单ID列表
	 */
	List<Long> queryMenuIdList(Long roleId);
}
