{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			角色管理--查看角色详情
		{/h1}
	{/block}
	{block name="content"}
		{block name="workbench"}
			{form name="role_edit" state="readonly"}
				{field field="role"}{/field}
				{field field="permissions[]"}
					{select data-no-select-box-it="true" options=$permissions label-field="notes" multiple="multiple" value-field="id" class="permission-selected" size="20" disabled="disabled"}
					{/select}
				{/field}
			{/form}
		{/block}
	{/block}
