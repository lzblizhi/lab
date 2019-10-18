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
            <label>名称:</label><input id="search-name" class="wu-text" style="width:100px">
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="part-data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<style>
.selected{
	background:red;
}
</style>
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td width="60" align="right">单位名称:</td>
                <td><input type="text" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写单位名称'" /></td>
            </tr>
            <tr>
                <td align="right">单位备注:</td>
                <td><textarea name="comment" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
            <tr>
                <td width="60" align="right">单位名称:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写单位名称'" /></td>
            </tr>
            <tr>
                <td align="right">单位备注:</td>
                <td><textarea id="edit-comment" name="comment" rows="6" class="wu-textarea" style="width:260px"></textarea></td>
            </tr>
        </table>
    </form>
</div>

<%@include file="../common/footer.jsp"%>

<!-- End of easyui-dialog -->
<script type="text/javascript">
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
			url:'../../admin/part/add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.status == 200){
					$.messager.alert('信息提示','添加成功！','info');
					$('#add-dialog').dialog('close');
					$('#part-data-datagrid').datagrid('reload');
					$('#part-data-datagrid').datagrid('clearSelections');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});	
	}
	
	
	/**
	* Name 修改记录
	*/
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.status == 200){
					$.messager.alert('信息提示',data.msg,'info');
					$('#edit-dialog').dialog('close');
					$('#part-data-datagrid').datagrid('reload');
					$('#part-data-datagrid').datagrid('clearSelections');
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
        var deviceList = $("#part-data-datagrid");
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
				var item = $('#part-data-datagrid').datagrid('getSelections');
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
							$('#part-data-datagrid').datagrid('reload');
							$('#part-data-datagrid').datagrid('clearSelections');
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
            title: "添加单位信息",
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
            }]
        });
	}
	
	/**
	* 打开修改窗口
	*/
	function openEdit(){
		//$('#edit-form').form('clear');
		var item = $('#part-data-datagrid').datagrid('getSelected');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要修改的数据！','info');
			return;
		}
		
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "修改信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#edit-id").val(item.id);
            	$("#edit-name").val(item.name);
            	$("#edit-comment").val(item.comment);
            }
        });
	}	
	//搜索按钮监听
	$("#search-btn").click(function(){
		$('#part-data-datagrid').datagrid('reload',{
			name:$("#search-name").val()
		});
	});
	
	/** 
	* 载入数据
	*/
	$('#part-data-datagrid').datagrid({
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
			{ field:'name',title:'单位名称',width:100,sortable:true},
			{ field:'comment',title:'单位备注',width:100,sortable:true}
		]] 
	});
</script>