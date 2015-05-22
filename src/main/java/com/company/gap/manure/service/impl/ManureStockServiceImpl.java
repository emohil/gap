package com.company.gap.manure.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.gap.base.dao.IBaseDao;
import com.company.gap.base.service.impl.BaseServiceImpl;
import com.company.gap.manure.dao.IManureStockDao;
import com.company.gap.manure.model.InStock;
import com.company.gap.manure.model.Stock;
import com.company.gap.manure.service.IManureStockService;

@Service
public class ManureStockServiceImpl extends BaseServiceImpl<Stock> implements IManureStockService {

	@Autowired
	private IManureStockDao<Stock> dao;
	
	@Override
	protected IBaseDao<Stock> get() {
		return this.dao;
	}
	
	@Override
	public int inApprove(InStock inStock) {
		Stock stock = new Stock();
		stock.setNameId(inStock.getNameId());
		stock.setSpecId(inStock.getSpecId());
		stock.setBatchId(inStock.getBatchId());
		stock.setProducerId(inStock.getProducerId());
		stock.setQuantity(inStock.getQuantity());
		//检索数据库中是否存在该库存对象.
		Stock findStock = this.findBean(stock);
		
		int id = 0;
		if (findStock == null) {
			//不存在时，新增并返回库存ID
			id = dao.insert(stock);
		}
		else {
			//存在时， 从检索的库存对象中取得库存ID
			id = findStock.getId();
			//更新库存数.
			this.addStockQuantity(id, inStock.getQuantity());
		}
		return id;
	}

	@Override
	public int addStockQuantity(Integer id, double quantity) {
		return dao.addStockQuantity(id, quantity);
	}
}