<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp"%>
        </div>
        
    </div>
    <!-- End of toolbar -->
    <table id="schedule-data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<input type="hidden" name="uid" id="uid" value="${admin.id }">
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:500px; padding:10px;">
	<form id="add-form" method="post">	
	<input type="hidden" name="uid" id="uid" value="${admin.id }">
        <table>
        
            <tr>
                <td width="60" align="right">计划详细:</td>
             
                <td><input type="text" name="emailmsg" class="wu-text easyui-validatebox" data-options="required:true,min:1,precision:0" /></td>
                
            </tr>
            <tr>
                <td width="60" align="right">计划主题:</td>
                <td><input type="text" name="subject" class="wu-text easyui-validatebox" data-options="required:true,min:1,precision:0" /></td>
            </tr>
            <tr>
                <td width="60" align="right">通知邮箱:</td>
                <td><input type="text" name="email" class="wu-text easyui-validatebox" data-options="required:true,min:1,precision:0" /></td>
            </tr>
            <tr>
                <td width="60" align="right">提醒日期:</td>
                <td>
                    <input class="easyui-datebox" type="text" name="time" data-options="required:true"/>
                </td>
            </tr>

        </table>
    </form>
</div>
<%@include file="../common/footer.jsp"%>

<!-- End of easyui-dialog -->
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
	*  添加记录
	*/
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#add-form").serialize();
		$.ajax({
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.status == 200){
					$.messager.alert('信息提示','添加成功！','info');
					$('#add-dialog').dialog('close');
					$('#schedule-data-datagrid').datagrid('reload');
					$('#schedule-data-datagrid').datagrid('clearSelections');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 删除记录
	*/
	function getSelectionsIds(){
        var deviceList = $("#schedule-data-datagrid");
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
				var item = $('#schedule-data-datagrid').datagrid('getSelections');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
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
							$.messager.alert('信息提示',data.msg,'info');
							$('#schedule-data-datagrid').datagrid('reload');
							$('#schedule-data-datagrid').datagrid('clearSelections');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加设备信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//$("#add-form input").val('');
            }
        });
	}
	
	
	/** 
	* 载入数据
	*/
	$('#schedule-data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		queryParams:{uid: $("#uid").val()},
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
			{ field:'emailmsg',title:'计划详细',width:100,sortable:true},
			{ field:'subject',title:'计划主题',width:100},
			{ field:'time',title:'提醒时间',width:100,formatter:function(val,row){
				var now = new Date(val);
		    	return now.format("yyyy-MM-dd");
			},},
			{ field:'email',title:'通知邮箱',width:100},
			{ field:'status',title:'状态',width:100,formatter:function(val,row){
				if(val == 0){
					return '<span style="color:green">待办</span>';
				}
				if(val == 1){
					return '<span style="color:red">已过期</span>';
				}
			}}
		]]
	});
</script>