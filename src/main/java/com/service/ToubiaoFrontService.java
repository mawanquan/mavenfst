package com.service;

import java.util.List;

import com.bean.Declareform;
import com.bean.Joinzbfile;
import com.bean.Joinzbxx;

public interface ToubiaoFrontService {

	int insToubiao(Joinzbxx joinzbxx);

	List<Joinzbxx> selBidsByStart(Integer integer, Integer start);

	int upJoinZbxx(Integer start, Integer id);

	List<Joinzbxx> selBidsByStartHistory(Integer supplierid, Integer start);

	Integer delJoinzbxx(Integer id);

	Joinzbxx selBidsById(Integer id);

	Joinzbfile selJoinzbfileByid(Integer id);

	Integer delJoinzbfileByid(Integer id);

	Integer upToubiao(Joinzbxx joinzbxx);

	Joinzbxx selBidsSupidAndDecid(Integer supplierid, Integer id);

	List<Joinzbxx> selBidsStartAndDecid(Integer start, Integer decid);

	// 联表查询招标商信息
	List<Joinzbxx> selBidsxxAllByDecidandStart(Integer decid, Integer start);

}
