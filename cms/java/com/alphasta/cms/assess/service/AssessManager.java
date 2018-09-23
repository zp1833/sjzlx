package com.alphasta.cms.assess.service;

import java.text.SimpleDateFormat;
import java.util.List;

import com.alphasta.cms.model.Assess;
import com.alphasta.cms.model.AssessCell;
import com.alphasta.cms.model.AssessItem;
import com.alphasta.cms.model.Employees;
import com.alphasta.common.core.service.BaseManager;

/**
 * 员工考核管理
 * 
 * @author zhaopeng
 * 
 */
public class AssessManager extends BaseManager {

	public String remove(Integer id) {
		try {
			Assess assess = this.get(Assess.class, id);
			this.remove(assess);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	public String saveAssessCell(Integer cellId, Integer empId, Integer itemId, String dateStr, String isPay, String descn) {
		try {
			AssessCell assessCell = new AssessCell();
			if(!Integer.valueOf(0).equals(cellId))
				assessCell.setId(Integer.valueOf(cellId));
			Employees emp = get(Employees.class, empId);
			AssessItem ai = get(AssessItem.class, itemId);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			assessCell.setAdate(sdf.parse(dateStr));
			assessCell.setIsPay(isPay);
			assessCell.setDescn(descn);
			assessCell.setEmployee(emp);
			assessCell.setAssessItem(ai);
			this.save(assessCell);
			return String.valueOf(assessCell.getId());
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	@SuppressWarnings("unchecked")
	public String delItem(Integer itemId) {
		try {
			AssessItem ai = this.get(AssessItem.class, itemId);
			this.remove(ai);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "0";
		}
		
	}
	
	public String delAssessCell(Integer cellId) {
		if(!Integer.valueOf(0).equals(cellId)) {
			AssessCell ac = this.get(AssessCell.class, cellId);
			this.remove(ac);
		}
		return "1";	
	}
	
	@SuppressWarnings("unchecked")
	public List<AssessCell> getAllAssessCells(Integer id) {
		return this.query("from AssessCell where assessItem.assess.id = ? order by id", id);
	} 
}
