package com.company.gap.base.controller;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.gap.base.component.Translator;
import com.company.gap.base.dao.search.Pager;
import com.company.gap.base.dao.search.SimpleSearcher;
import com.company.gap.base.model.GeneralModelUtil;
import com.company.gap.base.model.ViewFormModel;
import com.company.gap.base.service.IBeanViewService;
import com.company.gap.base.util.Dto;
import com.company.util.New;

public abstract class BeanViewController<T> extends BaseController {

	
	@Autowired
	private IBeanViewService<T> viewService;
	
	/** 查询到的结果数据集 */
	protected List<T> datas;
	/** 翻页控制器 */
	protected Pager pager;
	/** 查询器 */
	protected SimpleSearcher searcher;
	
	private Class<T> clazz;
	
	private Map<String, Translator<Object, Object>> translators = New.hashMap();
	
	protected void registTranslators() {}
	
	@SuppressWarnings("unchecked")
	public BeanViewController() {
		Type type = this.getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			Type[] types = ((ParameterizedType) type).getActualTypeArguments();
			if (types != null && types.length > 0){
				this.clazz = (Class<T>) types[0];
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	protected  final void registerTranslator(String field, @SuppressWarnings("rawtypes") Translator translator){
		translators.put(field, translator);
	}
	
	private void doTranslate() {
		for (Map.Entry<String, Translator<Object, Object>> ent : translators.entrySet()){
			String field = ent.getKey();
			Translator<Object, Object> translator = ent.getValue();
			writeDisps(datas, translator.translate(getValues(datas, field)), field);
		}
	}
	
	private List<Object> getValues(List<T> datas, String field) {
		List<Object> ret = New.arrayList();
		
		if (datas.size() == 0) return ret;
		
		if (datas.get(0) instanceof Map) {
			for (T t : datas) {
				Map<?, ?> map = (Map<?, ?>) t;
				ret.add(map.get(field));
			}
		} else {
			for (T t : datas) {
				try {
					Field f = null;
					for (Class<?> c = t.getClass(); c != Object.class; c = c.getSuperclass()) {
						for (Field __f : c.getDeclaredFields()) {
							if (field.equals(__f.getName())) {
								f = __f;
								break;
							}
						}
						if (f != null) break;
					}
					f.setAccessible(true);
					ret.add(f.get(t));
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return ret;
	}
	
	private void writeDisps(List<T> datas, List<Object> disps, String field) {
		if (datas.size() == 0) return;
		
		if (datas.get(0) instanceof Map) {
			for (int i = 0; i < datas.size(); i++) {
				Map<?, ?> map = (Map<?, ?>) datas.get(i);
				Dto dto = (Dto) map.get("disp");
				
				dto.put(field, disps.get(i));
			}
		} else {
			for (int i = 0; i < datas.size(); i++) {
				T t = datas.get(i);
				try {
					Field f = null;
					for (Class<?> c = t.getClass(); c != Object.class; c = c.getSuperclass()) {
						for (Field __f : c.getDeclaredFields()) {
							if ("disp".equals(__f.getName())) {
								f = __f;
								break;
							}
						}
						if (f != null) break;
					}
					f.setAccessible(true);
					Dto dto = (Dto) f.get(t);
					dto.put(field, disps.get(i));
					
				} catch (SecurityException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@RequestMapping("list")
	public String execute(HttpServletRequest request, ViewFormModel model) {
		
		this.initialize(request, model);
		
		this.preparing(request, model);
		
		this.dowithSearcher(request, model);
		
		this.searching(request, model);
		
		this.registTranslators();
		
		this.doTranslate();
		
		this.fill(request, model);
		
		this.afterall(request, model);
		
		return viewResolver(request, model);
	}
	
	@RequestMapping("gopage")
	public String doGopage(HttpServletRequest request, ViewFormModel model) {
		_action = ACT_GOPAGE;
		return execute(request, model);
	}

	@RequestMapping("search")
	public String doSearch(HttpServletRequest request, ViewFormModel model){
		_action = ACT_SEARCH;
		return execute(request, model);
	}
	
	/**
	 * 初始化参数.
	 */
	private void initialize(HttpServletRequest request, ViewFormModel model) {
		this.searcher = model.getSearcher();
		this.pager = model.getPager();
		if (searcher == null){
			searcher = new SimpleSearcher();
		}
		searcher.setTable(GeneralModelUtil.getTableName(this.clazz));
		if (pager == null) {
			pager = Pager.getDefault();
		}
	}
	
	/** 
	 * 准备其他数据.
	 */
	protected void preparing(HttpServletRequest request, ViewFormModel model) {}
	
	/**
	 * Searcher加工.
	 */
	protected void dowithSearcher(HttpServletRequest request, ViewFormModel model){}
	
	/**
	 * 执行查询.
	 */
	protected void searching(HttpServletRequest request, ViewFormModel model) {
		this.datas = viewService.queryList(searcher, pager, clazz);
	}
	
	/**
	 * 填充数据，供前台使用.
	 */
	protected void fill(HttpServletRequest request, ViewFormModel model) {
		request.setAttribute("data", 		model.getData());
		request.setAttribute("datas", 		datas);
		request.setAttribute("searcher",	searcher);
		request.setAttribute("pager", 		pager);
	}
	
	/** 
	 * 呈现之前的最后处理.
	 */
	protected void afterall(HttpServletRequest request, ViewFormModel model) {}
	
	/**
	 * 指定要呈现的View.
	 */
	protected abstract String viewResolver(HttpServletRequest request, ViewFormModel model);
}