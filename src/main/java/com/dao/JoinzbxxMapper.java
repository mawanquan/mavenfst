package com.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Joinzbxx;
@Repository("joinzbxxMapper")
public interface JoinzbxxMapper extends Mapper<Joinzbxx> {

	Integer insertReturnKey(Joinzbxx joinzbxx);

	List<Joinzbxx> selBidsByidandStart(Integer id, int i);

	List<Joinzbxx> selBidsByStartHistory(Integer supplierid);

	Joinzbxx selBidsByid(Integer id);

	Joinzbxx selBidsSupidAndDecid(Integer supplierid,Integer decid);

 
}