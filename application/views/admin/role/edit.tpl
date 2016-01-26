{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			角色管理--修改角色信息
		{/h1}
	{/block}
	{block name="content"}
		{block name="toolbar"}
			{action class=["btn", "btn-primary"] form-for="role_edit" action=$update}{/action}
		{/block}
		{block name="workbench"}
			{form name="role_edit"}
				{field field="id" state="hidden"}{/field}
				{field field="role"}{/field}
				{field field="permissions[]"}
					{select data-no-select-box-it="true" options=$permissions label-field="notes" multiple="multiple" value-field="id" class="permission-selected" size="20"}
					{/select}
				{/field}
			{/form}
		{/block}
	{/block}