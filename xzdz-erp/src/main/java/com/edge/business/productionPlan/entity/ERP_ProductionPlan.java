package com.edge.business.productionPlan.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 生产计划实体类
 * 
 * @author NingCG
 *
 */
public class ERP_ProductionPlan {
	private Integer row_Id;// 主键
	private String plan_Code;// 生产计划号
	private Integer plan_Department;// 生产部门
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date plan_Date;// 下订单日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date plan_BeginDate;// 计划开工日期
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date plan_EndDate;// 计划完工日期
	private Integer sales_Contract_Id;// 销售订单Id
	private String taskId;// 任务id
	private String status;// 计划状态

	// 辅助属性
	private String plan_DepartmentName;// 部门名称
	private String xddrq;// 下订单日期
	private String jhkgrq;// 计划开工日期
	private String jhwgrq;// 计划完工日期

	public Integer getRow_Id() {
		return row_Id;
	}

	public void setRow_Id(Integer row_Id) {
		this.row_Id = row_Id;
	}

	public String getPlan_Code() {
		return plan_Code;
	}

	public void setPlan_Code(String plan_Code) {
		this.plan_Code = plan_Code;
	}

	public Integer getPlan_Department() {
		return plan_Department;
	}

	public void setPlan_Department(Integer plan_Department) {
		this.plan_Department = plan_Department;
	}

	public Date getPlan_Date() {
		return plan_Date;
	}

	public void setPlan_Date(Date plan_Date) {
		this.plan_Date = plan_Date;
	}

	public Date getPlan_BeginDate() {
		return plan_BeginDate;
	}

	public void setPlan_BeginDate(Date plan_BeginDate) {
		this.plan_BeginDate = plan_BeginDate;
	}

	public Date getPlan_EndDate() {
		return plan_EndDate;
	}

	public void setPlan_EndDate(Date plan_EndDate) {
		this.plan_EndDate = plan_EndDate;
	}

	public Integer getSales_Contract_Id() {
		return sales_Contract_Id;
	}

	public void setSales_Contract_Id(Integer sales_Contract_Id) {
		this.sales_Contract_Id = sales_Contract_Id;
	}

	public String getTaskId() {
		return taskId;
	}

	public void setTaskId(String taskId) {
		this.taskId = taskId;
	}

	public String getPlan_DepartmentName() {
		return plan_DepartmentName;
	}

	public void setPlan_DepartmentName(String plan_DepartmentName) {
		this.plan_DepartmentName = plan_DepartmentName;
	}

	public String getXddrq() {
		return xddrq;
	}

	public void setXddrq(String xddrq) {
		this.xddrq = xddrq;
	}

	public String getJhkgrq() {
		return jhkgrq;
	}

	public void setJhkgrq(String jhkgrq) {
		this.jhkgrq = jhkgrq;
	}

	public String getJhwgrq() {
		return jhwgrq;
	}

	public void setJhwgrq(String jhwgrq) {
		this.jhwgrq = jhwgrq;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ERP_ProductionPlan [row_Id=" + row_Id + ", plan_Code=" + plan_Code + ", plan_Department="
				+ plan_Department + ", plan_Date=" + plan_Date + ", plan_BeginDate=" + plan_BeginDate
				+ ", plan_EndDate=" + plan_EndDate + ", sales_Contract_Id=" + sales_Contract_Id + ", taskId=" + taskId
				+ ", status=" + status + ", plan_DepartmentName=" + plan_DepartmentName + ", xddrq=" + xddrq
				+ ", jhkgrq=" + jhkgrq + ", jhwgrq=" + jhwgrq + "]";
	}

}
