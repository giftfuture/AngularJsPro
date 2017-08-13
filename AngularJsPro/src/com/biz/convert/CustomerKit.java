package com.biz.convert;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import com.base.page.BasePage;
import com.base.util.DateUtil;
import com.biz.entity.Customers;
import com.biz.vo.CustomerVO;
/**
 * 
 * <br>
 * <b>作者：</b>fred.zhao<br>
 */
public class CustomerKit {
	
	/**
	 * 
	 * @param vo
	 * @return
	 */
	public static Map<String, Object> toRecord(CustomerVO vo){
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("id", vo.getId());
		record.put("customerId", vo.getCustomerId());
		record.put("createTime", vo.getCreateTime());
		record.put("status", vo.getStatus());
		record.put("updateTime", vo.getUpdateTime());
		record.put("address", vo.getAddress());
		record.put("email", vo.getEmail());
		record.put("scope", vo.getScope());
		record.put("city", vo.getCity());
		record.put("telephone", vo.getTelephone());
		record.put("mobile", vo.getMobile());
		record.put("customerName", vo.getCustomerName());
		record.put("nickName", vo.getNickName());
		record.put("district", vo.getDistrict());
		record.put("introduction", vo.getIntroduction());
		record.put("birthday", vo.getBirthday());
		record.put("valid", vo.getValid());
		return record;
	}
	public static Map<String, Object> toRecord(Customers vo){
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("id", vo.getId());
		record.put("customerId", vo.getCustomerId());
		record.put("createTime", DateUtil.format8chars(vo.getCreateTime()));
		record.put("status", vo.getStatus());
		record.put("updateTime",DateUtil.format8chars(vo.getUpdateTime()) );
		record.put("address", vo.getAddress());
		record.put("email", vo.getEmail());
		record.put("scope", vo.getScope());
		record.put("city", vo.getCity());
		record.put("telephone", vo.getTelephone());
		record.put("mobile", vo.getMobile());
		record.put("customerName", vo.getCustomerName());
		record.put("nickName", vo.getNickName());
		record.put("district", vo.getDistrict());
		record.put("introduction", vo.getIntroduction());
		record.put("birthday", vo.getBirthday());
		record.put("valid", vo.getValid());
		return record;
	}
}

