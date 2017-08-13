package com.biz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.base.annotation.Auth;
import com.base.easyui.DataGridAdapter;
import com.base.easyui.EasyUIGrid;
import com.base.json.JsonUtils;
import com.base.page.BasePage;
import com.base.util.IDGenerator;
import com.base.web.BaseController;
import com.biz.entity.Customers;
import com.biz.service.CustomersService;
import com.biz.vo.CustomerVO;
import com.google.common.collect.Maps;

import org.apache.log4j.Level;

/**
 * 
 * <br>
 * <b>功能：</b>CustomersController<br>
 * <b>作者：</b>fred.zhao<br>
 */ 
@Controller
@RequestMapping("/customers") 
public class CustomersController extends BaseController{
	
	protected final Logger logger =  LoggerFactory.getLogger(getClass());
	
	// Servrice start
	@Autowired //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private CustomersService customersService; 
	@Autowired(required=false)
	private DataGridAdapter dataGridAdapter;
	/**
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@Auth(verifyLogin=true,verifyURL=true)
	@RequestMapping(value = "/list") 
	public ModelAndView list(CustomerVO vo,HttpServletRequest request) throws Exception{
		request.isUserInRole("");
		return forward("server/sys/customers"); 
	}
	
	
	/**
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@Auth(verifyLogin=true,verifyURL=true)
	@RequestMapping(value = "/dataList.json") 
	@ResponseBody//EasyUIGrid
	public Map<String, Object>  dataList(CustomerVO vo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		Map<String,Object> map = Maps.newHashMap();
		int pageSize = Integer.parseInt(request.getParameter("pageSize")); 
		int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		vo.setLimit(pageSize);
		vo.setPage(pageNumber);
		BasePage<Map<String, Object>> pagination = customersService.pagedQuery(vo);
		//List<Customers> list = customersService.queryByList(vo);
		//data = {total:result.data.totalCount,rows:result.data.dataList};
		//map.put("totalCount", pagination.getTotal());
		map.put("total", pagination.getTotal());
		map.put("rows",pagination.getRecords());
		//return dataGridAdapter.wrap(pagination);
		return map;
	}
	
	/**
	 * 添加或修改数据
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@Auth(verifyLogin=true,verifyURL=true)
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public String save(Customers entity,HttpServletRequest request,HttpServletResponse response) throws Exception{
		entity.setCustomerId(IDGenerator.getUUID());
		String customerId = "";
		Customers cust = null;
		if(entity.getId()==null||StringUtils.isBlank(entity.getId())){
			//entity.setId(IDGenerator.getLongId());
			customerId = customersService.add(entity);
		}else{
				cust = customersService.queryById(entity.getId());
			if(cust == null){
				customerId = customersService.add(entity);
			}else{
				customersService.update(entity);
			}
		}
		return sendSuccessResult(response, "保存成功~");
	}
	
	@SuppressWarnings("unchecked")
	@Auth(verifyLogin=true,verifyURL=true)
	@RequestMapping(value = "/getId", method = RequestMethod.POST)
	@ResponseBody
	public String getId(String id,HttpServletRequest request,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = getRootMap();
		Customers entity  = customersService.queryById(id);
		if(entity  == null){
			return sendFailureResult(response, "没有找到对应的记录!");
		}
		context.put(SUCCESS, true);
		context.put("data", entity);
		return JsonUtils.encode(context);
	}
	
	@Auth(verifyLogin=true,verifyURL=true)
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(String[] id,HttpServletRequest request,HttpServletResponse response) throws Exception{
		customersService.delete(id);
		return removeSuccessMessage(response);
	}
	
	@Auth(verifyLogin=true,verifyURL=true)
	@RequestMapping(value = "/logicdelete", method = RequestMethod.POST)
	@ResponseBody
	public String logicdelete(String[] id,HttpServletRequest request,HttpServletResponse response) throws Exception{
		customersService.logicdelete(id);
		return removeSuccessMessage(response);
	}
	
	
}
