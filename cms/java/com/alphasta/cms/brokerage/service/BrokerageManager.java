package com.alphasta.cms.brokerage.service;

import com.alphasta.cms.model.Brokerage;
import com.alphasta.common.core.service.BaseManager;

/**
 * 佣金管理
 * 
 * @author zhaopeng
 * 
 */
public class BrokerageManager extends BaseManager {

	public void removeBrokerage(Integer id) {
		Brokerage br = get(Brokerage.class, id);
		if(br != null)
			remove(br);
	}
}
