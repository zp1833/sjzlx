package com.alphasta.cms.stuinfo.service;

import java.util.List;

import com.alphasta.common.core.service.BaseManager;

/**
 * 学员信息管理
 * 
 * @author zhaopeng
 * 
 */
public class StuInfoManager extends BaseManager {

	public String isContactExist(Integer id, String contact) {
		List list = null;
		if (id != null)
			list = query("from StuInfo where contact = ? and id != ?", contact, id);
		else
			list = query("from StuInfo where contact = ?", contact);

		if (list.size() > 0)
			return "1";
		return "0";
	}
}
