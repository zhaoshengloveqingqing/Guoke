{extends file="admin/bootstrap-layout.tpl"}
{block name="toolbar"}
	{a class="btn btn-primary" form-for="user_edit"}
	{lang}update{/lang}
	{/a}
{/block}
{block name="content"}
	{form name="admin/partner/show" state="readonly" enctype="multipart/form-data"}
	{field field="company_name"}{/field}
	{foreach $partners as $k=>$v}
		{foreach $v->path as $key=> $val}
		{/foreach}
		<div id="uploadContent">
			<br />
			<div id="dts{$k}" style='width:120px; height:100px;'>
				<img img="img" src="../../../../application/static/img/{$val}" width="120" height="100" />
			</div>
		</div>
	{/foreach}
	{/form}
{/block}