package com.alphasta.cms.successfulCase.service;

import com.alphasta.cms.model.SuccessfulCase;
import com.alphasta.common.core.service.BaseManager;

/**
 * 成功案例
 * 
 * @author huopengfei
 * 
 */
public class SuccessfulCaseManager extends BaseManager {

	public void removeSuccessfulCase(Integer id) {
		System.out.println("!!!!!!!!!!!!!!");
		SuccessfulCase br = get(SuccessfulCase.class, id);
		if(br != null)
			remove(br);
	}
}
