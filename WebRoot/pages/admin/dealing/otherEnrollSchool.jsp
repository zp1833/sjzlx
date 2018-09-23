<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<input type="hidden" id="modelOtherEnrollSchool" name="model.otherEnrollSchool" value="${model.otherEnrollSchool }" >
<fieldset style="margin:10px;">
	<legend>其他申请学校</legend>
	<table id="enrollSchools" border="1" bordercolor="#a0c6e5" cellspacing="1" cellpadding="1" style="border-collapse: collapse;border-color: #a0c6e5">
		<tbody>          
			<tr>
				<th>序号</th>
				<th>语言入读时间</th>
				<th>正课入读时间</th>
				<th>申请学校<br>（中/英文）</th>
				<th>申请专业<br>（中/英文）</th>
				<th>申请类型</th>
				<th>合作方</th>
				<th>申请递交时间</th>
				<th>录取时间</th>
				<th>是否拿到<br>offer</th>
				<th>是否需要<br>配语言</th>
				<th>offer<br>接受条件</th>
				<th>offer<br>接受截止时间</th>
				<th>是否已接受<br>offer</th>
				<%-- 
				<th>签证递交时间</th>
				<th>是否获签</th>
				--%>
			</tr>
			<tr>
				<td align="center">1</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">2</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">3</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">4</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">5</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">6</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">7</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">8</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">9</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">10</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">11</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">12</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">13</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">14</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
			<tr>
				<td align="center">15</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_readTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_zhengReadTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center"><input type="text" name="o_applySchool" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applySpecial" style="width: 100px"></td>
				<td align="center"><input type="text" name="o_applyType" style="width: 80px"></td>
				<td align="center"><input type="text" name="o_partner" style="width: 80px"></td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_applySendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_receiveTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isGetOffer" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_isNeedLang" style="width: 60px">
				</td>
				<td align="center">
					<input type="text" name="o_offerCondition" style="width: 80px">
				</td>
				<td align="center">
					<input type="checkbox" class="na">无
					<input type="text" name="o_offerEndTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isAcceptOffer" style="width: 60px"/>
				</td>
				<%-- 
				<td align="center">
					<input type="text" name="o_visaSendTime" size="11" class="Wdate naDate noneDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/>
				</td>
				<td align="center">
					<input type="text" name="o_isBeSigned" style="width: 60px"/>
				</td>
				--%>
			</tr>
		</tbody>
	</table>
</fieldset>