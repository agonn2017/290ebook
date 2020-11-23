package com.ebook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ebook.dao.EntryMapper;
import com.ebook.pojo.Category;
import com.ebook.pojo.Entry;
import com.ebook.service.EntryService;

@Service
public class EntryServiceImpl implements EntryService {

	
	@Autowired
	private EntryMapper objMapper;
	
	@Override
	public int addEntryService(Entry obj) {
		return objMapper.addEntry(obj);
	}

	@Override
	public List<Category> findCategoryListService() {
		return objMapper.findCategoryList();
	}

	@Override
	public int findEntryCountService(int cid) {
		return objMapper.findEntryCount(cid);
	}

	@Override
	public List<Entry> findEntryPagingService(int cid, int start, int size) {
		return objMapper.findEntryPaging(cid, start, size);
	}

	@Override
	public int delEntryService(int cid) {
		return objMapper.delEntry(cid);
	}

	@Override
	public Entry findEntryIdService(int cid) {
		return objMapper.findEntryId(cid);
	}

	@Override
	public int updEntryService(Entry obj) {
		return objMapper.updEntry(obj);
	}

	@Override
	public List<Entry> findEntryPagingVue(int cid) {
		return objMapper.findEntryPagingVue(cid);
	}

	
	
}
