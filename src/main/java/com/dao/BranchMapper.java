package com.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.bean.Branch;

public interface BranchMapper extends Mapper<Branch> {

	List<Branch> selByBranchid(Integer branchnameid);

	List<Branch> selByBranchidDetail(Integer id);

	List<Branch> selByBranchNot();

	int insAllBranch(List<Branch> allbranch);

}