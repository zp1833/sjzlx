package com.alphasta.cms.dealing.service;

import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.alphasta.cms.model.DealingInfo;
import com.alphasta.cms.model.SuccessfulCase;
import com.alphasta.common.core.service.BaseManager;

/**
 * 现操作客户管理
 * 
 * @author zp
 * 
 */
public class DealingInfoManager extends BaseManager {

	public void removeDealingInfo(Integer id) {
		DealingInfo di = get(DealingInfo.class, id);
		if(di != null)
			remove(di);
	}
	
	public void saveDealingInfo(DealingInfo model) throws Exception {
		if ("成功结案".equals(model.getClientClass())) {
			SuccessfulCase sc = new SuccessfulCase();
			if (model.getId() == null) {
				BeanUtils.copyProperties(sc, model);
				sc.setId(null);
				save(sc);
			} else {
				List<SuccessfulCase> list = query("from SuccessfulCase where dealingId = ?", model.getId());
				if(list.size() == 0) {
					BeanUtils.copyProperties(sc, model);
					sc.setId(null);
					save(sc);
				}
			}
		}
		save(model);
	}
}
