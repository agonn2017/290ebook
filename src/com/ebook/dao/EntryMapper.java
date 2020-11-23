package com.ebook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ebook.pojo.Category;
import com.ebook.pojo.Entry;

public interface EntryMapper {

	/**
	 * 添加图书信息
	 * @param obj
	 * @return 1成功 0失败
	 */
	public int addEntry(Entry obj);
	
	/**
	 * 查询图书分类
	 * @return
	 */
	public List<Category> findCategoryList();
	
	/**
	 * 获取记录总条数   分页
	 * @param cid
	 * @return
	 */
	public int findEntryCount(@Param("cid")int cid);
	
	/**
	 * 分页查询
	 * @param cid 查询条件  根据图书分类查询信息
	 * @param start  分页  从哪一条数据开始显示（显示第几页）
	 * @param size 分页 每页显示多少条数据
	 * @return
	 */
	public List<Entry> findEntryPaging(@Param("cid")int cid,
			@Param("start")int start,
			@Param("size")int size);
	
	/**
	 * 删除
	 * @param cid
	 * @return
	 */
	public int delEntry(@Param("cid")int cid);
	
	/**
	 * 根据ID查询数据
	 * @param cid
	 * @return
	 */
	public Entry findEntryId(@Param("cid")int cid);
	
	
	/**
	 * 修改图书信息
	 * @param obj
	 * @return 1成功 0失败
	 */
	public int updEntry(Entry obj);
	
	public List<Entry> findEntryPagingVue(@Param("cid")int cid);
}
