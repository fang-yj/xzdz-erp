package com.edge.business.productionPlan.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edge.business.productionPlan.entity.ProductionPlanOrder;

public interface ProductionPlanOrderDao {

	// 新增生产计划成品项
	public void saveProductionPlanOrder(ProductionPlanOrder productionPlanOrder);

	// 根据生产计划获得生产计划成品项集合
	public List<ProductionPlanOrder> queryPlanOrderByPlanId(@Param("productionPlanId") Integer productionPlanId);

	// 编辑生产计划成品项
	public void editProductionPlanOrder(ProductionPlanOrder productionPlanOrder);

	// 根据Id删除生产计划成品项
	public void deleteProductionPlanOrderById(@Param("row_Id") Integer row_Id);

}
