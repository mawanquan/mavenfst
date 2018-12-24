package com.service;

import java.util.List;

import javax.annotation.Resource;
import javax.jms.JMSException;

import org.springframework.stereotype.Service;

import com.bean.Declareform;
import com.bean.EmailMessage;
import com.bean.Joinzbfile;
import com.bean.Joinzbxx;
import com.bean.Suppliers;
import com.dao.JoinzbfileMapper;
import com.dao.JoinzbxxMapper;
import com.dao.SuppliersMapper;
import com.untils.TextSends;

@Service("toubiaoFrontServiceImp")
public class ToubiaoFrontServiceImp implements ToubiaoFrontService {
	@Resource(name = "joinzbxxMapper")
	JoinzbxxMapper joinzbxxMapper;
	@Resource(name = "joinzbfileMapper")
	JoinzbfileMapper joinzbfileMapper;
	@Resource(name = "suppliersMapper")
	SuppliersMapper suppliersMapper;
	

	public SuppliersMapper getSuppliersMapper() {
		return suppliersMapper;
	}

	public void setSuppliersMapper(SuppliersMapper suppliersMapper) {
		this.suppliersMapper = suppliersMapper;
	}

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

	@Override
	public List<Joinzbxx> selBidsStartAndDecid(Integer start, Integer decid) {
		return joinzbxxMapper.selBidsStartAndDecid(start, decid);
	}

	@Override
	public List<Joinzbxx> selBidsxxAllByDecidandStart(Integer decid,
			Integer start) {
		return joinzbxxMapper.selBidsxxAllByDecidandStart(decid, start);
	}

	@Override
	public Integer upToubiao2(Integer id,Integer sid,String title) throws JMSException {
		int num=0;
		List<Joinzbxx> list = joinzbxxMapper.selBidsxxAllByDecidandStart(id, 1);
		for (Joinzbxx joinzbxx : list) {
			if(joinzbxx.getSupplierid()==sid){
				//中标
				Suppliers supp=this.suppliersMapper.selectByPrimaryKey(joinzbxx.getSupplierid());
				EmailMessage emailMessage=new EmailMessage();
				emailMessage.setSubject(title+"招标结果");
				emailMessage.setText("亲爱的"+supp.getSuppliername()+"恭喜中标");
				emailMessage.setTouser(supp.getSuppliersemail());
				TextSends.sendTo(emailMessage);
				joinzbxx.setStart(3);
				num+=this.joinzbxxMapper.updateByPrimaryKeySelective(joinzbxx);
				
			}else{
				//落标
				Suppliers supp=this.suppliersMapper.selectByPrimaryKey(joinzbxx.getSupplierid());
				EmailMessage emailMessage=new EmailMessage();
				emailMessage.setSubject(title+"招标结果");
				emailMessage.setText("亲爱的"+supp.getSuppliername()+"非常抱歉您落标了");
				emailMessage.setTouser(supp.getSuppliersemail());
				TextSends.sendTo(emailMessage);
				joinzbxx.setStart(4);
				num+=this.joinzbxxMapper.updateByPrimaryKeySelective(joinzbxx);
			}
			
		}
		return num;
	}
}
