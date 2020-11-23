package com.ebook.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ebook.pojo.Category;
import com.ebook.pojo.Entry;

public interface EntryService {

	/**
	 * 添加图书信息
	 * @param obj
	 * @return 1成功 0失败
	 */
	public int addEntryService(Entry obj);
	
	/**
	 * 查询图书分类
	 * @return
	 */
	public List<Category> findCategoryListService();
	
	/**
	 * 获取记录总条数   分页
	 * @param cid
	 * @return
	 */
	public int findEntryCountService(int cid);
	
	/**
	 * 分页查询
	 * @param cid 查询条件  根据图书分类查询信息
	 * @param start  分页  从哪一条数据开始显示（显示第几页）
	 * @param size 分页 每页显示多少条数据
	 * @return
	 */
	public List<Entry> findEntryPagingService(int cid,
			int start,
			int size);
	
	/**
	 * 删除
	 * @param cid
	 * @return
	 */
	public int delEntryService(int cid);
	
	/**
	 * 根据ID查询数据
	 * @param cid
	 * @return
	 */
	public Entry findEntryIdService(int cid);
	
	/**
	 * 修改图书信息
	 * @param obj
	 * @return 1成功 0失败
	 */
	public int updEntryService(Entry obj);
	

	public List<Entry> findEntryPagingVue(int cid);
}
