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
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-2.1.1.js"></script>
</head>
<body onload="show1();">

	<form action="${pageContext.request.contextPath}/ec/findEntryPagingController.html" method="post">
	
	
		<div class="container">
			<div class="row">
				<div class="col-sm-2">图书分类</div>
				<div class="col-sm-2">
					<select id="cid" name="cid">
						
					</select>
				</div>
				<div class="col-sm-2">
					<button class="btn btn-info btn-xs" id="btnFind">
						<span class="glyphicon glyphicon-search"></span> 查询
					</button>
					<a href="${pageContext.request.contextPath}/ec/EntryAddPage.html" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-plus"></span> 添加
					</a> 
				</div>
			</div>
			&nbsp;${aaa}
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
							<c:forEach var="a" items="${listEntry}">
								<tr>
								  <td>${a.id}</td>
							      <td>${a.categoryid}</td>
							      <td>${a.title}</td>
							      <td>${a.uploaduser}</td>
							      <td>${a.createdate}</td>
							      <td>${a.summary}</td>
							      <td>	<button class='btn btn-info btn-xs' id='btnUpd' onclick="upd(${a.id})" type="button">
											<span class='glyphicon glyphicon-pencil'></span> 修改
										</button>
									 	<button class='btn btn-danger btn-xs' id='btnDel' onclick="del(${a.id})" type="button">
											<span class='glyphicon glyphicon-remove'></span> 删除
										</button>
								</td>
							    </tr>
						    </c:forEach>					
						</tbody>
					</table>
					<!-- 分页 -->
					<ul class="pagination" id="page2">
						<c:forEach var="a" begin="1" end="${pageCount}" step="1">
						 	<li><a href="${pageContext.request.contextPath}/ec/findEntryPagingController.html?yema=${a}">${a}</a></li>
						</c:forEach>		
					</ul>
					
				</div>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">

	function upd(id){
		window.location.href="${pageContext.request.contextPath}/ec/FindIdPage.html?id="+id;
	}

	function del(id){
		window.location.href="${pageContext.request.contextPath}/ec/delEntryId.html?id="+id;
	}
	function show1(){
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/ec/findCategoryController.html",
			data:{
				
			},
			dataType:"JSON",
			success:function(req){
				//var a=eval('('+req+')'); alert(a);
				var h="<option value=''>请选择...</option>";
				$.each(req,function(a,b){
					h=h+"<option value='"+b.id+"'>"+b.name+"</option>";
				});
				$("#cid").html(h);
			},
			error:function(){
				alert("错误！");
			}
		});
	}
</script>
</html>