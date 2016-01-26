{extends file="category-layout.tpl"}
	{block name="main_content" append}
		{div class="data-control"}
			{h3 class="title"}
				{lang}{$details->name}{/lang}
			{/h3}
			{div class="virtual-product"}
				{div class="virtual-product-info"}
					{p} {$details->introductions}
					{/p}
					{p class="action"}{a class="buy"}立即购买{/a}{/p}
				{/div}
				{resimg data-image="{$details->image_url}"}
				{div class="clear"}{/div}
			{/div}
			{div class="virtual-product-details"}
				{ul class="nav nav-pills" role="tablist"}
					{li role="presentation"}{a href="#function" class="active" aria-controls="function" role="tab" data-toggle="tab"}{lang}功能{/lang}{/a}{/li}
					{li role="presentation"}{a href="#size" aria-controls="size" role="tab" data-toggle="tab"}{lang}规格{/lang}{/a}{/li}
					{li role="presentation"}{a href="#advantage" aria-controls="advantage" role="tab" data-toggle="tab"}{lang}优势{/lang}{/a}{/li}
					{li role="presentation"}{a href="#case" aria-controls="case" role="tab" data-toggle="tab"}{lang}案例{/lang}{/a}{/li}
				{/ul}
				{div class="tab-content"}
					{div role="tabpanel" class="tab-pane active" id="function"}
						{div class="function_document"}
							{*{h3 class="title"}资源服务{/h3}*}
							{div class="function_content"}
								{div class="function_content-info"}
									{$details->functions}
								{/div}
								{resimg data-image="product/virtual-product.png"}
							{/div}
						{/div}
					{/div}
					{div role="tabpanel" class="tab-pane" id="size"}
						{foreach $details->specifications as $key => $row}
							{div class="function_document"}
								{h3 class="title"}{$row->name}{/h3}
								{div class="function_content"}
									{div class="function_content-info"}
										{$row->contents}
									{/div}
									{resimg data-image="{$row->image_url}"}
								{/div}
								{p}价格：{span}￥{$row->price}{/span}{a class="click_buy"}点击购买…{/a}{/p}
							{/div}
						{/foreach}
					{/div}
					{div role="tabpanel" class="tab-pane" id="advantage"}
						{div class="advantage_document"}
							{*{h3 class="title"}资源服务{/h3}*}
							{div class="advantage_content"}
								{$details->advantages}
							{/div}
						{/div}
					{/div}
					{div role="tabpanel" class="tab-pane" id="case"}
						{ul}
							{li}
								{div class="case_info"}
									{resimg data-image="case.png"}
									{div class="case_detail"}
										{p class="case_intro"}「 性能与稳定性的功臣，曾经需要高上大的设备与高精尖的人才曾经需要高上大的设备与高精尖的人才曾经需要高上大的设备与高精尖的人才曾经需要高上大的设备与高精尖的人才曾经需要高上大的设备与高精尖的人才曾经需要高上大的设备与高精尖的人才，如今{/p}
									{/div}
								{/div}
							{/li}
							{li}
								{div class="case_info"}
									{resimg data-image="case.png"}
									{div class="case_detail"}
										{p class="case_intro"}「 性能与稳定性的功臣，曾经需要高上大的设备与高精尖的人才，如今鼠....{/p}
									{/div}
								{/div}
							{/li}
							{li}
								{div class="case_info"}
									{resimg data-image="case.png"}
									{div class="case_detail"}
										{p class="case_intro"}「 性能与稳定性的功臣，曾经需要高上大的设备与高精尖的人才，如今鼠....{/p}
									{/div}
								{/div}
							{/li}
							{li}
								{div class="case_info"}
									{resimg data-image="case.png"}
									{div class="case_detail"}
										{p class="case_intro"}「 性能与稳定性的功臣，曾经需要高上大的设备与高精尖的人才，如今鼠....{/p}
									{/div}
								{/div}
							{/li}
						{/ul}
					{/div}
				{/div}

			{/div}
		{/div}
	{/block}