<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        <div class="wu-toolbar-search">
            <label>设备名:</label><input id="search-name" class="wu-text" style="width:100px">&nbsp;
              <label>审核状态:</label>
             <select id="search-astatus" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="1">未审核</option>
            	<option value="2">已审核</option>
            </select>
            <label>归还状态:</label>
            <select id="search-rstatus" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">未审核</option>
            	<option value="1">未归还</option>
            	<option value="2">已归还</option>
            </select>
            <label>申请日期:</label>
            <input id="search-btime" class="easyui-datebox" type="text" name="btime"/>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <input type="hidden" name="uid" id="order-uid" value="${admin.id}">
    <!-- End of toolbar -->
    <table id="myOrder-data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>

<%@include file="../common/footer.jsp"%>

<script type="text/javascript">
	Date.prototype.format = function(format){ 
	    var o =  { 
	    "M+" : this.getMonth()+1, //month 
	    "d+" : this.getDate(), //day 
	    "h+" : this.getHours(), //hour 
	    "m+" : this.getMinutes(), //minute 
	    "s+" : this.getSeconds(), //second 
	    "q+" : Math.floor((this.getMonth()+3)/3), //quarter 
	    "S" : this.getMilliseconds() //millisecond 
	    };
	    if(/(y+)/.test(format)){ 
	    	format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	    }
	    for(var k in o)  { 
		    if(new RegExp("("+ k +")").test(format)){ 
		    	format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
		    } 
	    } 
	    return format; 
	};
	
	/**
	* 删除记录
	*/
	function getSelectionsIds(){
        var deviceList = $("#myOrder-data-datagrid");
        var sels = deviceList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }
	
	//取消申请
	function cancel(){
		var item = $('#myOrder-data-datagrid').datagrid('getSelections');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要取消的数据！','info');
			return;
		}
		if(item.length > 1){
			$.messager.alert('信息提示','请只选择一条数据！','info');
			return;
		}
		var row = $("#myOrder-data-datagrid").datagrid("getRows")[0];
		var rstatus = row.rstatus;
		if(rstatus == 1){
			$.messager.alert('信息提示','尚未归还设备,不能取消！','info');
			return;
		}
		else{
			$.messager.confirm('信息提示','确定要取消该申请？', function(result){
				if(result){
					var item = $('#myOrder-data-datagrid').datagrid('getSelections');
					if(item == null || item.length == 0){
						$.messager.alert('信息提示','请选择要取消的数据！','info');
						return;
					}
					var ids = getSelectionsIds();
					if(ids.length == 0){
		                $.messager.alert('提示','未选中设备!');
		                return ;
		            }
					$.ajax({
						url:'delete',
						dataType:'json',
						type:'post',
						data:{ids:ids},
						success:function(data){
							if(data.status == 200){
								$.messager.alert('信息提示','取消成功','info');
								$('#myOrder-data-datagrid').datagrid('reload');
							}else{
								$.messager.alert('信息提示','取消失败','warning');
							}
						}
					});
				}	
			});
		}
	}
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var astatus = $("#search-astatus").combobox('getValue');
		var rstatus = $("#search-rstatus").combobox('getValue');
		var option = {name:$("#search-name").val(), username:$("#search-username").val(), 
				btime:$("#search-btime").datebox('getValue')};	
		if(astatus != -1){
			option.astatus = astatus;
		}
		else{
			option.astatus ='';
		}
		if(rstatus != -1){
			option.rstatus = rstatus;
		}
		else{
			option.rstatus ='';
		}
		$('#myOrder-data-datagrid').datagrid('reload',option);
	}); 
	
	/** 
	* 载入数据
	*/
	$('#myOrder-data-datagrid').datagrid({
		url:'mylist',
		queryParams:{uid: $("#order-uid").val()},
		rownumbers:true,
		singleSelect:false,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'name',title:'设备名称',width:100},
			{ field:'user',title:'申请人',width:100,sortable:true,formatter:function(val,row){
				return val.username;
			}},
			{ field:'part',title:'所属单位',width:100},
			{ field:'useTo',title:'用途',width:100},
			{ field:'number',title:'申请数',width:100},
			{ field:'btime',title:'申请时间',width:100,formatter:function(val,row){
				var now = new Date(val);
		    	return now.format("yyyy-MM-dd");
			}},
			{ field:'rtime',title:'归还时间',width:100,formatter:function(val,row){
				var now = new Date(val);
		    	return now.format("yyyy-MM-dd");
			}},
			{ field:'email',title:'邮箱',width:100},
			{ field:'astatus',title:'审核状态',width:100,formatter:function(val,row){
				switch(val){
					case 1:{
						return '<span style="color:green;">未审核</span>';
					}
					case 2:{
						return '<span style="color:red;">已审核</span>';
					}
				}
				return val;
			}},
			{ field:'rstatus',title:'归还状态',width:100,formatter:function(val,row){
				switch(val){
					case 0:{
						return '<span style="color:green;">未审核</span>';
					}
					case 1:{
						return '<span style="color:green;">未归还</span>';
					}
					case 2:{
						return '<span style="color:red;">已归还</span>';
					}
				}
				return val;
			}}
		]] 
	});
</script>