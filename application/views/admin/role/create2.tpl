{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			角色管理
		{/h1}
	{/block}
	{block name="content"}
		{block name="toolbar"}
			{a class="btn btn-primary" form-for="role_create"}
			{lang}Create{/lang}
			{/a}
		{/block}
		{block name="workbench"}
			{form name="role_create"  method="post"  action="admin/role/create2_form"}
			{*<form name="admin/role/create2_form"  method="post"  action="">*}
				<div>
					<p>Role</p>
					<input type="text" name="role" />
				</div>
				<div id="permission">
					<p>Permission</p>

					<span>欢迎主页</span>
					<div style="border:1px solid #dcdcdc;width:80%;height: 40px;">
						<div style="width:20%;float:left;"><input name="home" type="checkbox"/>允许访问</div>
					</div>

					<span>用户组</span>
					<div style="border:1px solid #dcdcdc;width:80%;height: 40px;">
						<input name="user" type="hidden" />
						{*<div style="width:20%;float:left;"><input name="user_index" type="checkbox" />查看所有用户</div>*}
						<div style="width:20%;float:left;"><input name="user_create" type="checkbox" />创建新用户</div>
						<div style="width:20%;float:left;"><input name="user_show" type="checkbox" />查看用户详情</div>
						<div style="width:20%;float:left;"><input name="user_edit" type="checkbox" />修改用户信息</div>
						<div style="width:20%;float:left;"><input name="user_delete" type="checkbox" />删除用户</div>
					</div>

					<span>角色组</span>
					<div style="border:1px solid #dcdcdc;width:80%;height: 40px;">
						{*<div style="width:20%;float:left;"><input name="role_index" type="checkbox" />查看所有角色</div>*}
						<div style="width:20%;float:left;"><input name="role_create" type="checkbox" />创建新角色</div>
						<div style="width:20%;float:left;"><input name="role_show" type="checkbox" />查看角色详情</div>
						<div style="width:20%;float:left;"><input name="role_edit" type="checkbox" />修改角色</div>
						<div style="width:20%;float:left;"><input name="role_delete" type="checkbox" />删除角色</div>
					</div>

					{*<span>幻灯片组</span>*}
					{*<div style="border:1px solid #dcdcdc;width:80%;height: 40px;">*}
						{*<div style="width:20%;float:left;"><input name="banner_index" type="checkbox" />查看所有幻灯片</div>*}
						{*<div style="width:20%;float:left;"><input name="banner_index_3" type="checkbox" />查看新闻幻灯片</div>*}
						{*<div style="width:20%;float:left;"><input name="banner_index_4" type="checkbox" />查看关于我们的幻灯片</div>*}
						{*<div style="width:20%;float:left;"><input name="banner_create" type="checkbox" />上传幻灯片</div>*}
						{*<div style="width:20%;float:left;"><input name="banner_show" type="checkbox" />查看幻灯片详情</div>*}
						{*<div style="width:20%;float:left;"><input name="banner_edit" type="checkbox" />修改幻灯片</div>*}
						{*<div style="width:20%;float:left;"><input name="banner_delete" type="checkbox" />删除幻灯片</div>*}
					{*</div>*}
				</div>

			{/form}
		{/block}
	{/block}
