package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bean.Declareform;
import com.bean.Joinzbfile;
import com.bean.Joinzbxx;
import com.dao.JoinzbfileMapper;
import com.dao.JoinzbxxMapper;

@Service("toubiaoFrontServiceImp")
public class ToubiaoFrontServiceImp implements ToubiaoFrontService {
	@Resource(name = "joinzbxxMapper")
	JoinzbxxMapper joinzbxxMapper;
	@Resource(name = "joinzbfileMapper")
	JoinzbfileMapper joinzbfileMapper;

	public JoinzbfileMapper getJoinzbfileMapper() {
		return joinzbfileMapper;
	}

	public void setJoinzbfileMapper(JoinzbfileMapper joinzbfileMapper) {
		this.joinzbfileMapper = joinzbfileMapper;
	}

	public JoinzbxxMapper getJoinzbxxMapper() {
		return joinzbxxMapper;
	}

	public void setJoinzbxxMapper(JoinzbxxMapper joinzbxxMapper) {
		this.joinzbxxMapper = joinzbxxMapper;
	}

	@Override
	public int insToubiao(Joinzbxx joinzbxx) {

		int num = this.joinzbxxMapper.insertReturnKey(joinzbxx);
		System.out.println(joinzbxx.getId() + "idssssssssssss");
		List<Joinzbfile> lisjoinzbf = joinzbxx.getLisjoinzbfile();
		for (Joinzbfile joinzbfile : lisjoinzbf) {
			joinzbfile.setZbxxid(joinzbxx.getId());
			num = this.joinzbfileMapper.insertSelective(joinzbfile);
		}
		return num;
	}

	@Override
	public List<Joinzbxx> selBidsByStart(Integer id, Integer start) {
		List<Joinzbxx> liszbxx = this.joinzbxxMapper.selBidsByidandStart(id,
				start);
		return liszbxx;
	}

	@Override
	public int upJoinZbxx(Integer start, Integer id) {
		Joinzbxx zbxx = this.joinzbxxMapper.selectByPrimaryKey(id);
		zbxx.setStart(start);
		int num = this.joinzbxxMapper.updateByPrimaryKeySelective(zbxx);
		return num;
	}

	@Override
	public List<Joinzbxx> selBidsByStartHistory(Integer supplierid,
			Integer start) {
		List<Joinzbxx> LIS = this.joinzbxxMapper
				.selBidsByStartHistory(supplierid);
		return LIS;
	}

	@Override
	public Integer delJoinzbxx(Integer id) {
		int num = this.joinzbfileMapper.delByJoinjoinzbxxid(id);
		num += this.joinzbxxMapper.deleteByPrimaryKey(id);
		return num;
	}

	@Override
	public Joinzbxx selBidsById(Integer id) {
		Joinzbxx zbxx=this.joinzbxxMapper.selBidsByid(id);
		return zbxx;
	}

	@Override
	public Joinzbfile selJoinzbfileByid(Integer id) {
		return this.joinzbfileMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer delJoinzbfileByid(Integer id) {
		return this.joinzbfileMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Integer upToubiao(Joinzbxx joinzbxx) {
		this.joinzbfileMapper.delByJoinjoinzbxxid(joinzbxx.getId());
		List<Joinzbfile> lisjoinzbf = joinzbxx.getLisjoinzbfile();
		for (Joinzbfile joinzbfile : lisjoinzbf) {
			joinzbfile.setZbxxid(joinzbxx.getId());
			this.joinzbfileMapper.insertSelective(joinzbfile);
		}
		int num=this.joinzbxxMapper.updateByPrimaryKeySelective(joinzbxx);
		return num;
	}

	@Override
	public Joinzbxx selBidsSupidAndDecid(Integer supplierid, Integer id) {
		
		return this.joinzbxxMapper.selBidsSupidAndDecid(supplierid,id);
	}
}
