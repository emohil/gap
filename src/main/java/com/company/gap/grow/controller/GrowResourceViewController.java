package com.company.gap.grow.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.gap.base.controller.BeanViewController;
import com.company.gap.base.dao.search.Op;
import com.company.gap.base.model.Status;
import com.company.gap.base.model.ViewFormModel;
import com.company.gap.base.util.Dto;
import com.company.gap.grow.enumeration.ResourceType;
import com.company.gap.grow.model.Resource;

@Controller
@RequestMapping("grow/resource")
public class GrowResourceViewController extends BeanViewController<Resource> {
	
	@Override
	protected void preparing(HttpServletRequest request, ViewFormModel model) {
		int type = NumberUtils.toInt(request.getParameter("type"));
		request.setAttribute("type", type);
		request.setAttribute("resource", ResourceType.valueOf(type));
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
		return "grow/resource/growResourceList";
	}
}