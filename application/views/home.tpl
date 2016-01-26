{extends file="bootstrap-layout.tpl"}
	{block name="main"}
		{div class="swiper-container swiper-banner"}
			{div class="swiper-wrapper res-row"}
				{foreach $banners as $key => $row}
					{foreach $row->title as $val}
						{div class="swiper-slide  swiper-content"}
							{div class="content_details"}
								{h3}{$val}{/h3}
								{p}
									ggggggggggg
								{/p}
								{a}{lang}查看详情{/lang}{/a}
							{/div}
						{/div}
					{/foreach}
				{/foreach}
			{/div}
			{div class="swiper-pagination"}{/div}
			{div class="swiper-button-prev"}{/div}
			{div class="swiper-button-next"}{/div}
		{/div}
		{div id="news"}
			{ul class="res-row"}
				{foreach $bannerNews as $key => $row}
					{li}
						{a uri="service/news_detail/{$row->id}"}· [{$row->release_date}] {$row->title} {/a}
					{/li}
				{/foreach}
			{/ul}
		{/div}
		{div class="res-row cont_row" id="products_services"}
			{div class="title"}
				{h1}{lang}PRODUCTS & SERVICES{/lang}{/h1}
				{if $languageId != 2}
					{span}{lang}产品&服务{/lang}{/span}
					{*{resimg data-image="uploads/pig.png"}*}
				{/if}
			{/div}
			{ul}
				{li}
					{div class="products"}
						{div class="products-info calculate-info"}
							{a}
								{resimg data-image="home/calculate.png"}
								{h4}
									{span}{lang}计算{/lang}{/span}
									{if $languageId != 2}
										{span}calculate{/span}
									{/if}
								{/h4}
							{/a}
						{/div}
						{div class="products-details calculate-details"}
							{div class="title"}
								{resimg data-image="home/calculate_hover.png"}
								{h4}
									{span}{lang}计算{/lang}{/span}
									{if $languageId != 2}
										{span}calculate{/span}
									{/if}
								{/h4}
							{/div}
							{div class="products-details-content"}
								{ul}
									{li}{lang}公共网络宽带服务{/lang}{/li}
									{li}{lang}公共网络IP地址服务{/lang}{/li}
									{li}{lang}公共网络接入端口服务{/lang}{/li}
									{li}{lang}安全服务{/lang}{/li}
									{li}{a uri="product/detail/1" class="more-detail"}{lang}了解更多{/lang}{/a}{/li}
								{/ul}
							{/div}
						{/div}
					{/div}
				{/li}
				{li}
					{div class="products"}
						{div class="products-info storage-info"}
							{a}
								{resimg data-image="home/storage.png"}
								{h4}
								{span}{lang}存储{/lang}{/span}
								{if $languageId != 2}
									{span}storage{/span}
								{/if}
								{/h4}
							{/a}
						{/div}
						{div class="products-details storage-details"}
							{div class="title"}
								{resimg data-image="home/storage_hover.png"}
								{h4}
									{span}{lang}存储{/lang}{/span}
									{if $languageId != 2}
										{span}storage{/span}
									{/if}
								{/h4}
							{/div}
							{div class="products-details-content"}
								{ul}
									{li}{lang}公共网络宽带服务{/lang}{/li}
									{li}{lang}公共网络IP地址服务{/lang}{/li}
									{li}{lang}公共网络接入端口服务{/lang}{/li}
									{li}{lang}安全服务{/lang}{/li}
								{li}{a uri="product/detail/3" class="more-detail"}{lang}了解更多{/lang}{/a}{/li}
								{/ul}
							{/div}
						{/div}
					{/div}
				{/li}
				{li}
					{div class="products"}
						{div class="products-info network-info"}
							{a}
								{resimg data-image="home/network.png"}
								{h4}
								{span}{lang}网络{/lang}{/span}
								{if $languageId != 2}
									{span}network{/span}
								{/if}
								{/h4}
							{/a}
						{/div}
						{div class="products-details network-details"}
							{div class="title"}
								{resimg data-image="home/network_hover.png"}
								{h4}
									{span}{lang}网络{/lang}{/span}
									{if $languageId != 2}
										{span}network{/span}
									{/if}
								{/h4}
							{/div}
							{div class="products-details-content"}
								{ul}
									{li}{lang}公共网络宽带服务{/lang}{/li}
									{li}{lang}公共网络IP地址服务{/lang}{/li}
									{li}{lang}公共网络接入端口服务{/lang}{/li}
									{li}{lang}安全服务{/lang}{/li}
									{li}{a uri="product/detail/5" class="more-detail"}{lang}了解更多{/lang}{/a}{/li}
								{/ul}
							{/div}
						{/div}
					{/div}
				{/li}
				{li}
					{div class="products"}
						{div class="products-info security-info"}
							{a}
								{resimg data-image="home/security.png"}
								{h4}
									{span}{lang}安全{/lang}{/span}
									{if $languageId != 2}
										{span}security{/span}
									{/if}
								{/h4}
							{/a}
						{/div}
						{div class="products-details security-details"}
							{div class="title"}
								{resimg data-image="home/security_hover.png"}
								{h4}
									{span}{/span}
									{if $languageId != 2}
										{span}{lang}安全{/lang}{/span}
									{/if}
								{/h4}
							{/div}
							{div class="products-details-content"}
								{ul}
									{li}{lang}公共网络宽带服务{/lang}{/li}
									{li}{lang}公共网络IP地址服务{/lang}{/li}
									{li}{lang}公共网络接入端口服务{/lang}{/li}
									{li}{lang}安全服务{/lang}{/li}
									{li}{a uri="product/detail/8" class="more-detail"}{lang}了解更多{/lang}{/a}{/li}
								{/ul}
							{/div}
						{/div}
					{/div}
				{/li}
				{li}
					{div class="products"}
						{div class="products-info software-info"}
							{a}
								{resimg data-image="home/software.png"}
								{h4}
									{span}{lang}软件{/lang}{/span}
									{if $languageId != 2}
										{span}software{/span}
									{/if}
								{/h4}
							{/a}
						{/div}
						{div class="products-details software-details"}
							{div class="title"}
								{resimg data-image="home/software_hover.png"}
								{h4}
									{span}{lang}软件{/lang}{/span}
									{if $languageId != 2}
										{span}software{/span}
									{/if}
								{/h4}
							{/div}
							{div class="products-details-content"}
								{ul}
									{li}{lang}公共网络宽带服务{/lang}{/li}
									{li}{lang}公共网络IP地址服务{/lang}{/li}
									{li}{lang}公共网络接入端口服务{/lang}{/li}
									{li}{lang}安全服务{/lang}{/li}
									{li}{a uri="product/detail/9" class="more-detail"}{lang}了解更多{/lang}{/a}{/li}
								{/ul}
							{/div}
						{/div}
					{/div}
				{/li}
				{li}
					{div class="products"}
						{div class="products-info management-info"}
							{a}
								{resimg data-image="home/management.png"}
								{h4}
									{span}{lang}管理{/lang}{/span}
									{if $languageId != 2}
										{span}management{/span}
									{/if}
								{/h4}
							{/a}
						{/div}
						{div class="products-details management-details"}
							{div class="title"}
								{resimg data-image="home/management_hover.png"}
								{h4}
									{span}{lang}管理{/lang}{/span}
									{if $languageId != 2}
										{span}management{/span}
									{/if}
								{/h4}
							{/div}
							{div class="products-details-content"}
								{ul}
									{li}{lang}公共网络宽带服务{/lang}{/li}
									{li}{lang}公共网络IP地址服务{/lang}{/li}
									{li}{lang}公共网络接入端口服务{/lang}{/li}
									{li}{lang}安全服务{/lang}{/li}
									{li}{a uri="product/detail/10" class="more-detail"}{lang}了解更多{/lang}{/a}{/li}
								{/ul}
							{/div}
						{/div}
					{/div}
				{/li}
				{li}
					{div class="products"}
						{div class="products-info more-info"}
							{a}
								{resimg data-image="home/more.png"}
								{h4}
									{span}{lang}更多{/lang}{/span}
									{if $languageId != 2}
										{span}More{/span}
									{/if}
								{/h4}
							{/a}
						{/div}
						{div class="products-details more-details"}
							{div class="title"}
								{resimg data-image="home/more_hover.png"}
								{h4}
									{span}{lang}更多{/lang}{/span}
									{if $languageId != 2}
										{span}More{/span}
									{/if}
								{/h4}
							{/div}
							{div class="products-details-content"}
								{ul}
									{li}{lang}公共网络宽带服务{/lang}{/li}
									{li}{lang}公共网络IP地址服务{/lang}{/li}
									{li}{lang}公共网络接入端口服务{/lang}{/li}
									{li}{lang}安全服务{/lang}{/li}
									{li}{a class="more-detail"}{lang}了解更多{/lang}{/a}{/li}
								{/ul}
							{/div}
						{/div}
					{/div}
				{/li}
				{li class="more"}
					{a}
						{span}更多...{/span}
					{/a}
				{/li}
				{div class="clear"}{/div}
			{/ul}
		{/div}
		{div class="res-row cont_row" id="support"}
			{div class="title"}
				{h1}SUPPORT{/h1}
				{if $languageId != 2}
					{span}服务中心{/span}
				{/if}
			{/div}
			{ul}
				{li}
					{a uri="service/index"}{i class="telephone"}{/i}{lang}新闻中心{/lang}{/a}
				{/li}
				{li}
					{a}{i class="put_files"}{/i}{lang}备案服务{/lang}{/a}
				{/li}
				{li}
					{a uri="service/download"}{i class="download"}{/i}{lang}资料下载{/lang}{/a}
				{/li}
				{div class="clear"}{/div}
			{/ul}
		{/div}
		{div id="support-banner" class="swiper-content"}
			{div class="support-banner-detail content_details res-row"}
				{h3}gggggg{/h3}
				{p}
					ggggggggggg
				{/p}
				{a}{lang}查看详情{/lang}{/a}
			{/div}
		{/div}
		{div class="res-row cont_row" id="partners"}
			{div class="title"}
				{h1}PARTNERS{/h1}
				{if $languageId != 2}
					{span}合作伙伴{/span}
				{/if}
			{/div}
			{div class="swiper-container partners-content"}
				{div class="swiper-wrapper"}
					{for $i=1;$i<count($partners)/12+1;$i++}
						{ul class="swiper-slide"}
							{for $j=0;$j<12;$j++}
								{if ($i-1)*12+$j <= count($partners)-1}
									{li}
										{a}
											{resimg data-image="{$partners[($i-1)*12+$j]->logo_path}"}
										{/a}
									{/li}
								{/if}
							{/for}
						{/ul}
					{/for}

				{/div}
				{div class="swiper-pagination swiper-pagination1"}{/div}
			{/div}
		{/div}
	{/block}