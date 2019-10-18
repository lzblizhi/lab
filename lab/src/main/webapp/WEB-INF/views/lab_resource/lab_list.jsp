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
            <label>实验室名:</label><input id="search-name" class="wu-text" style="width:100px">
            <label>状态:</label>
            <select id="search-status" class="easyui-combobox" panelHeight="auto" style="width:120px">
            	<option value="-1">全部</option>
            	<option value="0">空闲</option>
            	<option value="1">使用中</option>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="lab-data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td width="60" align="right">实验室名:</td>
                <td><input type="text" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写实验室名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">负责人:</td>
                <td><input type="text" name="admin" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写负责人'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">联系方式:</td>
                <td><input type="text" name="adminphone" class="wu-text easyui-numberbox easyui-validatebox" data-options="required:true,min:1,precision:0, missingMessage:'请填写联系方式'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">状态:</td>
                <td>
                	<select name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
		                <option value="0">空闲</option>
            			<option value="1">使用中</option>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">备注:</td>
                <td><input type="text" name="comment" class="wu-text easyui-validatebox" /></td>
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
                <td width="60" align="right">实验室名:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写实验室名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">负责人:</td>
                <td><input type="text" id="edit-admin" name="admin" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写负责人'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">联系方式:</td>
                <td><input type="text" id="edit-adminphone" name="adminphone" class="wu-text easyui-numberbox easyui-validatebox" data-options="required:true,min:1,precision:0, missingMessage:'请填写联系方式'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">状态:</td>
                <td>
                	<select id="edit-status" name="status" class="easyui-combobox" panelHeight="auto" style="width:268px">
		                <option value="0">空闲</option>
            			<option value="1">使用中</option>
		            </select>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">备注:</td>
                <td><input type="text" id="edit-comment" name="comment" class="wu-text easyui-validatebox" /></td>
            </tr>
        </table>
    </form>
</div>

<!-- 申请借用弹窗 -->
<div id="borrow-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="borrow-form" method="post">
	<input type="hidden" name="uid" id="uid" value="${admin.id}">
        <table>
            <tr>
                <td width="60" align="right">实验室名:</td>
                <td><input type="text" id="name" name="name" class="wu-text"  readonly="readonly"/></td>
            </tr>
            <tr>
                <td width="60" align="right">申请人:</td>
                <td><input type="text" id="username" name="username" readonly="readonly" value="${admin.username }" class="wu-text " /></td>
            </tr>
            <tr>
                <td width="60" align="right">申请人单位:</td>
                <td><input type="text" id="part" name="part" readonly="readonly" value="${part.name }" class="wu-text " /></td>
            </tr>
            <tr>
                <td width="60" align="right">用途:</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" type="text" id="useTo" name="useTo" data-options="required:true"/>
                </td>
            </tr>
            <tr>
            <td width="60" align="right">星期:</td>
                <td>
	                <input class="easyui-numberbox" type="text" id="day" name="day" data-options="required:true"/><span style="color:gray">填1-5的数字</span>
                </td>  
            </tr>
            <tr>
                <td width="60" align="right">开始节次:</td>
                <td>
                    <input class="easyui-numberbox" type="text" id="beginclass" name="beginclass" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">结束节次:</td>
                <td>
                    <input class="easyui-numberbox" type="text" id="endclass" name="endclass" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">通知邮箱:</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" type="text" id="email" name="email" data-options="required:true"/>
                </td>
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
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.status == 200){
					$.messager.alert('信息提示',data.msg,'info');
					$('#add-dialog').dialog('close');
					$('#lab-data-datagrid').datagrid('reload');
					$('#lab-data-datagrid').datagrid('clearSelections');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	*  修改记录
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
					$('#lab-data-datagrid').datagrid('reload');
					$('#lab-data-datagrid').datagrid('clearSelections');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 删除记录
	*/
	function remove(){
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var item = $('#lab-data-datagrid').datagrid('getSelections');
				if(item == null || item.length == 0){
					$.messager.alert('信息提示','请选择要删除的数据！','info');
					return;
				}
				var ids = '';
				for(var i=0;i<item.length;i++){
					ids += item[i].id + ',';
				}
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{ids:ids},
					success:function(data){
						if(data.status == 200){
							$.messager.alert('信息提示',data.msg,'info');
							$('#lab-data-datagrid').datagrid('reload');
							$('#lab-data-datagrid').datagrid('clearSelections');
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
            title: "添加用户信息",
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
	* 打开修改窗口
	*/
	function openEdit(){
		//$('#edit-form').form('clear');
		var item = $('#lab-data-datagrid').datagrid('getSelections');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要修改的数据！','info');
			return;
		}
		if(item.length > 1){
			$.messager.alert('信息提示','请选择一条数据进行修改！','info');
			return;
		}
		item = item[0];
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "修改用户信息",
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
            	$("#edit-admin").val(item.admin);
				$("#edit-adminphone").numberbox('setValue',item.adminphone);
            	$("#edit-status").val('setValue',item.status);
            	$("#edit-comment").val(item.comment);
            }
        });
	}	
	
	function addOrder(){
		var validate = $("#borrow-form").form("validate");
		if(!validate){
			/* $.messager.alert({ 
		　　　　　　　　title:’消息’, 
		　　　　　　　　msg:’完成加载…’, 
		　　　　　　　　icon:’info’, 
		　　　　}); */
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
		}
		var data = $("#borrow-form").serialize();
		
		$.ajax({
			url:'../labOrder/add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.status == 200){
					$.messager.alert('信息提示',data.msg,'info');
					$('#borrow-dialog').dialog('close');
					$('#lab-data-datagrid').datagrid('reload');
					$('#lab-data-datagrid').datagrid('clearSelections');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		})
	}
	
	//打开借用窗口
	function openLabOrder(index){
		//$('#borrow-form').form('clear');
	
		//var rows = $("#device-data-datagrid").datagrid("getRows");
		var row = $("#lab-data-datagrid").datagrid("getRows")[index];
		if(row.status == 1){
			$.messager.alert('信息提示','使用中','warning');
			return;
		}
		$('#borrow-dialog').dialog({
			closed: false,
			modal:true,
            title: "申请借用信息",
            buttons: [{
                text: '提交',
                iconCls: 'icon-ok',
                handler: addOrder
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#borrow-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#name").val(row.name);
            }
        });
	}	
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var status = $("#search-status").combobox('getValue')
		var option = {name:$("#search-name").val()};
		if(status != -1){
			option.status = status;
		}
		$('#lab-data-datagrid').datagrid('reload',option);
	});
	
	/** 
	* 载入数据
	*/
	$('#lab-data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:false,
		pageSize:10,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'id',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'name',title:'实验室名',width:100,sortable:true},
			{ field:'admin',title:'负责人',width:100},
			{ field:'adminphone',title:'联系方式',width:100},
			{ field:'status',title:'状态',width:100,formatter:function(value,row,index){
				switch(value){
					case 0:{
						return '<span style="color:green;">空闲</span>';
					}
					case 1:{
						return '<span style="color:red;">使用中</span>';
					}
				}
				return value;
			}},
			{ field:'comment',title:'备注',width:200},
			{ field:'icon',title:'预约',width:100,formatter:function(value,row,index){
				var test = '<a class="order-edit" onclick="openLabOrder('+index+')"></a>'
				return test;
			}},
		]],
		onLoadSuccess:function(data){  
			$('.order-edit').linkbutton({text:'申请借用',plain:true,iconCls:'icon-edit'});  
		 }  
	});
</script>