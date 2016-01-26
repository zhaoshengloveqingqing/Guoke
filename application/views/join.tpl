{extends file="bootstrap-layout.tpl"}
{block name="main"}
	{div class="workbench"}
		{div class="submenu-content"}
			{div class="submenu"}
				{div class="title"}
					{h3}{lang}加入我们{/lang}（{lang}招聘职位{/lang}）{/h3}
				{/div}
				{foreach $allRecruits as $key => $row}
					{if $recruitId == $row->id}
						{a class="active" uri="about/join/{$row->id}" id="{$row->id}"}{$row->title}{/a}
					{else}
						{a uri="about/join/{$row->id}" id="{$row->id}"}{$row->title}{/a}
					{/if}
				{/foreach}
			{/div}
			{div class="submenu-maincontent"}
				{block name="content"}
				{/block}
			{/div}
			{div class="clear"}
			{/div}
		{/div}
	{/div}
{/block}