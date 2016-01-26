{extends file="admin/bootstrap-layout.tpl"}
	{block name="content-header"}
		{h1}
			产品管理
		{/h1}
	{/block}
	{block name="content"}
		{block name="toolbar"}
			{*{foreach $global_permissions['product']['methods'] as $val}*}
				{*{if $val == 'show'}*}
					{*{action datatable-for="user" action=$show class=["btn", "btn-info"]}{/action}*}
				{*{elseif $val == 'edit'}*}
					{*{action datatable-for="user" action=$edit class=["btn", "btn-warning"]}{/action}*}
				{*{/if}*}
			{*{/foreach}*}
			{action datatable-for="user" action=$show class=["btn", "btn-info"]}{/action}
			{action datatable-for="user" action=$edit class=["btn", "btn-warning"]}{/action}
		{/block}
		{block name="workbench"}
			{datatable name="admin_product"}
		{/block}
	{/block}