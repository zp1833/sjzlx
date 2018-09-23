package com.alphasta.common.core.log;

import java.lang.reflect.Array;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;

import com.alphasta.cms.model.Operationlog;
import com.alphasta.common.Constants;
import com.alphasta.common.core.annotation.LogAnnotation;
import com.alphasta.common.core.annotation.LogTargetAnnotation;
import com.alphasta.common.core.model.BaseModel;
import com.alphasta.common.core.model.CmsThreadBean;
import com.alphasta.common.core.service.Manager;
import com.alphasta.common.core.util.DateUtil;
import com.alphasta.common.core.util.Ip2Long;
import com.alphasta.common.security.user.model.User;

@SuppressWarnings("unchecked")
public class LogAdvice {

	private Manager manager;

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public void writeLog(JoinPoint joinPoint){
		try {
			HttpServletRequest request = CmsThreadBean.getContext();
			if (request != null) {
				String ip = request.getRemoteAddr();
				String methodName = joinPoint.getSignature().getName();
				Class className = joinPoint.getTarget().getClass();
				String fullName = joinPoint.getStaticPart().toLongString();
				Method method = className.getMethod(methodName,
						getClassByName(fullName));
				if (method.isAnnotationPresent(LogAnnotation.class)) {
					User user = (User) request.getSession().getAttribute(
							Constants.USER_IN_SESSION);
					LogAnnotation logannotation = method
							.getAnnotation(LogAnnotation.class);
					String operateDescribe = logannotation.operateDescribe();
					Object[] objs = joinPoint.getArgs();
					for (Object obj : objs) {
						if (obj instanceof BaseModel) {
							BaseModel model = (BaseModel) obj;
							if (obj instanceof Operationlog)
								return;
							LogTargetAnnotation targer = (LogTargetAnnotation) obj
									.getClass().getAnnotation(
											LogTargetAnnotation.class);
							operateDescribe += targer.classDescribe();
							operateDescribe = operateDescribe + "  编号为:"
									+ getId(obj.toString()) + ";内容为:"
									+ model.getLogContent();
						}
					}

					Operationlog log = new Operationlog();
					log.setOperatedate(DateUtil.getCurrentDate());
					log.setOperation(operateDescribe);
					log.setUserid(user.getId());
					log.setUsername(user.getUsername());
					log.setIp(ip);
					log.setIpnum(Ip2Long.ipToLong(ip));
					this.getManager().save(log);
				}
			}
		} catch (Exception e) {
			
		}
	}

	private String getId(String objname) {
		int start = objname.indexOf("[id=") + 4;
		objname = objname.substring(start, objname.length() - 1);
		return objname;
	}

	private Class[] getClassByName(String str) throws ClassNotFoundException {
		int left = str.indexOf("(");
		int right = str.indexOf(")");
		String temp = str.substring(left + 1, right).trim();
		if (!"".equals(temp)) {
			String[] loop = temp.split(",");
			Class[] classes = new Class[loop.length];
			for (int i = 0; i < classes.length; i++) {
				String objname = loop[i].trim();
				if (objname.indexOf("[]") == -1) {
					Class cls = getSimpleType(objname.trim());
					if (cls == null)
						classes[i] = Class.forName(objname);
					else
						classes[i] = cls;
				} else {
					objname = objname.substring(0, objname.length() - 2);
					classes[i] = Array.newInstance(Class.forName(objname), 0)
							.getClass();
				}
			}
			return classes;
		} else {
			return null;
		}
	}

	/**
	 * 返回简单类型Class
	 * 
	 * @param type
	 * @return
	 */
	private Class getSimpleType(String type) {
		if ("int".endsWith(type))
			return int.class;
		if ("float".endsWith(type))
			return float.class;
		if ("double".endsWith(type))
			return double.class;
		if ("byte".endsWith(type))
			return byte.class;
		if ("short".endsWith(type))
			return short.class;
		if ("long".endsWith(type))
			return long.class;
		if ("char".endsWith(type))
			return char.class;
		if ("boolean".endsWith(type))
			return boolean.class;
		return null;
	}
}
