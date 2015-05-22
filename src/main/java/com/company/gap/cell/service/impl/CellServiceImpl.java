package com.company.gap.cell.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.gap.base.dao.IBaseDao;
import com.company.gap.base.model.Status;
import com.company.gap.base.service.impl.BaseServiceImpl;
import com.company.gap.cell.dao.ICellDao;
import com.company.gap.cell.enumeration.CellStatus;
import com.company.gap.cell.model.Cell;
import com.company.gap.cell.service.ICellService;

@Service
public class CellServiceImpl extends BaseServiceImpl<Cell> implements ICellService {

	@Autowired
	private ICellDao dao;
	
	@Override
	public IBaseDao<Cell> get() {
		return this.dao;
	}
	
	@Override
	public List<Cell> findUsableList() {
		Cell cell = new Cell();
		cell.setStatus(Status.APPROVED.getStatus());
		cell.setUsestatus(CellStatus.IDLE.getStatus());
		return dao.findList(cell);
	}

	
	@Override
	public Map<Integer, String> queryId2Code() {
		Map<Integer, String> cellId2Name = new HashMap<Integer, String>();
		for (Cell cell : this.findList()) {
			cellId2Name.put(cell.getId(), cell.getCode());
		}
		return cellId2Name;
	}
	

	@Override
	public int updateUseStatus(Integer id, Integer usestatus) {
		Cell cell = new Cell();
		cell.setId(id);
		cell.setUsestatus(usestatus);
		return super.update(cell);
	}
}