package com.redisdao;

import java.util.concurrent.TimeUnit;

import org.apache.ibatis.ognl.ParseException;

import com.bean.Suppliers;

public interface RedisDao {
	// 增加
	public boolean setData(String key, String value);

	// 取数据
	public String getData(String key);


}
