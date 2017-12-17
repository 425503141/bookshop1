<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>deliels</title>
<meta name="keywords" content="首页" />
<meta name="description" content="首页" />
 <link rel="stylesheet" type="text/css" href="${ctx}/static/css/normalize.css"/>
 <script type="text/javascript" src="${ctx}/static/js/jquery-1.9.1.min.js"></script>
 <script src="${ctx}/static/js/common.js" type="text/javascript" charset="utf-8"></script>
   <script type="text/javascript">
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,//宽度,该版本中请把宽高填写成一样
		  "boxh":400,//高度,该版本中请把宽高填写成一样
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
  });
</script>
</head>
<body>
<%  
        String name = request.getParameter("name"); 
        String price = request.getParameter("price"); 
        String image = request.getParameter("image");
        String id = request.getParameter("id");
        %>
 <div class="showall">
	                <!--left -->
	                <div class="showbot">
                    <div id="showbox">
                        <img src="${ctx}/static/image/<%= image%>" width="400" height="400" />
                        <img src="images/photos/img02.png" width="400" height="400" />
                        <img src="images/photos/img03.png" width="400" height="400" />
                        <img src="images/photos/img04.png" width="400" height="400" />
                        <img src="images/photos/img05.png" width="400" height="400" />
                        <img src="images/photos/img06.png" width="400" height="400" />
                        
                    </div><!--展示图片盒子-->
                        <div id="showsum">
                        	<!--展示图片里边-->
                        </div>
                        <p class="showpage">
                            <a href="javascript:void(0);" id="showlast"> < </a>
                            <a href="javascript:void(0);" id="shownext"> > </a>
                        </p>
                        </div>
                        <!--conet -->
                        <div class="tb-property">
                        <div class="top_shop_cur"><a href="cart.jsp?username=${user.username }"><img src="${ctx}/static/image/top_shop_cur.jpg" alt="shopping car" /></a></div>
                        	<div class="tr-nobdr">
                        		<h3><%=name %></h3>
                        	</div>
                        		<div class="txt">
                        			<span class="nowprice">￥<%=price %><a href=""></a></span>
                        			<div class="cumulative">
                        				<span class="number ty1">累计售出<br /><em id="add_sell_num_363">370</em></span>
                        				<span class="number tyu">累计评价<br /><em id="add_sell_num_363">25</em></span>
                        			</div>
                        		</div>
                        	<div class="txt-h">
                        		<span class="tex-o">分类</span>
                        		<ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
                        			<li><a title="红色36g" href="">红色36g</a></li>
                        			<li><a title="蓝色16g" href="">红色36g</a></li>
                        		<!--<li><a title="红色36g" href="">红色36g</a></li>
                        			<li><a title="蓝色16g" href="">红色36g</a></li>-->
                        		</ul>
                        	</div>
                        	<script>
                        	$(document).ready(function(){
                          	var t = $("#text_box");
                        	$('#min').attr('disabled',true);
                            	$("#add").click(function(){    
                               	 t.val(parseInt(t.val())+1)
                               	 if (parseInt(t.val())!=1){
                                   	 $('#min').attr('disabled',false);
                                	}
                           	 }) 
                            	$("#min").click(function(){
                                	t.val(parseInt(t.val())-1);
                                	if (parseInt(t.val())==1){
                                   	 $('#min').attr('disabled',true);
                                	}
                            	})  
                        	});
                        	</script>  
                        	<div class="gcIpt">
                        		<span class="guT">数量</span>
                        		<input id="min" name="" type="button" value="-" />  
                        		<input id="text_box" name="" type="text" value="1"mstyle="width:30px; text-align: center; color: #0F0F0F;"/>  
                        		<input id="add" name="" type="button" value="+" />
                        		<span class="Hgt">库存（99）</span>
                        	</div>
                        	<div class="nobdr-btns">
                        	<form action="${ctx}/cart/addincart?name=<%=id %>" method="post">
                        	<input type="hidden" name="user" value="${user.username}">
                        		<input type="submit" class="addcart hu" value="加入购物车"> 
                        	</form>
                        	</div>
                        	<div class="guarantee">
                        		<span>邮费：包邮&nbsp;&nbsp;支持货到付款 <a href=""><img src="images/me.png"/></a></span>
                        	</div>
                        </div>
                        <!--right -->
                        
                    </div>                
             
                <div class="gdetail">
                	<script>
                	var detail = document.querySelector('.detail');
var origOffsetY = detail.offsetTop;
function onScroll(e) {
window.scrollY >= origOffsetY ? detail.classList.add('sticky') :
detail.classList.remove('sticky');
}
document.addEventListener('scroll', onScroll); 
</script>
                	<div class="detail">
                		<div class="active_tab" id="outer">
													<ul class="act_title_left" id="tab">
														<li class="act_active">
															<a href="#">规格参数</a>
														</li>
														<li>
															<a href="#">商品介绍</a>
														</li>														
													</ul>
													<ul class="act_title_right">
														<li class="mui">  
															<a id="mui-a" href="#">扫手机下单+</a>
														</li>
														<li class="mui-ac">
															<a href="#">加入购物车</a>
														</li>
													</ul>
													<div class="clear"></div>
												</div>
												<div id="content" class="active_list"> 
													<!--0-->
													<div id="ui-a" class="ui-a">
												        <ul style="display:block;">
												        <li>商品名称：<%=name %></li>
												        <li>商品编号：ECS001983</li>
												        <li>品牌</li>
												        <li>上架时间：2016-05-24</li>
												        <li>商品毛重：0克</li>
												        <li>库存： 999 </li>
												        <li><img src="${ctx}/static/image/<%= image%>"/></li>
												        <li><img src="images/ko-2.jpg"/></li>
												        <li><img src="images/ko.jpg"/></li>
												        <li><img src="images/ko-1.jpg"/></li>
												        </ul>
												   </div>
												   <!--商品规格-->
												    	<div id="bit" class="bit">
												        <ul style="display:none;">
												            <li><img src="images/ko-1.jpg"/></li>
												            <li><img src="images/ko-2.jpg"/></li>
												            <li><img src="images/ko.jpg"/></li>
												            <li><img src="images/ko-1.jpg"/></li>
												            <li><img src="images/ko-2.jpg"/></li>
												                
												       </ul>
												       </div>												      
												</div>
												<script>
													$(function(){
														window.onload = function()
														{
															var $li = $('#tab li');
															var $ul = $('#content ul');
																		
															$li.mouseover(function(){
																var $this = $(this);
																var $t = $this.index();
																$li.removeClass();
																$this.addClass('act_active');
																$ul.css('display','none');
																$ul.eq($t).css('display','block');
															})
														}
													});  
												</script>
                	</div>
                </div>
                
</body>
</html>