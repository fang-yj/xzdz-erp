package com.edge.business.sale.dao;

import com.edge.business.sale.entity.ERP_Sales_Contract_Order;

public interface ERP_Sales_Contract_OrderDao {
	// 新增货物清单
	public void saveContract_Order(ERP_Sales_Contract_Order order);
}
