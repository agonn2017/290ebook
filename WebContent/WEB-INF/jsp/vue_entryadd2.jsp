<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<select id="categoryid" name="categoryid" v-model="entry.categoryid">
					<option v-for="aaa in categoryid_array" v-bind:value="aaa.id">{{aaa.name}}</option>
				</select>
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-2">图书名称<span style="color:red;">*</span></div>
			<div class="col-sm-2">
				<input type="text" id="title" name="title" v-model="entry.title">
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-2">摘要</div>
			<div class="col-sm-5">
				<textarea  id="summary" name="summary" cols="50" rows="5" v-model="entry.summary"></textarea>
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-2">上传人</div>
			<div class="col-sm-2">
				<input type="text" id="uploaduser" name="uploaduser" v-model="entry.uploaduser">
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-2">上传时间</div>
			<div class="col-sm-2">
				<input type="date" id="createdate" name="createdate" v-model="entry.createdate">
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-4">
				<button class="btn btn-success btn-sm" id="btnSave" v-on:click="add">
					<span class="glyphicon glyphicon-ok"></span> 保存
				</button>
			</div>
		</div>
	</div>
</body>
<script >
	var vm=new Vue({
		el:"#div1",
		data:{
			categoryid_array:[],
			entry:{
				categoryid:0,
				title:'',
				summary:'',
				uploaduser:'',
				createdate:''
			}
		},
		methods:{
			get_categoryid:function(){
				axios.get('findCategoryController.html')
				.then(function(response){ //  response=>
					vm.categoryid_array=response.data;
				})
			},
			add:function(){
				axios.post("Vue_EntryAdd2.html",vm.entry,{
					headers: {
						"Content-Type": "application/json;charset=utf-8" //头部信息
					}
				}).then(response=>{ 
					if(response.data>0){
						alert("成功");
					}else{
						alert("失败");
					}
				}).catch(error=>{
					alert("错误");
				})
				
			}
		},
		mounted:function(){
			this.get_categoryid();
		}
	})
</script>
</html>