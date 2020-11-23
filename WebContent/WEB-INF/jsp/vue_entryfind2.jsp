<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/bots335/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/vue.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/axios.min.js"></script>

</head>
<body>

			<div class="container" id="div1">
			<div class="row">
				<div class="col-sm-2">图书分类</div>
				<div class="col-sm-2">
					<select id="categoryid" name="categoryid" v-model="categoryid">
						<option value="1">小说</option>
						<option value="2">文学</option>
						<option value="3">传记</option>
					</select>
				</div>
				<div class="col-sm-2">
					<button class="btn btn-info btn-xs" id="btnFind" @click="find">
						<span class="glyphicon glyphicon-search"></span> 查询
					</button>
					<a href="${pageContext.request.contextPath}/ec/EntryAddPage.html" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-plus"></span> 添加
					</a> 
				</div>
			</div>
			&nbsp;
			<div class="row">
				<div class="col-sm-12">
					<table class="table table-bordered table-condensed table-hover">
						<thead>
							<tr class="success">
								<th>学生编号</th>
								<th>图书分类</th>
								<th>图书名称</th>
								<th>上传人</th>
								<th>上传时间</th>
								<th>图书介绍</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="tb">	
							
								<tr v-for="a in engory_array">
								  <td>{{a.id}}</td>
							      <td>{{a.categoryid}}</td>
							      <td>{{a.title}}</td>
							      <td>{{a.uploaduser}}</td>
							      <td>{{a.createdate}}</td>
							      <td>{{a.summary}}</td>
							      <td>	<button class='btn btn-info btn-xs' id='btnUpd' onclick='upd({{a.id}})' type="button">
											<span class='glyphicon glyphicon-pencil'></span> 修改
										</button>
									 	<button class='btn btn-danger btn-xs' id='btnDel' @click='del(a.id)' type="button">
											<span class='glyphicon glyphicon-remove'></span> 删除
										</button>
								</td>
							    </tr>
						   				
						</tbody>
					</table>
					
				</div>
			</div>
		</div>

</body>
<script >
	var vm=new Vue({
		el:"#div1",
		data:{
			categoryid:0,
			engory_array:[]
		},
		methods:{
			find:function(){
				axios.post("findEntryVue.html",
						{"categoryid":vm.categoryid})
						.then(function(response){
							vm.engory_array=response.data;
						})
			},
			del:function(bbb){
				var bln=confirm("删除是不可恢复的，你确认要删除吗？");
                if(bln==true){ 
					axios.post("delEntryIdVue.html",
						{"categoryid":bbb})
						.then(function(response){
							if(response.data>0){
					        	alert("删除成功！");
					        }else{
					        	alert("删除失败！");
					        }
					})
                }
			}
		}
	})
</script>
</html>