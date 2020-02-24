package com.edge.business.listener.flowListener.th;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoader;

import com.edge.business.purchase.entity.ERP_Purchase_Order;
import com.edge.business.purchase.service.inter.PurchaseOrderService;
import com.edge.business.sale.entity.ERP_Sales_Contract;
import com.edge.business.sale.service.inter.ERP_Sales_ContractService;

/**
 * 材料检验退回到领导审核,并设置采购合同的状态
 * 
 * @author NingCG
 *
 */
public class TH_cljy_ldsh implements ExecutionListener {

	public void notify(DelegateExecution execution) throws Exception {
		execution.setVariable("url", "leadershipAudit/initEditLeadershipAudit.do");
		// 获取businessKey
		String businessKey = execution.getBusinessKey();
		// 得到业务数据主键值
		String id = businessKey.substring(businessKey.indexOf(".") + 1);
		ApplicationContext ac = ContextLoader.getCurrentWebApplicationContext();
		// 获取ERP_Sales_ContractService
		ERP_Sales_ContractService contractService = (ERP_Sales_ContractService) ac
				.getBean("ERP_Sales_ContractServiceImpl");
		// 获取销售合同
		ERP_Sales_Contract contract = contractService.queryContractById(Integer.parseInt(id.trim()));
		// 获取PurchaseOrderService
		PurchaseOrderService purchaseOrderService = (PurchaseOrderService) ac.getBean("purchaseOrderServiceImpl");
		// 根据销售合同获得采购合同对象
		ERP_Purchase_Order purchaseOrder = purchaseOrderService
				.queryPurchaseOrderByXsht(contract.getSales_Contract_Id());
		// 编辑采购合同
		purchaseOrder.setStatus("已接单");
		purchaseOrder.setIs_Availability(false);
		purchaseOrderService.editPurchaseOrder(purchaseOrder);
	}

}
