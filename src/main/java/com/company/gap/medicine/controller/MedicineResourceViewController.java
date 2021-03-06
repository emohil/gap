package com.company.gap.medicine.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.gap.base.controller.BeanViewController;
import com.company.gap.base.dao.search.Op;
import com.company.gap.base.model.Status;
import com.company.gap.base.model.ViewFormModel;
import com.company.gap.base.util.Dto;
import com.company.gap.medicine.enumeration.MedicineResourceType;
import com.company.gap.medicine.model.Resource;

@Controller
@RequestMapping("admin/medicine/resource")
public class MedicineResourceViewController extends BeanViewController<Resource> {
	
	@Override
	protected void preparing(HttpServletRequest request, ViewFormModel model) {
		String type = request.getParameter("type");
		request.setAttribute("type", type);
		request.setAttribute("resource", MedicineResourceType.valueOf(type));
	}

	@Override
	protected void dowithSearcher(HttpServletRequest request, ViewFormModel model) {
		String type = request.getParameter("type");
		searcher.addSf("type", Op.EQ, type);
	}
	
	@Override
	protected void afterall(HttpServletRequest request, ViewFormModel model) {
		for (Resource resource : datas) {
			Dto disp = resource.getDisp();
			disp.put("status", Status.valueOf(resource.getStatus()).getName());
		}
	} 

	@Override
	protected String viewResolver(HttpServletRequest request, ViewFormModel model) {
		return "admin/medicine/resource/medicineResourceList";
	}
}