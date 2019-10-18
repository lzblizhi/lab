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
            <label>可用数少于:</label><input id="search-usable" class="wu-text easyui-numberbox" style="width:100px">&nbsp;
            <label>购买日期于:</label>
            <input id="search-buydate" class="easyui-datebox" type="text" name="buydate"/>
            <label>前</label>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="device-data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<div id="add-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:420px; padding:10px;">
	<form id="add-form" method="post">
        <table>
            <tr>
                <td width="60" align="right">图片预览:</td>
                <td valign="middle">
                	<img id="preview-photo" style="float:left;" src="/lab/resources/admin/easyui/images/user_photo.jpg" width="100px">
                	<a style="float:left;margin-top:40px;" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-upload" onclick="uploadPhoto()" plain="true">上传图片</a>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">图片:</td>
                <td><input type="text" id="add-photo" name="photo" value="/lab/resources/admin/easyui/images/user_photo.jpg" readonly="readonly" class="wu-text " /></td>
            </tr>
            <tr>
                <td width="60" align="right">设备名:</td>
                <td><input type="text" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写设备名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">总数:</td>
                <td><input type="text" name="quantity" class="wu-text easyui-numberbox easyui-validatebox" data-options="required:true,min:1,precision:0, missingMessage:'请填写总数'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">可用数:</td>
                <td><input type="text" name="usable" class="wu-text easyui-numberbox easyui-validatebox" data-options="required:true,min:1,precision:0, missingMessage:'请填写可用数'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">购买日期:</td>
                <td>
                    <input class="easyui-datebox" type="text" name="buydate" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">存放地点:</td>
                <td>
                    <input class="easyui-textbox" type="text" name="place" data-options="required:true"/>
                </td>
            </tr>
            <tr>
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
                <td width="60" align="right">图片预览:</td>
                <td valign="middle">
                	<img id="edit-preview-photo" style="float:left;" src="/lab/resources/admin/easyui/images/user_photo.jpg" width="100px">
                	<a style="float:left;margin-top:40px;" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-upload" onclick="uploadPhoto()" plain="true">上传图片</a>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">图片:</td>
                <td><input type="text" id="edit-photo" name="photo" readonly="readonly" class="wu-text " /></td>
            </tr>
            <tr>
                <td width="60" align="right">设备名:</td>
                <td><input type="text" id="edit-name" name="name" class="wu-text easyui-validatebox" data-options="required:true, missingMessage:'请填写设备名'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">总数:</td>
                <td><input type="text" id="edit-quantity" name="quantity" class="wu-text easyui-numberbox easyui-validatebox" data-options="required:true,min:1,precision:0, missingMessage:'请填写总数'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">可用数:</td>
                <td><input type="text" id="edit-usable" name="usable" class="wu-text easyui-numberbox easyui-validatebox" data-options="required:true,min:1,precision:0, missingMessage:'请填写可用数'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">购买日期:</td>
                <td>
                    <input class="easyui-datebox" type="text" id="edit-buydate" name="buydate" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">存放地点:</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" type="text" id="edit-place" name="place" data-options="required:true"/>
                </td>
            </tr>
            <tr>
            <tr>
                <td width="60" align="right">备注:</td>
                <td><input type="text" name="comment" id="edit-comment" class="wu-text easyui-validatebox" /></td>
            </tr>

        </table>
    </form>
</div>
<!-- 申请借用弹窗 -->
<div id="borrow-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'" style="width:450px; padding:10px;">
	<form id="borrow-form" method="post">
	<input type="hidden" name="uid" id="borrow-uid" value="${admin.id}">
        <table>
            <tr>
                <td width="60" align="right">设备名:</td>
                <td><input type="text" id="borrow-name" name="name" class="wu-text"  readonly="readonly"/></td>
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
                    <input class="easyui-textbox easyui-validatebox" type="text" id="borrow-useTo" name="useTo" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">申请数:</td>
                <td><input type="text" id="borrow-number" name="number" class="wu-text easyui-numberbox easyui-validatebox" data-options="required:true,min:1,precision:0, missingMessage:'请填写可用数'" /></td>
            </tr>
            <tr>
                <td width="60" align="right">申请日期:</td>
                <td>
                    <input class="easyui-datebox" type="text" id="borrow-btime" name="btime" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">归还日期:</td>
                <td>
                    <input class="easyui-datebox" type="text" id="borrow-rtime" name="rtime" data-options="required:true"/>
                </td>
            </tr>
            <tr>
                <td width="60" align="right">通知邮箱:</td>
                <td>
                    <input class="easyui-textbox easyui-validatebox" type="text" id="borrow-email" name="email" data-options="required:true"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="process-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-upload',title:'正在上传图片'" style="width:450px; padding:10px;">
