package com.company.gap.grow.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sun.misc.BASE64Encoder;

import com.company.gap.base.controller.BeanEntryController;
import com.company.gap.base.service.IBaseService;
import com.company.gap.base.util.DateUtils;
import com.company.gap.cell.service.ICellService;
import com.company.gap.grow.model.Register;
import com.company.gap.grow.service.IGrowRegisterService;
import com.company.gap.resource.component.DictHelper;
import com.company.gap.resource.enumeration.DictType;

@SuppressWarnings("restriction")
@Controller
@RequestMapping("admin/grow/register")
public class GrowRegisterEntryController extends BeanEntryController<Register> {
	
	@Autowired
	private ICellService cellService;
	@Autowired
	private IGrowRegisterService service;
	
	@Override
	protected IBaseService<Register> get() {return this.service;}
	
	@Override
	protected String toList(HttpServletRequest request) {
		return "redirect:/admin/grow/process/list.html";
	}
	
	@Override
	protected String toEntry(HttpServletRequest request) {
		return "admin/grow/register/growRegisterEntry";
	}
	

	@Override
	protected void initializeEdit(HttpServletRequest request, Register t) {
		t.getDisp().put("cellId", t.getCellId());
		t.getDisp().put("productId", DictHelper.getText(t.getProductId()));
		t.getDisp().put("regdate", DateUtils.format(t.getRegdate()));
		if (t.getGrowstatus() != null && t.getGrowstatus() != 1 && t.getQrcode() != null) {
			t.getDisp().put("qrcode", new BASE64Encoder().encode(t.getQrcode()));
		}
		super.initializeEdit(request, t);
	}

	@RequestMapping("complete")
	public String complete(HttpServletRequest request, @RequestParam("id") Integer id) {
		service.complete(id);
		return this.toList(request);
	}
	
	@RequestMapping("archive")
	public String archive(HttpServletRequest request, @RequestParam("id") Integer id) {
		service.archive(id);
		return "redirect:/grow/completed/list.html";
	}
	
	protected void initializeAdd(HttpServletRequest request) {
		request.setAttribute("cellList", 	cellService.findUsableList());
		request.setAttribute("cplbList", 	DictHelper.getList(DictType.CPLB));
	}
}