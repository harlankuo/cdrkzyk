﻿package com.jeysan.cpf.district.web;

import java.util.List;

import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;

import com.jeysan.cpf.district.entity.DistrictCity;
import com.jeysan.cpf.district.entity.DistrictProvince;
import com.jeysan.cpf.district.service.DistrictProvinceManager;
import com.jeysan.modules.action.CrudActionSupport;
import com.jeysan.modules.json.Result4Json;
import com.jeysan.modules.orm.Page;
import com.jeysan.modules.orm.PropertyFilter;
import com.jeysan.modules.utils.object.DataBeanUtil;
import com.jeysan.modules.utils.web.struts2.Struts2Utils;

/**
 * @author 黄静
 *
 */
@Namespace("/district")
@Results({@Result(name="district-selector",location="district-selector.jsp",type="dispatcher")})
public class DistrictProvinceAction extends CrudActionSupport<DistrictProvince> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1826212472390477005L;
	private Integer id;
	private String ids;
	private DistrictProvince entity;
	private DistrictProvinceManager districtProvinceManager;
	private Page<DistrictProvince> page = new Page<DistrictProvince>(DEFAULT_PAGE_SIZE);
	private Result4Json result4Json;
	
	@Override
	public String delete() throws Exception {
		if(result4Json == null)
			result4Json = new Result4Json();
		try {
			if(id!=null){
				districtProvinceManager.deleteDistrictProvince(id);
				logger.debug("删除了省或直辖市："+id);
			}else {
				districtProvinceManager.deleteDistrictProvinces(ids);
				logger.debug("删除了很多省或直辖市："+ids.toString());
			}
			result4Json.setStatusCode("200");
			result4Json.setMessage("删除省或直辖市成功");
			result4Json.setAction(Result4Json.DELETE);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			result4Json.setStatusCode("300");
			result4Json.setMessage(e instanceof DataIntegrityViolationException?"省或直辖市已经被关联,请先解除关联,删除失败":"删除省或直辖市失败");
		}
		Struts2Utils.renderJson(result4Json);
		return NONE;
	}
	public String districtselector() throws Exception {
		Struts2Utils.getRequest().setAttribute("districtProvince", districtProvinceManager.getAll());
		return "district-selector";
	}
	public String findSubs() throws Exception {
		prepareModel();
		if(entity != null){
			List<DistrictCity> cityList = entity.getCityList();
			if(cityList!=null&&cityList.size()>0){
				Struts2Utils.renderJson(cityList);
			}
		}
		return NONE;
	}
	@Override
	public String input() throws Exception {
		return INPUT;
	}
	@Override
	public String view() throws Exception {
		return VIEW;
	}
	@Override
	public String list() throws Exception {
		List<PropertyFilter> filters = PropertyFilter.buildFromHttpRequest(Struts2Utils.getRequest());
		DataBeanUtil.copyProperty(page, Struts2Utils.getRequest());
		//设置默认排序方式
		if (!page.isOrderBySetted()) {
			page.setOrderBy("id");
			page.setOrder(Page.ASC);
		}
		page = districtProvinceManager.searchDistrictProvince(page, filters);
		return SUCCESS;
	}
	@Override
	protected void prepareModel() throws Exception {
		if(id == null){
			entity = new DistrictProvince();
		}else{
			entity = districtProvinceManager.getDistrictProvince(id);
		}
	}
	@Override
	public String save() throws Exception {
		if(result4Json == null)
			result4Json = new Result4Json();
		try{
			districtProvinceManager.saveDistrictProvince(entity);
			result4Json.setStatusCode("200");
			if(id == null){
				result4Json.setMessage("保存省或直辖市成功");
				result4Json.setAction(Result4Json.SAVE);
			}else{
				result4Json.setMessage("修改省或直辖市成功");
				result4Json.setAction(Result4Json.UPDATE);
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result4Json.setStatusCode("300");
			if(e instanceof ObjectNotFoundException){
				result4Json.setMessage("信息已被删除，请重新添加");
			}else{
				result4Json.setMessage("保存省或直辖市失败");
			}
			
		}
		Struts2Utils.renderJson(result4Json);
		return NONE;
	}
	@Override
	public DistrictProvince getModel() {
		return entity;
	}
	@Autowired
	public void setDistrictProvinceManager(DistrictProvinceManager districtProvinceManager) {
		this.districtProvinceManager = districtProvinceManager;
	}
	public Page<DistrictProvince> getPage() {
		return page;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public void setResult4Json(Result4Json result4Json) {
		this.result4Json = result4Json;
	}
	
	
}
