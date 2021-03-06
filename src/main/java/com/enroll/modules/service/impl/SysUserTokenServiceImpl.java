package com.enroll.modules.service.impl;

import com.enroll.common.utils.R;
import com.enroll.modules.mapper.SysUserTokenDao;
import com.enroll.modules.oauth2.TokenGenerator;
import com.enroll.modules.pojo.SysUserTokenEntity;
import com.enroll.modules.service.SysUserTokenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author hsc
 *
 * Jul 19, 2017
 */
@Service
public class SysUserTokenServiceImpl implements SysUserTokenService{

	@Autowired
	private SysUserTokenDao sysUserTokenDao;
	//12小时后过期
	private final static int EXPIRE = 3600 * 12;
	
	@Override
	public SysUserTokenEntity queryByUserId(Long userId) {
		return sysUserTokenDao.queryByUserId(userId);
	}

	@Override
	public SysUserTokenEntity queryByToken(String token) {
		return sysUserTokenDao.queryByToken(token);
	}

	@Override
	public void save(SysUserTokenEntity token){
		sysUserTokenDao.save(token);
	}
	
	@Override
	public int update(SysUserTokenEntity token){
		return sysUserTokenDao.update(token);
	}
	
	@Override
	public R createToken(long userId) {
		//生成一个token
		String token = TokenGenerator.generateValue();
		//当前时间
		Date now = new Date();
		//过期时间
		Date expireTime = new Date(now.getTime() + EXPIRE * 1000);

		//判断是否生成过token
		SysUserTokenEntity tokenEntity = queryByUserId(userId);
		if(tokenEntity == null){
			tokenEntity = new SysUserTokenEntity();
			tokenEntity.setUserId(userId);
			tokenEntity.setToken(token);
			tokenEntity.setUpdateTime(now);
			tokenEntity.setExpireTime(expireTime);
			//保存token
			save(tokenEntity);
		}else{
			tokenEntity.setToken(token);
			tokenEntity.setUpdateTime(now);
			tokenEntity.setExpireTime(expireTime);

			//更新token
			update(tokenEntity);
		}

		R r = R.ok().put("token", token).put("expire", EXPIRE);

		return r;
	}
}
