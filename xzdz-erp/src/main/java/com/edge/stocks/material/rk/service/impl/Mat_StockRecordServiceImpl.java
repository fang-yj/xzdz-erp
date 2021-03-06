package com.edge.stocks.material.rk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.edge.stocks.material.rk.dao.Mat_StockRecordDao;
import com.edge.stocks.material.rk.entity.ERP_MatStockRecord_QueryVo;
import com.edge.stocks.material.rk.entity.ERP_Material_Stocks_Record;
import com.edge.stocks.material.rk.service.inter.Mat_StockRecordService;

/**
 * 出入库记录业务逻辑层
 * 
 * @author NingCG
 *
 */
@Service
public class Mat_StockRecordServiceImpl implements Mat_StockRecordService {
	@Resource
	private Mat_StockRecordDao stockRecordDao;

	// 新增入库记录
	public void saveStockRecord(ERP_Material_Stocks_Record stockRecord) {
		stockRecordDao.saveStockRecord(stockRecord);
	}

	// 查询该成品入库的总数量
	public Integer queryMatRkNumber(Integer material) {
		return stockRecordDao.queryMatRkNumber(material);
	}

	// 分页查询该材料
	public List<ERP_Material_Stocks_Record> recordList(ERP_MatStockRecord_QueryVo vo) {
		return stockRecordDao.recordList(vo);
	}

	// 查询该材料的总数量
	public Integer recordCount(ERP_MatStockRecord_QueryVo vo) {
		return stockRecordDao.recordCount(vo);
	}

	// 根据Id获得材料入库对象
	public ERP_Material_Stocks_Record queryMateStockRecordById(Integer record_Id) {
		return stockRecordDao.queryMateStockRecordById(record_Id);
	}

	// ajax查询所有的材料
	public JSONArray allClList() {
		return stockRecordDao.allClList();
	}

	// ajax查询所有的材料库位
	public JSONArray allClKwList() {
		return stockRecordDao.allClKwList();
	}

	// 根据材料主键获得材料入库记录集合
	public List<ERP_Material_Stocks_Record> queryStockRecordByMaterialId(Integer material) {
		return stockRecordDao.queryStockRecordByMaterialId(material);
	}

	// 根据Id删除入库记录
	public void deleteStockRecord(Integer record_Id) {
		stockRecordDao.deleteStockRecord(record_Id);
	}

}
