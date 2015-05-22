package com.company.gap.grow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.gap.base.dao.IBaseDao;
import com.company.gap.base.service.impl.BaseServiceImpl;
import com.company.gap.grow.dao.IGrowPesticideDao;
import com.company.gap.grow.model.Pesticide;
import com.company.gap.grow.service.IGrowPesticideService;

@Service
public class GrowPesticideServiceImpl extends BaseServiceImpl<Pesticide> implements IGrowPesticideService {

	@Autowired
	private IGrowPesticideDao dao;
	
	@Override
	protected IBaseDao<Pesticide> get() {
		return this.dao;
	}
	
	@Override
	public List<Pesticide> findByRegisterId(Integer registerId) {
		Pesticide t = new Pesticide();
		t.setRegisterId(registerId);
		return this.findList(t);
	}
}
