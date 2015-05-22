package com.company.gap.pesticide.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.gap.base.controller.BeanViewController;
import com.company.gap.base.dao.search.Op;
import com.company.gap.base.model.ViewFormModel;
import com.company.gap.base.util.Dto;
import com.company.gap.pesticide.component.PesticideResourceHelper;
import com.company.gap.pesticide.enumeration.PesticideResourceType;
import com.company.gap.pesticide.model.Resource;
import com.company.gap.pesticide.model.Stock;

@Controller
@RequestMapping("admin/pesticide/stock")
public class PesticideStockViewController extends BeanViewController<Stock> {
	
	@Override
	protected void preparing(HttpServletRequest request, ViewFormModel model) {
		request.setAttribute("nameList", 	PesticideResourceHelper.getList(PesticideResourceType.PM, Resource.RS_ALL));
		request.setAttribute("specList", 	PesticideResourceHelper.getList(PesticideResourceType.GG,  Resource.RS_ALL));
		request.setAttribute("batchList", 	PesticideResourceHelper.getList(PesticideResourceType.SCPH,  Resource.RS_ALL));
		request.setAttribute("producerList",PesticideResourceHelper.getList(PesticideResourceType.SCS,  Resource.RS_ALL));
	}
	
	
	@Override
	protected void dowithSearcher(HttpServletRequest request, ViewFormModel model) {
		
		Dto data = model.getData();
		String nameId 		= data.getString("nameId");
		String sizeId 		= data.getString("sizeId");
		String batchId 		= data.getString("batchId");
		String producerId 	= data.getString("producerId");
		if (StringUtils.isNotEmpty(nameId)) 	searcher.addSf(toField("nameId"), Op.EQ, nameId);
		if (StringUtils.isNotEmpty(sizeId)) 	searcher.addSf(toField("sizeId"), Op.EQ, sizeId);
		if (StringUtils.isNotEmpty(batchId)) 	searcher.addSf(toField("batchId"), Op.EQ, batchId);
		if (StringUtils.isNotEmpty(producerId)) searcher.addSf(toField("producerId"), Op.EQ, producerId);
	}

	
	@Override
	protected void afterall(HttpServletRequest request, ViewFormModel model) {
		for (Stock t : datas) {
			Dto disp = t.getDisp();
			disp.put("nameId", 		PesticideResourceHelper.getText(t.getNameId()));
			disp.put("specId", 		PesticideResourceHelper.getText(t.getSpecId()));
			disp.put("batchId", 	PesticideResourceHelper.getText(t.getBatchId()));
			disp.put("producerId", 	PesticideResourceHelper.getText(t.getProducerId()));
		}
	}

	@Override
	protected String viewResolver(HttpServletRequest request, ViewFormModel model) {
		return "admin/pesticide/stock/pesticideStockList";
	}
}