{extends file="admin/bootstrap-layout.tpl"}
{block name="content-header"}
	{h1}
		文件上传管理
	{/h1}
{/block}
{block name="content"}
	{block name="toolbar"}
		{action action=$create class=["btn", "btn-primary"]}{/action}
		{action datatable-for="user" action=$show class=["btn", "btn-info"]}{/action}
		{action datatable-for="user" action=$edit class=["btn", "btn-warning"]}{/action}
		{action datatable-for="user" action=$delete class=["btn", "btn-danger"]}{/action}
	{/block}
	{block name="workbench"}
		{datatable name="admin_resource"}
	{/block}
{/block}