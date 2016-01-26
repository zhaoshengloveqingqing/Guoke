{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			用户管理--修改用户信息
		{/h1}
	{/block}
	{block name="content"}
		{block name="toolbar"}
			{action class=["btn", "btn-primary"] form-for="user_edit" action=$update}{/action}
		{/block}
		{block name="workbench"}
			{form name="user_edit"}
				{field field="id" state="hidden"}{/field}
				{field field="username"}{/field}
				{field field="password"}{/field}
				{field field="roles[]"}
					{select data-no-select-box-it="true" options=$roles label-field="role" multiple="multiple" value-field="id"}
					{/select}
				{/field}
			{/form}
		{/block}
	{/block}