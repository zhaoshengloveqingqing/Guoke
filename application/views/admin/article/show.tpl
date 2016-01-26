{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			用户管理--查看用户详情
		{/h1}
	{/block}
	{block name="content"}
		{block name="workbench"}
			{form name="user_edit" state="readonly"}
				{field field="id" type="hidden"}{/field}
				{field field="username"}{/field}
				{field field="password"}{/field}
				{field field="roles[]"}
					{select data-no-select-box-it="true" options=$roles label-field="role" multiple="multiple" value-field="id"}
					{/select}
				{/field}
			{/form}
		{/block}
	{/block}
