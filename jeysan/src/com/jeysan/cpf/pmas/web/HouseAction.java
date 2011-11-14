﻿package com.jeysan.cpf.pmas.web;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.hibernate.ObjectNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;

import com.jeysan.cpf.pmas.entity.House;
import com.jeysan.cpf.pmas.service.HouseManager;
import com.jeysan.cpf.pmas.service.PersonManager;
import com.jeysan.modules.action.PrintActionSupport;
import com.jeysan.modules.json.Result4Json;
import com.jeysan.modules.orm.Page;
import com.jeysan.modules.orm.PropertyFilter;
import com.jeysan.modules.utils.object.DataBeanUtil;
import com.jeysan.modules.utils.web.struts2.Struts2Utils;

/**
 * @author 黄静
 *
 */
@Namespace("/pmas")
@Results( { @Result(name = "house4lookup", location = "house4lookup.jsp", type = "dispatcher"),
	@Result(name = "house4stat1", location = "house4stat1.jsp", type = "dispatcher"),
	@Result(name = "house4stat2", location = "house4stat2.jsp", type = "dispatcher")})
public class HouseAction extends PrintActionSupport<House> {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1826212472390477005L;
	private Long id;
	private String ids;
	private House entity;
	private HouseManager houseManager;
	private PersonManager personManager;
	private Page<House> page = new Page<House>(DEFAULT_PAGE_SIZE);
	private Result4Json result4Json;
	@Override
	public String delete() throws Exception {
		if(result4Json == null)
			result4Json = new Result4Json();
		try {
			if(id!=null){
				houseManager.deleteHouse(id);
				logger.debug("删除了房屋："+id);
			}else {
				houseManager.deleteHouses(ids);
				logger.debug("删除了很多房屋："+ids.toString());
			}
			result4Json.setStatusCode("200");
			result4Json.setMessage("删除房屋成功");
			result4Json.setAction(Result4Json.DELETE);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			result4Json.setStatusCode("300");
			result4Json.setMessage(e instanceof DataIntegrityViolationException?"房屋已经被关联,请先解除关联,删除失败":"删除房屋失败");
		}
		Struts2Utils.renderJson(result4Json);
		return NONE;
	}
	public String getPersonNumByHouseCode() throws Exception {
		String code = Struts2Utils.getParameter("code");
		//logger.debug("code.............."+code);
		Map result = personManager.queryPersonNumByHouseCode(code);
		/*Map result = new HashMap();
		result.put("totalNum", 1000);
		result.put("maleNum", 800);
		result.put("femaleNum", 200);
		result.put("fertileWomanNum", 150);
		result.put("notFertileWomanNum", 50);*/
		Struts2Utils.renderJson(result);
		return NONE;
	}
	public String list4lookup() throws Exception {
		list();
		return "house4lookup";
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
		page = houseManager.searchHouse(page, filters);
		String type = Struts2Utils.getParameter("type");
		if(StringUtils.isNotEmpty(type)){
			return "house4stat"+type;
		}
		return SUCCESS;
	}
	@Override
	protected void prepareModel() throws Exception {
		if(id == null){
			entity = new House();
		}else{
			entity = houseManager.getHouse(id);
		}
	}
	@Override
	public String save() throws Exception {
		if(result4Json == null)
			result4Json = new Result4Json();
		try{
			houseManager.saveHouse(entity);
			result4Json.setStatusCode("200");
			if(id == null){
				result4Json.setMessage("保存房屋成功");
				result4Json.setAction(Result4Json.SAVE);
			}else{
				result4Json.setMessage("修改房屋成功");
				result4Json.setAction(Result4Json.UPDATE);
			}
		}catch(Exception e){
			logger.error(e.getMessage(), e);
			result4Json.setStatusCode("300");
			if(e instanceof ObjectNotFoundException){
				result4Json.setMessage("信息已被删除，请重新添加");
			}else{
				result4Json.setMessage("保存房屋失败");
			}
			
		}
		Struts2Utils.renderJson(result4Json);
		return NONE;
	}
	@Override
	public House getModel() {
		return entity;
	}
	@Autowired
	public void setHouseManager(HouseManager houseManager) {
		this.houseManager = houseManager;
	}
	@Autowired
	public void setPersonManager(PersonManager personManager) {
		this.personManager = personManager;
	}
	public Page<House> getPage() {
		return page;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
	public void setResult4Json(Result4Json result4Json) {
		this.result4Json = result4Json;
	}
	
	
}
