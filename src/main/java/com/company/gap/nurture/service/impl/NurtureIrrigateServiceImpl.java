package com.company.gap.nurture.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.gap.base.dao.IBaseDao;
import com.company.gap.base.service.impl.BaseServiceImpl;
import com.company.gap.nurture.dao.INurtureIrrigateDao;
import com.company.gap.nurture.model.Irrigate;
import com.company.gap.nurture.service.INurtureIrrigateService;

@Service
public class NurtureIrrigateServiceImpl extends BaseServiceImpl<Irrigate> implements INurtureIrrigateService {

	@Autowired
	private INurtureIrrigateDao dao;

	@Override
	protected IBaseDao<Irrigate> get() {
		return this.dao;
	}

	@Override
	public List<Irrigate> findByRegisterId(Integer registerId) {
		Irrigate t = new Irrigate();
		t.setRegisterId(registerId);
		return this.findList(t);
	}
}