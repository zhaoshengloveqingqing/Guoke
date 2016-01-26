{extends file="bootstrap-layout.tpl"}
	{block name="main"}
		{div id="workbench"}
			{foreach $allSolutions as $key => $row}
			<section>
				{div class="solution"}
					{if $key mod 2 == 0}
						{div class="text-content"}
							{h2}{$row->title}{/h2}
							{p}{$row->content}{/p}
							{a}{lang}查看详情{/lang}{/a}
							{resimg data-image="{$row->image_url}"}
						{/div}
						{div class="img-content"}
							{resimg data-image="{$row->image_url}"}
						{/div}
					{else}
						{div class="img-content"}
							{resimg data-image="{$row->image_url}"}
						{/div}
						{div class="text-content"}
							{h2}{$row->title}{/h2}
							{resimg data-image="{$row->image_url}"}
							{p}{$row->content}{/p}
							{a}{lang}查看详情{/lang}{/a}
						{/div}
					{/if}
				{/div}
			</section>
			{/foreach}
		{/div}
	{/block}