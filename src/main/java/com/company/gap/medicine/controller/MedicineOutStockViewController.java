package com.company.gap.medicine.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.gap.base.controller.BeanViewController;
import com.company.gap.base.dao.search.Op;
import com.company.gap.base.model.Status;
import com.company.gap.base.model.ViewFormModel;
import com.company.gap.base.util.DateUtils;
import com.company.gap.base.util.Dto;
import com.company.gap.medicine.component.MedicineResourceHelper;
import com.company.gap.medicine.enumeration.MedicineResourceType;
import com.company.gap.medicine.model.OutStock;
import com.company.gap.medicine.model.Resource;

@Controller
@RequestMapping("admin/medicine/outstock")
public class MedicineOutStockViewController extends BeanViewController<OutStock> {
	
	@Override
	protected void preparing(HttpServletRequest request, ViewFormModel model) {
		request.setAttribute("nameList", 	MedicineResourceHelper.getList(MedicineResourceType.PM, Resource.RS_ALL));
		request.setAttribute("specList", 	MedicineResourceHelper.getList(MedicineResourceType.GG,  Resource.RS_ALL));
		request.setAttribute("batchList", 	MedicineResourceHelper.getList(MedicineResourceType.SCPH,  Resource.RS_ALL));
		request.setAttribute("producerList",MedicineResourceHelper.getList(MedicineResourceType.SCS,  Resource.RS_ALL));
		
	}
	
	@Override
	protected void dowithSearcher(HttpServletRequest request, ViewFormModel model) {
		String stockId = StringUtils.defaultString(request.getParameter("stockId"));
		String registerId = StringUtils.defaultString(request.getParameter("registerId"));
		if (StringUtils.isNotEmpty(stockId)) {
			request.setAttribute("stockId", stockId);
			searcher.addSf(toField("stockId"), Op.EQ, stockId);
		}
		if (StringUtils.isNotEmpty(registerId)) {
			request.setAttribute("registerId", registerId);
			searcher.addSf(toField("registerId"), Op.EQ, registerId);
		}
		
		Map<String, Object> data = model.getData();
		String nameid 		= ObjectUtils.toString(data.get("nameid"), "0");
		String sizeid 		= ObjectUtils.toString(data.get("sizeid"), "0");
		String batchid 		= ObjectUtils.toString(data.get("batchid"), "0");
		String producerid 	= ObjectUtils.toString(data.get("producerid"), "0");
		if (!"0".equals(nameid)) 	searcher.addSf("outstock_nameid", Op.EQ, nameid);
		if (!"0".equals(sizeid)) 	searcher.addSf("outstock_sizeid", Op.EQ, sizeid);
		if (!"0".equals(batchid)) 	searcher.addSf("outstock_batchid", Op.EQ, batchid);
		if (!"0".equals(producerid))searcher.addSf("outstock_producerid", Op.EQ, producerid);
	}
	
	@Override
	protected void afterall(HttpServletRequest request, ViewFormModel model) {
		for (OutStock outStock : datas) {
			Dto disp = outStock.getDisp();
			disp.put("nameId", 		MedicineResourceHelper.getText(outStock.getNameId()));
			disp.put("specId", 		MedicineResourceHelper.getText(outStock.getSpecId()));
			disp.put("batchId", 	MedicineResourceHelper.getText(outStock.getBatchId()));
			disp.put("producerId", 	MedicineResourceHelper.getText(outStock.getProducerId()));
			disp.put("outdate", 	DateUtils.format(outStock.getOutdate()));
			Status status = Status.valueOf(outStock.getStatus());
			disp.put("status", 		status.getName());
		}
	}
	
	@Override
	protected String viewResolver(HttpServletRequest request, ViewFormModel model) {
		return "admin/medicine/outstock/medicineOutStockList";
	}
}
