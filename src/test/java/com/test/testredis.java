package com.test;

import javax.annotation.Resource;

import org.junit.internal.runners.JUnit4ClassRunner;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;
public class testredis {
	/*
	@Resource(name="redisTemplate")
	RedisTemplate<String, Object> redistemplate;
	
	public RedisTemplate<String, Object> getRedistemplate() {
		return redistemplate;
	}

	public void setRedistemplate(RedisTemplate<String, Object> redistemplate) {
		this.redistemplate = redistemplate;
	}*/

	public static void main(String[] args) {
		ApplicationContext acx=new ClassPathXmlApplicationContext("applicationContext.xml");
		RedisTemplate a=(RedisTemplate)acx.getBean("redisTemplate");
		a.opsForValue().set("test1", "1");
	}
}
