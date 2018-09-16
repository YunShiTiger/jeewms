<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>下架商品明细</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="online/template/ledefault/css/vendor.css">
  <link rel="stylesheet" href="online/template/ledefault/css/bootstrap-theme.css">
  <link rel="stylesheet" href="online/template/ledefault/css/bootstrap.css">
  <link rel="stylesheet" href="online/template/ledefault/css/app.css">
  
  <link rel="stylesheet" href="plug-in/Validform/css/metrole/style.css" type="text/css"/>
  <link rel="stylesheet" href="plug-in/Validform/css/metrole/tablefrom.css" type="text/css"/>
  
  <script type="text/javascript" src="plug-in/jquery/jquery-1.8.3.js"></script>
  <script type="text/javascript" src="plug-in/tools/dataformat.js"></script>
  <script type="text/javascript" src="plug-in/easyui/jquery.easyui.min.1.3.2.js"></script>
  <script type="text/javascript" src="plug-in/easyui/locale/zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/tools/syUtil.js"></script>
  <script type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript" src="plug-in/lhgDialog/lhgdialog.min.js"></script>
  <script type="text/javascript" src="plug-in/tools/curdtools_zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/tools/easyuiextend.js"></script>
  <script type="text/javascript" src="plug-in/Validform/js/Validform_v5.3.1_min_zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/Validform/js/Validform_Datatype_zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/Validform/js/datatype_zh-cn.js"></script>
  <script type="text/javascript" src="plug-in/Validform/plugin/passwordStrength/passwordStrength-min.js"></script>
  <script type="text/javascript"  charset="utf-8" src="plug-in/ueditor/ueditor.config.js"></script>
  <script type="text/javascript"  charset="utf-8" src="plug-in/ueditor/ueditor.all.min.js"></script>
								
   <script type="text/javascript">
   function getcustext(){
		ajaxurl="wmToDownGoodsController.do?doGetcusname&cusCode="+$('#cusCode').val();
		$.get(ajaxurl).done(function (data) {
	        var obj = eval('(' + data + ')');;
	        if(obj.success){
	        $('#custext').val(obj.obj.cusName);
// 	        $('#cusCode').val(obj.obj.keHuBianMa);
// 	        $('#binIdTo').val($('#orderId').val());
	        }else{
	        	$('#custext').val(obj.msg);
	        }
	    });
   }
   function gethuozhu(){
		ajaxurl="wmNoticeConfController.do?doGethuozhu&wmNoticeId="+$('#orderId').val();
		$.get(ajaxurl).done(function (data) {
	        var obj = eval('(' + data + ')');;
	        console.log(obj.obj.zhongWenQch);
	        if(obj.success){
	        $('#custext').val(obj.obj.zhongWenQch);
	        $('#cusCode').val(obj.obj.keHuBianMa);
	        $('#binIdTo').val($('#orderId').val());
	        }else{
	        	$('#custext').val(obj.msg);
	        }
	    });
	}
   
   function getgoodstext(){
		ajaxurl="wmToDownGoodsController.do?doGettextzy&goodsid="+$('#goodsId').val();
		$.get(ajaxurl).done(function (data) {
	        var obj = eval('(' + data + ')');;      
	        console.log(obj);
	        if(!obj.success){
	            $('#goodstext').val(obj.msg);
	        }
	        else{
		        $('#goodstext').val(obj.obj.goodsName+"/"+obj.obj.shlDanWei);
	        }
	        
	    });
	}
  </script>
