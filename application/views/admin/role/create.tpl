{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			角色管理--创建新角色
		{/h1}
	{/block}
	{block name="content"}
		{block name="toolbar"}
			{a class="btn btn-primary" form-for="role_create"}
			{lang}Create{/lang}
			{/a}
		{/block}
		{block name="workbench"}
			{form name="role_create" id="role_form"}
				{field field="role"}{/field}
				<div id="notes"><p>角色名已存在</p></div>
				{field field="permissions[]"}
					{select data-no-select-box-it="true" options=$permissions label-field="notes" row=10 multiple="multiple" value-field="id" class="permission-selected" size="20"}
					{/select}
				{/field}
			{/form}
		{/block}
	{/block}
