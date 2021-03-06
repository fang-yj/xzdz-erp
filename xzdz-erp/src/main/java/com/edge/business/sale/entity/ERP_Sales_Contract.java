package com.edge.business.sale.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 销售合同实体类
 * 
 * @author NingCG
 *
 */
public class ERP_Sales_Contract {
	private Integer sales_Contract_Id;// 主键
	private String contract_Code;// 合同编号
	private String sales_Contract_Name;// 合同名称
	private Integer customer;// 客户
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date qd_Date;// 签订时间
	private String remarks;// 备注
	private String zljsyq;// 质量技术要求
	private String jhsjjdd;// 交货时间及地点
	private String ysjfy;// 运输及费用
	private String fkfs;// 付款方式
	private String wyzr;// 违约责任
	private String wjsy;// 未尽事宜
	private String htfs;// 合同份数
	private String sxrq;// 生效日期
	private Integer supplier;// 供方
	private String unitAddress;// 单位地址
	private String agent;// 委托代理人
	private String cus_Address;// 客户单位地址
	private Integer approvalDm;// 审批状态
	private String task_Describe;// 待办任务描述
	private String status;// 订单状态
	private Boolean is_xsddprcedf;// 是否存在销售订单流程 （默认为否）
	private String task_des;// 代办任务2
	private Double htje;// 合同金额
	private Boolean is_wcsk;// 是否完成收款
	private Boolean is_delivery;// 送货单是否一致

	// 辅助属性
	private String customerName;// 需求方单位
	private String supplierName;// 供方单位
	private String fjsx;// 附件属性
	private String approvalName;// 审批状态名称
	private String taskId;// 当前运行任务Id

	public Integer getSales_Contract_Id() {
		return sales_Contract_Id;
	}

	public void setSales_Contract_Id(Integer sales_Contract_Id) {
		this.sales_Contract_Id = sales_Contract_Id;
	}

	public String getContract_Code() {
		return contract_Code;
	}

	public void setContract_Code(String contract_Code) {
		this.contract_Code = contract_Code;
	}

	public Integer getCustomer() {
		return customer;
	}

	public void setCustomer(Integer customer) {
		this.customer = customer;
	}

	public Date getQd_Date() {
		return qd_Date;
	}

	public void setQd_Date(Date qd_Date) {
		this.qd_Date = qd_Date;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getZljsyq() {
		return zljsyq;
	}

	public void setZljsyq(String zljsyq) {
		this.zljsyq = zljsyq;
	}

	public String getJhsjjdd() {
		return jhsjjdd;
	}

	public void setJhsjjdd(String jhsjjdd) {
		this.jhsjjdd = jhsjjdd;
	}

	public String getYsjfy() {
		return ysjfy;
	}

	public void setYsjfy(String ysjfy) {
		this.ysjfy = ysjfy;
	}

	public String getFkfs() {
		return fkfs;
	}

	public void setFkfs(String fkfs) {
		this.fkfs = fkfs;
	}

	public String getWyzr() {
		return wyzr;
	}

	public void setWyzr(String wyzr) {
		this.wyzr = wyzr;
	}

	public String getWjsy() {
		return wjsy;
	}

	public void setWjsy(String wjsy) {
		this.wjsy = wjsy;
	}

	public String getHtfs() {
		return htfs;
	}

	public void setHtfs(String htfs) {
		this.htfs = htfs;
	}

	public String getSxrq() {
		return sxrq;
	}

	public void setSxrq(String sxrq) {
		this.sxrq = sxrq;
	}

	public Integer getSupplier() {
		return supplier;
	}

	public void setSupplier(Integer supplier) {
		this.supplier = supplier;
	}

	public String getUnitAddress() {
		return unitAddress;
	}

	public void setUnitAddress(String unitAddress) {
		this.unitAddress = unitAddress;
	}

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getCus_Address() {
		return cus_Address;
	}

	public void setCus_Address(String cus_Address) {
		this.cus_Address = cus_Address;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getFjsx() {
		return fjsx;
	}

	public void setFjsx(String fjsx) {
		this.fjsx = fjsx;
	}

	public String getSales_Contract_Name() {
		return sales_Contract_Name;
	}

	public void setSales_Contract_Name(String sales_Contract_Name) {
		this.sales_Contract_Name = sales_Contract_Name;
	}

	public Integer getApprovalDm() {
		return approvalDm;
	}

	public void setApprovalDm(Integer approvalDm) {
		this.approvalDm = approvalDm;
	}

	public String getTask_Describe() {
		return task_Describe;
	}

	public void setTask_Describe(String task_Describe) {
		this.task_Describe = task_Describe;
	}

	public String getApprovalName() {
		return approvalName;
	}

	public void setApprovalName(String approvalName) {
		this.approvalName = approvalName;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Boolean getIs_xsddprcedf() {
		return is_xsddprcedf;
	}

	public void setIs_xsddprcedf(Boolean is_xsddprcedf) {
		this.is_xsddprcedf = is_xsddprcedf;
	}

	public String getTask_des() {
		return task_des;
	}

	public void setTask_des(String task_des) {
		this.task_des = task_des;
	}

	public Double getHtje() {
		return htje;
	}

	public void setHtje(Double htje) {
		this.htje = htje;
	}

	public Boolean getIs_wcsk() {
		return is_wcsk;
	}

	public void setIs_wcsk(Boolean is_wcsk) {
		this.is_wcsk = is_wcsk;
	}

	public Boolean getIs_delivery() {
		return is_delivery;
	}

	public void setIs_delivery(Boolean is_delivery) {
		this.is_delivery = is_delivery;
	}

	@Override
	public String toString() {
		return "ERP_Sales_Contract [sales_Contract_Id=" + sales_Contract_Id + ", contract_Code=" + contract_Code
				+ ", sales_Contract_Name=" + sales_Contract_Name + ", customer=" + customer + ", qd_Date=" + qd_Date
				+ ", remarks=" + remarks + ", zljsyq=" + zljsyq + ", jhsjjdd=" + jhsjjdd + ", ysjfy=" + ysjfy
				+ ", fkfs=" + fkfs + ", wyzr=" + wyzr + ", wjsy=" + wjsy + ", htfs=" + htfs + ", sxrq=" + sxrq
				+ ", supplier=" + supplier + ", unitAddress=" + unitAddress + ", agent=" + agent + ", cus_Address="
				+ cus_Address + ", approvalDm=" + approvalDm + ", task_Describe=" + task_Describe + ", status=" + status
				+ ", is_xsddprcedf=" + is_xsddprcedf + ", task_des=" + task_des + ", htje=" + htje + ", is_wcsk="
				+ is_wcsk + ", is_delivery=" + is_delivery + ", customerName=" + customerName + ", supplierName="
				+ supplierName + ", fjsx=" + fjsx + ", approvalName=" + approvalName + ", taskId=" + taskId + "]";
	}

}
