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
				{field field="name"}{/field}
				{field field="introductions"}{/field}
				{field field="iamge_url"}{/field}
				{field field="functions"}{/field}
				{field field="advantages"}{/field}
				{field field="types[]"}
					{select data-no-select-box-it="true" options=$types label-field="type" multiple="multiple" value-field="id" class="role-selected" size="8"}
					{/select}
				{/field}
				{field field="group_id"}
					{select options=$groups label-field="name" value-field="id"}
					{/select}
				{/field}
			{/form}
		{/block}
	{/block}