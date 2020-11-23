package com.ebook.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ebook.pojo.Category;
import com.ebook.pojo.Entry;
import com.ebook.service.EntryService;

@Controller
@RequestMapping("/ec")
public class EntryController {
	
	//http://localhost:8080/290ebook/ec/EntryFindPage.html
	//http://localhost:8080/290ebook/ec/Vue_EntryAddPage.html
	//http://localhost:8080/290ebook/ec/Vue_EntryFindPage.html
	
	//http://localhost:8080/290ebook/ec/vue_entryadd2.html
	//Vue运行地址：http://localhost:8080/290ebook/ec/Vue_EntryFindPage2.html
	
	//打开查询页面
	@RequestMapping("/Vue_EntryFindPage2.html")
	public String Vue_EntryFindPage2(){
		return "vue_entryfind2";
	}
	
	@RequestMapping("/vue_entryadd2.html")
	public String vue_entryadd2(){
		return "vue_entryadd2";
	}
	
	//保存方法  
	@RequestMapping("/Vue_EntryAdd2.html")
	@ResponseBody
	public Object Vue_EntryAdd2(@RequestBody Entry obj){
		int count=objService.addEntryService(obj);
		//模拟代码错误
		int i = 100/0;
		//模拟冗余代码
		int a = 100;
		a=200;

		return count;
	}
	
	@Autowired
	private EntryService objService;
	
	@RequestMapping("/Vue_EntryAddPage.html")
	public String Vue_EntryAddPage(){
		return "vue_entryadd1";
	}
	
	//保存方法   表单方式
	@RequestMapping("/Vue_EntryAdd.html")
	@ResponseBody
	public Object Vue_EntryAdd(@RequestBody Entry obj){
		int count=objService.addEntryService(obj);
		return count;
	}
	
	//打开查询页面
	@RequestMapping("/Vue_EntryFindPage.html")
	public String Vue_EntryFindPage(){
		return "vue_entryfind";
	}
	
	@RequestMapping("/findEntryVue.html")
	@ResponseBody
	public Object findEntryVue(@RequestBody String  categoryid){
		System.out.print(categoryid);
		JSONObject object = JSONObject.parseObject(categoryid);
		int categoryid2 = object.getIntValue("categoryid");
		List<Entry> listEntry=objService.findEntryPagingVue(categoryid2);
		return JSON.toJSON(listEntry);
	}
	
	@RequestMapping("/delEntryIdVue.html")
	@ResponseBody
	public Object delEntryIdVue(@RequestBody String  categoryid){
		System.out.print(categoryid);
		JSONObject object = JSONObject.parseObject(categoryid);
		int categoryid2 = object.getIntValue("categoryid");
		int count=objService.delEntryService(categoryid2);
		return count;
	}
	
	//==========================================================
	
	//打开添加页面
	@RequestMapping("/EntryAddPage.html")
	public String EntryAddPage(){
		return "EntryAdd";
	}
	
	//提取图书分类
	@RequestMapping("/findCategoryController.html")
	@ResponseBody
	public Object findCategoryController(){
		List<Category>  listCategory=objService.findCategoryListService();
		return listCategory;
	}
	
	//保存方法   表单方式
	@RequestMapping("/EntryAdd.html")
	public String EntryAdd(Entry obj,Model model){
		int count=objService.addEntryService(obj);
		model.addAttribute("message", "添加成功");
		return "EntryAdd";
	}
	
	
	
	//分页查询
	@RequestMapping("/findEntryPagingController.html")
	public String findEntryPagingController(@RequestParam(value="cid",required=false)Integer cid,
			@RequestParam(value="yema",required=false)Integer yema,
			@RequestParam(value="size",required=false)Integer size,
			Model model){
			if(yema==null){ //如果页码为空则默认为第1页
				yema=1; 
			}
			if(size==null){ //如果页面条数为空默认为每页显示5条
				size=5; 
			}
			if(cid==null){ 
				cid=0; 
			}
			//计算出有多少页    总条数/每页显示的条数
			int count=objService.findEntryCountService(cid);
			int pageCount=count%size==0?count/size:count/size+1;
			//根据页码计算从哪一条数所开始显示(yema-1)*size 
			List<Entry> listEntry=objService.findEntryPagingService(cid,(yema-1)*size, size);
			
			model.addAttribute("pageCount", pageCount);//总页面
			model.addAttribute("listEntry", listEntry);//每页显示的数据
			
		return "EntryFind";
	}
	
	//打开查询页面
	@RequestMapping("/EntryFindPage.html")
	public String EntryFindPage(){
		return "EntryFind";
	}
	
	@RequestMapping("/delEntryId.html")
	public String delEntryId(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="id",required=false)Integer id,Model model) throws IOException{
		int count=objService.delEntryService(id);
		if(count>0){
			UtilMessage.message(request, response, "删除成功");
		}else{
			UtilMessage.message(request, response, "删除失败");
		}
		return "EntryFind";
	}
	
	//打开修改页面
	@RequestMapping("/FindIdPage.html")
	public String FindIdPage(Model model,@RequestParam(value="id",required=false)Integer id){
		System.out.println("-->FindIdPage");
		Entry objEntry=objService.findEntryIdService(id);
		System.out.println("-->FindIdPage:"+objEntry.getTitle());
		model.addAttribute("objEntry", objEntry);
		return "EntryUpd";
	}
	
	
	//保存方法   表单方式  修改
	@RequestMapping("/EntryUpd.html")
	public String EntryUpd(Entry obj,Model model){
		int count=objService.updEntryService(obj);
		model.addAttribute("message", "修改成功");
		return "EntryUpd";
	}
	
}
