package com.company.gap.nurture.service;

import java.util.List;

import com.company.gap.base.service.IBaseService;
import com.company.gap.nurture.model.Manure;

public interface INurtureManureService extends IBaseService<Manure> {
	public List<Manure> findByRegisterId(Integer registerId);
}
