<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>商城网上商城</title>
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/style1.css">
		<link rel="stylesheet" type="text/css" href="${ctx}/static/css/css.css" />
		<script type="text/javascript" src="${ctx}/static/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var region = $("#region");
				var address = $("#address");
				var number_this = $("#number_this");
				var name = $("#name_");
				var phone = $("#phone");
				$("#sub_setID").click(function() {
					var input_out = $(".input_style");
					for (var i = 0; i <= input_out.length; i++) {
						if ($(input_out[i]).val() == "") {
							$(input_out[i]).css("border", "1px solid red");
							
							return false;
						} else {
							$(input_out[i]).css("border", "1px solid #cccccc");
						}
					}
				});
				var span_momey = $(".span_momey");
				var b = 0;
				for (var i = 0; i < span_momey.length; i++) {
					b += parseFloat($(span_momey[i]).html());
				}
				var out_momey = $(".out_momey");
				out_momey.html(b);
				$(".shade_content").hide();
				$(".shade").hide();
				$('.nav_mini ul li').hover(function() {
					$(this).find('.two_nav').show(100);
				}, function() {
					$(this).find('.two_nav').hide(100);
				})
				$('.left_nav').hover(function() {
					$(this).find('.nav_mini').show(100);
				}, function() {
					$(this).find('.nav_mini').hide(100);
				})
				$('#jia').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) + 1);
				})
				$('#jian').click(function() {
					$('input[name=num]').val(parseInt($('input[name=num]').val()) - 1);
				})
				$('.Caddress .add_mi').click(function() {
					$(this).css('background', 'url("static/image/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("static/image/mail.jpg") no-repeat')
				})
			})
			var x = Array();

			function func(a, b) {
				x[b] = a.html();
				alert(x)
				a.css('border', '2px solid #f00').siblings('.min_mx').css('border', '2px solid #ccc');
			}

			function onclick_close() {
				var shade_content = $(".shade_content");
				var shade = $(".shade");
				if (confirm("确认关闭么！此操作不可恢复")) {
					shade_content.hide();
					shade.hide();
				}
			}

			function onclick_open() {
				$(".shade_content").show();
				$(".shade").show();
				var input_out = $(".input_style");
				for (var i = 0; i <= input_out.length; i++) {
					if ($(input_out[i]).val() != "") {
						$(input_out[i]).val("");
					}
				}
			}

			function onclick_remove(r) {
				if (confirm("确认删除么！此操作不可恢复")) {
					var out_momey = $(".out_momey");
					var input_val = $(r).parent().prev().children().eq(1).val();
					var span_html = $(r).parent().prev().prev().children().html();
					var out_add = parseFloat(input_val).toFixed(2) * parseFloat(span_html).toFixed(2);
					var reduce = parseFloat(out_momey.html()).toFixed(2)- parseFloat(out_add).toFixed(2);
					console.log(parseFloat(reduce).toFixed(2));
					out_momey.text(parseFloat(reduce).toFixed(2))
					$(r).parent().parent().remove();
				}
			}

			function onclick_btnAdd(a) {
				var out_momey = $(".out_momey");
				var input_ = $(a).prev();
				var input_val = $(a).prev().val();
				var input_add = parseInt(input_val) + 1;
				input_.val(input_add);
				var btn_momey = parseFloat($(a).parent().prev().children().html());
				var out_momey_float = parseFloat(out_momey.html()) + btn_momey;
				out_momey.text(out_momey_float.toFixed(2));
			}

			function onclick_reduce(b) {
				var out_momey = $(".out_momey");
				var input_ = $(b).next();
				var input_val = $(b).next().val();
				if (input_val <= 1) {
					alert("商品个数不能小于1！")
				} else {
					var input_add = parseInt(input_val) - 1;
					input_.val(input_add);
					var btn_momey = parseFloat($(b).parent().prev().children().html());
					var out_momey_float = parseFloat(out_momey.html()) - btn_momey;
					out_momey.text(out_momey_float.toFixed(2));
				}
			}
		</script>
	</head>

	<body>
		<div class="Caddress">
			
			<div class="add_mi">
				<p style="border-bottom:1px dashed #ccc;line-height:28px;">${user.username }</p>
				<p>${user.address }</p>
			</div>
			
		</div>

		<div class="shopping_content">
			<div class="shopping_table">
				<table border="1" bordercolor="#cccccc" cellspacing="0" cellpadding="0" style="width: 100%; text-align: center;">
					<tr>
						<th>商品图片</th>
						<th>商品名称</th>
						<th>商品属性</th>
						<th>商品价格</th>
						<th>商品数量</th>
						<th>商品操作</th>
					</tr>
					<c:forEach items="${list}" var="cart" > 
					<tr id="<c:out  value="${cart.id}"/>">
						<td>
							<a><img src="${ctx}/static/image/${cart.bookimage}" /></a>
						</td>
						<td><span>${cart.bookname}</span></td>
						<td>
							<div class="">
								<span id="">作者</span>：<span>${cart.bookauthor}</span>
							</div>
						</td>
						<td>
							<span class="span_momey">${cart.bookprice }</span>
						</td>					
						<td>
						<form action="addorincrese?bookid=${cart.bookid }&userid=${cart.userid }" method="post">
							<input class="momey_input" type=""  name="num" id="" value="${cart.quantity}" />
							<input type="submit" value="提交"/>
						</form>
						</td>
						<td>
						<form action="delete?bookid=${cart.bookid}" method="post">
							<input type="submit" value="删除" class="btn_r" >
						</form>
						</td>	
					</tr>
					</c:forEach>  
				</table>
				<div class="" style="width: 100%; text-align: right; margin-top: 10px;">
					<div class="div_outMumey" style="float: left;">
						总价：${count }<span class="out_momey"></span>
					</div>
					<button class="btn_closing">确认地址无误</button>
				</div>
			</div>
		</div>

		<div class="shade">
		</div>
		<div class="shade_content">
			<div class="col-xs-12 shade_colse">
				<button onclick="javascript:onclick_close();">x</button>
			</div>
			
		</div>

	</body>

</html>