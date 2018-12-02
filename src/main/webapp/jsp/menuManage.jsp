<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>菜单管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet" href="../static/css/bootstrap.min.css">
<link rel="stylesheet" href="../static/css/font-awesome.min.css">
<link rel="stylesheet" href="../static/js/plugins/jqgrid/ui.jqgrid-bootstrap.css">
<link rel="stylesheet" href="../static/js/plugins/ztree/css/metroStyle/metroStyle.css">
<link rel="stylesheet" href="../static/css/bootstrap-table.min.css">
<link rel="stylesheet" href="../static/css/main.css">
<link rel="stylesheet" href="../static/js/plugins/treegrid/jquery.treegrid.css">

<script src="../static/js/jquery.min.js"></script>
<script src="../static/js/plugins/layer/layer.js"></script>
<script src="../static/js/bootstrap.min.js"></script>
<script src="../static/js/vue.min.js"></script>
<script src="../static/js/bootstrap-table.min.js"></script>
<script src="../static/js/plugins/treegrid/jquery.treegrid.min.js"></script>
<script src="../static/js/plugins/treegrid/jquery.treegrid.bootstrap3.js"></script>
<script src="../static/js/plugins/treegrid/jquery.treegrid.extension.js"></script>
<script src="../static/js/plugins/treegrid/tree.table.js"></script>
<script src="../static/js/plugins/jqgrid/grid.locale-cn.js"></script>
<script src="../static/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
<script src="../static/js/plugins/ztree/jquery.ztree.all.min.js"></script>

</head>
<body>
	<div id="bcwapp" v-cloak>
		<div v-show="showList">
			<div class="grid-btn">
				<a v-if="hasPermission('sys:menu:save')" class="btn btn-primary"
					@click="add"><i class="fa fa-plus"></i>&nbsp;新增</a> <a
					v-if="hasPermission('sys:menu:update')" class="btn btn-primary"
					@click="update"><i class="fa fa-pencil-square-o"></i>&nbsp;修改</a> <a
					v-if="hasPermission('sys:menu:delete')" class="btn btn-primary"
					@click="del"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
			</div>
			<table id="menuTable" data-mobile-responsive="true"
				data-click-to-select="true">
				<thead>
					<tr>
						<th data-field="selectItem" data-checkbox="true"></th>
					</tr>
				</thead>
			</table>
		</div>

		<div v-show="!showList" class="panel panel-default">
			<div class="panel-heading">{{title}}</div>
			<form class="form-horizontal" method="post">
				<div class="form-group">
					<div class="col-sm-2 control-label">类型</div>
					<label class="radio-inline"> <input type="radio"
						name="type" value="0" v-model="menu.type" /> 目录
					</label> <label class="radio-inline"> <input type="radio"
						name="type" value="1" v-model="menu.type" /> 菜单
					</label> <label class="radio-inline"> <input type="radio"
						name="type" value="2" v-model="menu.type" /> 按钮
					</label>
				</div>
				<div class="form-group">
					<div class="col-sm-2 control-label">菜单名称</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" v-model="menu.name"
							placeholder="菜单名称或按钮名称" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 control-label">上级菜单</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" style="cursor: pointer;"
							v-model="menu.parentName" @click="menuTree" readonly="readonly"
							placeholder="一级菜单" />
					</div>
				</div>
				<div v-if="menu.type == 1" class="form-group">
					<div class="col-sm-2 control-label">菜单URL</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" v-model="menu.url"
							placeholder="菜单URL" />
					</div>
				</div>
				<div v-if="menu.type == 1 || menu.type == 2" class="form-group">
					<div class="col-sm-2 control-label">授权标识</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" v-model="menu.perms"
							placeholder="多个用逗号分隔，如：user:list,user:create" />
					</div>
				</div>
				<div v-if="menu.type != 2" class="form-group">
					<div class="col-sm-2 control-label">排序号</div>
					<div class="col-sm-10">
						<input type="number" class="form-control" v-model="menu.orderNum"
							placeholder="排序号" />
					</div>
				</div>
				<div v-if="menu.type != 2" class="form-group">
					<div class="col-sm-2 control-label">图标</div>
					<div class="col-sm-10">
						<input type="text" class="form-control" v-model="menu.icon"
							placeholder="菜单图标" />
						<code style="margin-top: 4px; display: block;">获取图标：http://fontawesome.io/icons/</code>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-2 control-label"></div>
					<input type="button" class="btn btn-primary" @click="saveOrUpdate"
						value="确定" /> &nbsp;&nbsp;<input type="button"
						class="btn btn-warning" @click="reload" value="返回" />
				</div>
			</form>
		</div>
	</div>

	<!-- 选择菜单 -->
	<div id="menuLayer" style="display: none; padding: 10px;">
		<ul id="menuTree" class="ztree"></ul>
	</div>
	
	<script src="../js/common.js"></script>
	<script src="js/menuManageUI.js"></script>
</body>
</html>