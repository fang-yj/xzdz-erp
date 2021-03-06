package com.edge.stocks.material.rk.service.inter;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.edge.stocks.material.rk.entity.ERP_MatStockRecord_QueryVo;
import com.edge.stocks.material.rk.entity.ERP_Material_Stocks_Record;

public interface Mat_StockRecordService {

	// 新增入库记录
	public void saveStockRecord(ERP_Material_Stocks_Record stockRecord);

	// 查询该成品的入库总数量
	public Integer queryMatRkNumber(Integer material);

	// 分页查询该材料
	public List<ERP_Material_Stocks_Record> recordList(ERP_MatStockRecord_QueryVo vo);

	// 查询该材料的总数量
	public Integer recordCount(ERP_MatStockRecord_QueryVo vo);

	// 根据Id获得材料入库对象
	public ERP_Material_Stocks_Record queryMateStockRecordById(Integer record_Id);

	// ajax查询所有的材料
	public JSONArray allClList();

	// ajax查询所有的材料库位
	public JSONArray allClKwList();

	// 根据材料主键获得材料入库记录集合
	public List<ERP_Material_Stocks_Record> queryStockRecordByMaterialId(Integer material);

	// 根据Id删除入库记录
	public void deleteStockRecord(Integer record_Id);
}
