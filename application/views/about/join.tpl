{extends file="join.tpl"}
{block name="content"}
	{div class="title"}
	{h3}{$oneRecruit->title}{/h3}
	{/div}
	{div class="content-right"}
		{ul}
			{li}{lang}详细描述{/lang}：{/li}
			{foreach $oneRecruit->requirement as $key => $value}
				{li}{$key+1}、{$value}{/li}
			{/foreach}
			{br}
			{li}{lang}职责描述{/lang}：{/li}
			{foreach $oneRecruit->task as $key => $value}
				{li}{$key+1}、{$value}{/li}
			{/foreach}
			{br}
			{li}{lang}有意者请将简历投递至人事部邮箱{/lang}：{a}HR@sisdc.com.cn{/a}，{lang}感谢您的信任{/lang}！{/li}
		{/ul}
	{/div}
{/block}