<div id="p" class="easyui-progressbar" style="width:400px;" data-options="text:'正在上传中...'"></div>
</div>
<input type="file" id="photo-file" style="display:none;" onchange="upload()">
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

	//上传图片
	function start(){
			var value = $('#p').progressbar('getValue');
			if (value < 100){
				value += Math.floor(Math.random() * 10);
				$('#p').progressbar('setValue', value);
			}else{
				$('#p').progressbar('setValue',0)
			}
	};
	function upload(){
		if($("#photo-file").val() == '')return;
		var formData = new FormData();
		formData.append('photo',document.getElementById('photo-file').files[0]);
		$("#process-dialog").dialog('open');
		var interval = setInterval(start,200);
		$.ajax({
			url:'upload_photo',
			type:'post',
			data:formData,
			contentType:false,
			processData:false,
			success:function(data){
				clearInterval(interval);
				$("#process-dialog").dialog('close');
				if(data.type == 'success'){
					$("#preview-photo").attr('src',data.filepath);
					$("#add-photo").val(data.filepath);
					$("#edit-preview-photo").attr('src',data.filepath);
					$("#edit-photo").val(data.filepath);
				}else{
					$.messager.alert("消息提醒",data.msg,"warning");
				}
			},
			error:function(data){
				clearInterval(interval);
				$("#process-dialog").dialog('close');
				$.messager.alert("消息提醒","上传失败!","warning");
			}
		});
	}
	
	function uploadPhoto(){
		$("#photo-file").click();
		
	}
	
	
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
					$('#device-data-datagrid').datagrid('reload');
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
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit-dialog').dialog('close');
					$('#device-data-datagrid').datagrid('reload');
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
        var deviceList = $("#device-data-datagrid");
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
				var item = $('#device-data-datagrid').datagrid('getSelections');
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
							$('#device-data-datagrid').datagrid('reload');
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
	* 打开修改窗口
	*/
	function openEdit(){
		$('#edit-form').form('clear');
		var item = $('#device-data-datagrid').datagrid('getSelections');
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
            title: "修改设备信息",
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
            	$("#edit-preview-photo").attr('src',item.photo);
				$("#edit-photo").val(item.photo);
            	$("#edit-name").val(item.name);
            	$("#edit-quantity").numberbox('setValue',item.quantity);
            	$("#edit-usable").numberbox('setValue',item.usable);
            	$("#edit-place").val(item.place);
            	var now = new Date(item.buydate);
            	date = now.format("yyyy-MM-dd");
            	$("#edit-buydate").datebox('setValue',date);
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
			url:'../devOrder/add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.status == 200){
					$.messager.alert('信息提示',data.msg,'info');
					$('#borrow-dialog').dialog('close');
					$('#device-data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		})
	}
	
	//打开借用窗口
	function openDevOrder(index){
		//$('#borrow-form').form('clear');
	
		//var rows = $("#device-data-datagrid").datagrid("getRows");
		var row = $("#device-data-datagrid").datagrid("getRows")[index];
		if(row.quantity == row.usable){
			$.messager.alert('信息提示','库存不足','warning');
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
            	$("#borrow-name").val(row.name);
            	var now = new Date();
            	date = now.format("yyyy-MM-dd");
            	$("#borrow-btime").datebox('setValue',date);
            	$("#borrow-btime").datebox('readonly',true);
            }
        });
	}	
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var option = {name:$("#search-name").val(), usable:$("#search-usable").val(), buydate:$("#search-buydate").datebox('getValue')};		
		$('#device-data-datagrid').datagrid('reload',option);
	});
	
	/** 
	* 载入数据
	*/
	$('#device-data-datagrid').datagrid({
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
			{ field:'photo',title:'图片',width:100,align:'center',formatter:function(value,row,index){
				var img = '<img src="'+value+'" width="50px" height="50px"/>';
				return img;
			}},
			{ field:'name',title:'设备名称',width:100,sortable:true},
			{ field:'quantity',title:'总数',width:100},
			{ field:'usable',title:'可用数',width:100},
			{ field:'place',title:'存放地点',width:100},
			{ field:'buydate',title:'购买日期',width:100,formatter:function(val,row){
				var now = new Date(val);
		    	return now.format("yyyy-MM-dd");
			},},
			{ field:'comment',title:'备注',width:200},
			{ field:'icon',title:'预约',width:100,formatter:function(value,row,index){
				var test = '<a class="order-edit" onclick="openDevOrder('+index+')"></a>'
				return test;
			}},
		]],
		onLoadSuccess:function(data){  
			$('.order-edit').linkbutton({text:'申请借用',plain:true,iconCls:'icon-edit'});  
		 }  
	});
</script>