package com.edge.business.purchase.dao;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONArray;
import com.edge.business.purchase.entity.ERP_Purchase_Order;

public interface PurchaseOrderDao {

	// 新增采购订单
	public void savePurchaseOrder(ERP_Purchase_Order purchaseOrder);

	// ajax加载所有的供货单位
	public JSONArray allSupplier();

	// 合同编号生成
	public String htbh(@Param("pur_Code") String pur_Code);
	
	//查询新增后的采购订单主键
	public Integer queryMaxOrderId();
	
	//根据销售合同获取采购合同
	public ERP_Purchase_Order queryPurchaseOrderByXsht(@Param("sales_Contract_Id")Integer sales_Contract_Id);
	
	//编辑采购合同
	public void editPurchaseOrder(ERP_Purchase_Order purchaseOrder);
}
