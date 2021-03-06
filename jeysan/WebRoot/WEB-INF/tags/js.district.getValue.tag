<%@ include file="/common/taglibs.jsp" %>
<%@ tag import="org.springframework.context.ApplicationContext,
                 org.springframework.web.context.WebApplicationContext,
                 com.jeysan.cpf.district.service.DistrictProvinceManager,
                 com.jeysan.modules.orm.hibernate.IdEntity,
                 com.jeysan.cpf.district.entity.DistrictProvince,
                 com.jeysan.cpf.district.entity.DistrictCity,
                 com.jeysan.cpf.district.entity.DistrictCounty,
                 com.jeysan.cpf.district.entity.DistrictTown,
                 com.jeysan.cpf.district.entity.DistrictVillage,
                 org.apache.commons.lang.StringUtils" %>
<%@ attribute name="value"	type="java.lang.String"	required="true" description="值" %>
<%	try{	
			ApplicationContext applicationContext=(ApplicationContext)application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
			DistrictProvinceManager districtProvinceManager = applicationContext.getBean("districtProvinceManager",DistrictProvinceManager.class);
			
			String key = "address___"+value;
			String address  = (String)request.getAttribute(key);
			if(StringUtils.isEmpty(address)){
				IdEntity idEntity = districtProvinceManager.getDistrictByCode(value);
				StringBuilder sb = new StringBuilder();
				if(idEntity instanceof DistrictProvince){
					DistrictProvince d = (DistrictProvince)idEntity;
					sb.append(d.getName());
				}else if(idEntity instanceof DistrictCity){
					DistrictCity d = (DistrictCity)idEntity;
					sb.append(d.getProvince().getName()).append(d.getName());
				}else if(idEntity instanceof DistrictCounty){
					DistrictCounty d = (DistrictCounty)idEntity;
					sb.append(d.getCity().getProvince().getName()).append(d.getCity().getName()).append(d.getName());
				}else if(idEntity instanceof DistrictTown){
					DistrictTown d = (DistrictTown)idEntity;
					sb.append(d.getCounty().getCity().getProvince().getName()).append(d.getCounty().getCity().getName()).append(d.getCounty().getName()).append(d.getName());
				}else if(idEntity instanceof DistrictVillage){
					DistrictVillage d = (DistrictVillage)idEntity;
					sb.append(d.getTown().getCounty().getCity().getProvince().getName()).append(d.getTown().getCounty().getCity().getName()).append(d.getTown().getCounty().getName()).append(d.getTown().getName()).append(d.getName());
				}
				address = sb.toString();
				request.setAttribute(key,address);
			}
			if(StringUtils.isNotEmpty(address)){
				%><%=address%><%
			}
	}catch(Exception e){
		//e.printStackTrace();
	}
%>