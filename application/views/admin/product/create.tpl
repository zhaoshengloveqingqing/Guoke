{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			用户管理--创建新用户
		{/h1}
	{/block}
	{block name="content"}
		{block name="toolbar"}
			{a class="btn btn-primary" form-for="user_create"}
			{lang}Create{/lang}
			{/a}
		{/block}
		{block name="workbench"}
			{form name="user_create" id="user_form"}
				{field field="username"}{/field}
				<div id="notes"><p>用户名已存在</p></div>
				{field field="password"}{/field}
				{field field="roles[]"}
					{select data-no-select-box-it="true" options=$roles label-field="role" row=10  multiple="multiple" value-field="id" class="role-selected" size="8"}
					{/select}
				{/field}
			{/form}
		{/block}
	{/block}
