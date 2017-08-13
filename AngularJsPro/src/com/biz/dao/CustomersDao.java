package com.biz.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.base.dao.BaseDao;
import com.biz.entity.Customers;
import com.biz.vo.CustomerVO;
/**
 * 
 * <br>
 * <b>功能：</b>CustomersDao<br>
 * <b>作者：</b>fred.zhao<br>
 */
public interface CustomersDao extends BaseDao<Customers> {
	
	List<CustomerVO> queryOrdersByCid(@Param(value="id")String id);
	CustomerVO selectById(@Param(value="id")String id);
}
