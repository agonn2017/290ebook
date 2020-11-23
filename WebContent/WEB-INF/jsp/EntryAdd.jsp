<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/bots335/css/bootstrap.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery-2.1.1.js"></script>
<script type="text/javascript">
	function check(){
		var title = $("#title").val();
		if(title == null || title == ""){
			alert("书名不能为空");
			return false;
		}
		return true;
	}
</script>
</head>
<body onload="show1();">
<form action="${pageContext.request.contextPath}/ec/EntryAdd.html" method="post"  
			onsubmit="return check()">

	<div class="container">
		<div class="row">
			<div class="col-sm-2">图书分类</div>
			<div class="col-sm-2">
				<select id="categoryid" name="categoryid">
					
				</select>
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-2">图书名称<span style="color:red;">*</span></div>
			<div class="col-sm-2">
				<input type="text" id="title" name="title">
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-2">摘要</div>
			<div class="col-sm-5">
				<textarea  id="summary" name="summary" cols="50" rows="5"></textarea>
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-2">上传人</div>
			<div class="col-sm-2">
				<input type="text" id="uploaduser" name="uploaduser">
			</div>
		</div>
		&nbsp;
		<div class="row">
			<div class="col-sm-2">上传时间</div>
			<div class="col-sm-2">
				<input type="date" id="createdate" name="createdate">
			</div>
		</div>
		&nbsp;
		<div class="row">${message}
			<div class="col-sm-4">
				<button class="btn btn-success btn-sm" id="btnSave" type="submit">
					<span class="glyphicon glyphicon-ok"></span> 保存
				</button>
			</div>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
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
				$("#categoryid").html(h);
			},
			error:function(){
				alert("错误！");
			}
		});
	}
</script>
</html>