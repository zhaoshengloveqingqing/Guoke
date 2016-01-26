{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			用户管理
		{/h1}
	{/block}
	{block name="content"}
		{block name="toolbar"}
			{foreach $global_permissions['user']['methods'] as $val}
				{if $val == 'create'}
					{action action=$create class=["btn", "btn-primary"]}{/action}
				{elseif $val == 'show'}
					{action datatable-for="user" action=$show class=["btn", "btn-info"]}{/action}
				{elseif $val == 'edit'}
					{action datatable-for="user" action=$edit class=["btn", "btn-warning"]}{/action}
				{elseif $val == 'delete'}
					{action datatable-for="user" action=$delete class=["btn", "btn-danger"]}{/action}
				{/if}
			{/foreach}
		{/block}
		{block name="workbench"}
			{datatable name="admin_user"}
		{/block}
	{/block}