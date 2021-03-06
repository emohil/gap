package com.company.gap.medicine.service;

import com.company.gap.base.service.IBaseService;
import com.company.gap.medicine.model.InStock;

/**
 * 入库的 审批/作废 需要更新库存状态.
 *
 */
public interface IMedicineInStockService extends IBaseService<InStock> {
	
	
	int approve(Integer id);
	
	int nullify(Integer id);
	
	
}
