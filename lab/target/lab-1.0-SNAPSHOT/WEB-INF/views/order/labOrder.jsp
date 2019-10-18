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
            <label>实验室名:</label><input id="search-name" class="wu-text" style="width:100px">&nbsp;
             <label>申请人:</label><input id="search-username" class="wu-text" style="width:100px">&nbsp;
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
    <!-- End of toolbar -->
    <table id="labOrder-data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
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
	
	
	/* 
	    点击同意
	*/
	function agree(){
		var item = $('#labOrder-data-datagrid').datagrid('getSelections');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要处理的数据！','info');
			return;
		}
		var ids = getSelectionsIds();
		if(ids.length == 0){
            $.messager.alert('提示','未选中实验室!');
            return ;
        }
		
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:{ids:ids},
			success:function(data){
				if(data.status == 200){
					$.messager.alert('信息提示',data.msg,'info');
					$('#labOrder-data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		})
	}
	
	/* 点击归还 */
	function ret(){
		var item = $('#labOrder-data-datagrid').datagrid('getSelections');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要归还的实验室！','info');
			return;
		}
		var ids = getSelectionsIds();
		if(ids.length == 0){
            $.messager.alert('提示','未选中实验室!');
            return ;
        }
		
		$.ajax({
			url:'retEdit',
			dataType:'json',
			type:'post',
			data:{ids:ids},
			success:function(data){
				if(data.status == 200){
					$.messager.alert('信息提示',data.msg,'info');
					$('#labOrder-data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		})
	}
	
	/* 点击拒绝 */
	function disagree(){
		$.messager.confirm('信息提示','确定要拒绝申请？', function(result){
			if(result){
				var item = $('#labOrder-data-datagrid').datagrid('getSelections');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要操作的数据！','info');
					return;
				}
				var ids = getSelectionsIds();
				if(ids.length == 0){
	                $.messager.alert('提示','未选中实验室!');
	                return ;
	            }
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{ids:ids},
					success:function(data){
						if(data.status == 200){
							$.messager.alert('信息提示','已拒绝该申请','info');
							$('#labOrder-data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/**
	* 删除记录
	*/
	function getSelectionsIds(){
        var deviceList = $("#labOrder-data-datagrid");
        var sels = deviceList.datagrid("getSelections");
        var ids = [];
        for(var i in sels){
            ids.push(sels[i].id);
        }
        ids = ids.join(",");
        return ids;
    }
	
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#labOrder-data-datagrid').datagrid('getSelections');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				var ids = getSelectionsIds();
				if(ids.length == 0){
	                $.messager.alert('提示','未选中实验室!');
	                return ;
	            }
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{ids:ids},
					success:function(data){
						if(data.status == 200){
							$.messager.alert('信息提示','删除成功','info');
							$('#labOrder-data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示','删除失败','warning');
						}
					}
				});
			}	
		});
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
		$('#labOrder-data-datagrid').datagrid('reload',option);
	}); 
	
	/** 
	* 载入数据
	*/
	$('#labOrder-data-datagrid').datagrid({
		url:'list',
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
			{ field:'name',title:'实验室名称',width:100},
			{ field:'user',title:'申请人',width:100,sortable:true,formatter:function(val,row){
				return val.username;
			}},
			{ field:'email',title:'邮箱',width:100},
			{ field:'part',title:'所属单位',width:100},
			{ field:'useTo',title:'用途',width:100},
			{ field:'day',title:'星期',width:100},
			{ field:'beginclass',title:'开始节次',width:100},
			{ field:'endclass',title:'结束节次',width:100},
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