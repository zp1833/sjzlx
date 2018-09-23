package com.alphasta.cms.ym.service;

import java.util.List;

import com.alphasta.cms.model.YmInfo;
import com.alphasta.common.core.service.BaseManager;

/**
 * 学员信息管理
 * 
 * @author zhaopeng
 * 
 */
public class YmInfoManager extends BaseManager {

	public void removeYmInfo(Integer id) {
		YmInfo br = get(YmInfo.class, id);
		if(br != null)
			remove(br);
	}
	
	public String isContactExist(Integer id, String contact) {
		List list = null;
		if (id != null)
			list = query("from YmInfo where contact = ? and id != ?", contact, id);
		else
			list = query("from YmInfo where contact = ?", contact);

		if (list.size() > 0)
			return "1";
		return "0";
	}
}
