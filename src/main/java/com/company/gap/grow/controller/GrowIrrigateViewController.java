package com.company.gap.grow.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.gap.base.controller.BeanViewController;
import com.company.gap.base.dao.search.Op;
import com.company.gap.base.model.Status;
import com.company.gap.base.model.ViewFormModel;
import com.company.gap.base.util.DateUtils;
import com.company.gap.base.util.Dto;
import com.company.gap.grow.model.Irrigate;
import com.company.gap.resource.component.DictHelper;

@Controller
@RequestMapping("admin/grow/irrigate")
public class GrowIrrigateViewController extends BeanViewController<Irrigate> {

	@Override
	protected void dowithSearcher(HttpServletRequest request, ViewFormModel model) {
		String registerId = request.getParameter("registerId");
		request.setAttribute("registerId", registerId);
		searcher.addSf("register_id", Op.EQ, registerId);
	}
	

	@Override
	protected void afterall(HttpServletRequest request, ViewFormModel model) {
		for (Irrigate  irrigate : datas) {
			Dto disp = irrigate.getDisp();
			disp.put("date", DateUtils.format(irrigate.getDate()));
			disp.put("status", Status.valueOf(irrigate.getStatus()).getName());
			disp.put("way", DictHelper.getText(irrigate.getWay()));
		}
	}
	
	@Override
	protected String viewResolver(HttpServletRequest request, ViewFormModel model) {
		return "admin/grow/irrigate/growIrrigateList";
	}
}