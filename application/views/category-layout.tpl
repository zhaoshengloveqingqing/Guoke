{extends file="bootstrap-layout.tpl"}
	{block name="main"}
		{div id="workbench"}
			{row}
				{column class="navbar menu" id="meun"}
					{h3}{a uri="product"}{lang}产品&服务{/lang}{/a}{/h3}
					{div class="meun-content"}
						{ul}
							{li class="title"}{lang}计算{/lang}{/li}
							{foreach $products as $key => $row}
								{if $row->type == 1}
									{if $row->id == $productId}
										{li class="active"}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{else}
										{li}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{/if}
								{/if}
							{/foreach}
						{/ul}
					{/div}
					{div class="meun-content"}
						{ul}
							{li class="title"}{lang}存储{/lang}{/li}
							{foreach $products as $key => $row}
								{if $row->type == 2}
									{if $row->id == $productId}
										{li class="active"}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{else}
										{li}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{/if}
								{/if}
							{/foreach}
						{/ul}
					{/div}
					{div class="meun-content"}
						{ul}
							{li class="title"}{lang}网络{/lang}{/li}
							{foreach $products as $key => $row}
								{if $row->type == 3}
									{if $row->id == $productId}
										{li class="active"}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{else}
										{li}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{/if}
								{/if}
							{/foreach}
						{/ul}
					{/div}
					{div class="meun-content"}
						{ul}
							{li class="title"}{lang}安全{/lang}{/li}
							{foreach $products as $key => $row}
								{if $row->type == 4}
									{if $row->id == $productId}
										{li class="active"}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{else}
										{li}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{/if}
								{/if}
							{/foreach}
						{/ul}
					{/div}
					{div class="meun-content"}
						{ul}
							{li class="title"}{lang}软件{/lang}{/li}
							{foreach $products as $key => $row}
								{if $row->type == 5}
									{if $row->id == $productId}
										{li class="active"}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{else}
										{li}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{/if}
								{/if}
							{/foreach}
						{/ul}
					{/div}
					{div class="meun-content"}
						{ul}
							{li class="title"}{lang}管理{/lang}{/li}
							{foreach $products as $key => $row}
								{if $row->type == 6}
									{if $row->id == $productId}
										{li class="active"}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{else}
										{li}{a uri="product/detail/{$row->id}"}{lang}{$row->name}{/lang}{/a}{/li}
									{/if}
								{/if}
							{/foreach}
						{/ul}
					{/div}
				{/column}
				{column id="content"}
					{block name="main_content"}
					{/block}
				{/column}
			{/row}
		{/div}
	{/block}