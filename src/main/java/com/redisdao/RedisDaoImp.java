package com.redisdao;

import java.util.concurrent.TimeUnit;

import javax.annotation.Resource;

import org.apache.ibatis.ognl.ParseException;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class RedisDaoImp implements RedisDao {
	// 存数据
	@Resource(name = "redisTemplate")
	private RedisTemplate<String, Object> redisTemplate;

	public RedisTemplate<String, Object> getRedisTemplate() {
		return redisTemplate;
	}

	public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}

	@Override
	public boolean setData(String key, String value) {
		
		try {
//			redisTemplate.execute(new RedisCallback() {
//				@Override
//				public Long doInRedis(RedisConnection connection)
//						throws DataAccessException {
//					connection.setEx(key.getBytes(), 100, value.getBytes());
//					return 1L;
//				}
//			});
			this.redisTemplate.opsForValue().set(key, value, 100, TimeUnit.SECONDS);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	@Override
	public String getData(String key){
		
		System.out.println(key+"===================");
		String str=(String) this.redisTemplate.opsForValue().get(key);
		
		System.out.println(str+"===================");
		return str;
	}

}