</head>

 <body>

	<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="wmToDownGoodsController.do?doAdd" tiptype="1" >
			<input type="hidden" id="btn_sub" class="btn_sub"/>
			<input type="hidden" id="id" name="id"/>
			<input type="hidden" id="orderType" name="orderType" value="02"/>
			<input type="hidden" id="goodsUnit" name="goodsUnit" />
			<input type="hidden" id="actTypeCode" name="actTypeCode" value="02"/>
			<input type="hidden" id="binIdTo" name="binIdTo" />
			
			<div class="tab-wrapper">
			    <!-- tab -->
			    <ul class="nav nav-tabs">
			      <li role="presentation" class="active"><a href="javascript:void(0);">下架商品明细</a></li>
			    </ul>
			    <!-- tab内容 -->
			    <div class="con-wrapper" id="con-wrapper1" style="display: block;">
			      <div class="row form-wrapper">
			      
			      			<div class="row show-grid">
                    <div class="col-xs-3 text-center">
			          	<b>货主：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="cusCode" name="cusCode" type="text" class="form-control"
									ignore="ignore" onchange="getcustext()"
								    />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">货主</label>
			          </div>
			           <div class="col-xs-3 text-center">
			         <input id="custext" readonly="readonly" style="width:320px;" class="form-control" />
			          </div>
						</div>
						
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>商品编码：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="goodsId" name="goodsId" type="text" class="form-control" 
									ignore="ignore" datatype="*" onchange="getgoodstext()"
								 />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">商品编码</label>
			          </div>
			          			           <div class="col-xs-3 text-center">
			         <input id="goodstext" readonly="readonly" style="width:320px;" class="form-control" />
			          </div>
						</div>
			          
			 
							<div class="row show-grid">
			          <div class="col-xs-3 text-center">
			          	<b>数量：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="goodsQua" name="goodsQua" type="text" class="form-control" 
									ignore="ignore" datatype="*"
								 />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">数量</label>
			          </div>
			          			          <div class="col-xs-3 text-center">
			          	<b>生产日期：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="goodsProData" name="goodsProData" type="text"
									ignore="ignore" datatype="*" style="background: url('plug-in/ace/images/datetime.png') no-repeat scroll right center transparent;"  class="form-control" onClick="WdatePicker()"  
								 />
								 				<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">生产日期</label>
			          </div>
						</div>
          
			        
							<div class="row show-grid">
										          <div class="col-xs-3 text-center">
			          	<b>库位编码：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="kuWeiBianMa" name="kuWeiBianMa" type="text" class="form-control" 
									ignore="ignore" datatype="*"
								 />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">库位编码</label>
			          </div>
			          <div class="col-xs-3 text-center">
			          	<b>源托盘码：</b>
			          </div>
			          <div class="col-xs-3">
								<input id="binIdFrom" name="binIdFrom" type="text" class="form-control" 
									ignore="ignore" datatype="*"
								 />
						<span class="Validform_checktip" style="float:left;height:0px;"></span>
						<label class="Validform_label" style="display: none">源托盘码</label>
			          </div>
						</div>
		       
			          <div class="row" id = "sub_tr" style="display: none;">
				        <div class="col-xs-12 layout-header">
				          <div class="col-xs-6"></div>
				          <div class="col-xs-6"><button type="button" onclick="neibuClick();" class="btn btn-default">提交</button></div>
				        </div>
				      </div>
			     </div>
			   </div>
			   
			   <div class="con-wrapper" id="con-wrapper2" style="display: block;"></div>
			 </div>
  </t:formvalid>

<script type="text/javascript">
   $(function(){
    //查看模式情况下,删除和上传附件功能禁止使用
	if(location.href.indexOf("load=detail")!=-1){
		$(".jeecgDetail").hide();
	}
	
	if(location.href.indexOf("mode=read")!=-1){
		//查看模式控件禁用
		$("#formobj").find(":input").attr("disabled","disabled");
	}
	if(location.href.indexOf("mode=onbutton")!=-1){
		//其他模式显示提交按钮
		$("#sub_tr").show();
	}
   });

  var neibuClickFlag = false;
  function neibuClick() {
	  neibuClickFlag = true; 
	  $('#btn_sub').trigger('click');
  }

</script>
 </body>
<script src = "webpage/com/zzjee/wm/wmToDownGoods.js"></script>		
</html>