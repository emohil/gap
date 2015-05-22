package com.company.gap.pm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.gap.base.controller.BeanEntryController;
import com.company.gap.base.service.IBaseService;
import com.company.gap.base.util.DateUtils;
import com.company.gap.base.util.Dto;
import com.company.gap.pm.model.Sale;
import com.company.gap.pm.service.ISaleService;
import com.company.gap.resource.component.DictHelper;
import com.company.gap.resource.enumeration.DictType;

@Controller
@RequestMapping("admin/pm/sale")
public class SaleEntryController extends BeanEntryController<Sale> {

	@Autowired
	private ISaleService service;
	
	@Override
	protected IBaseService<Sale> get() {return this.service;}
	
	@Override
	protected String toList(HttpServletRequest request) {
		return "redirect:/admin/pm/sale/list.html";
	}
	
	@Override
	protected String toEntry(HttpServletRequest request) {
		return "admin/pm/sale/entry";
	}
	
	
	protected void initializeAdd(HttpServletRequest request) {
		request.setAttribute("cplbList", 	DictHelper.getList(DictType.CPLB));
	}
	
	@Override
	protected void initializeEdit(HttpServletRequest request, Sale t) {
		Dto disp = t.getDisp();
		disp.put("saledate", DateUtils.format(t.getSaledate()));
		disp.put("productId", DictHelper.getText(t.getProductId()));
		super.initializeEdit(request, t);
	}
	
}
