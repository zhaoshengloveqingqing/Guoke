{extends file="bootstrap-layout.tpl"}
{block name="main"}
{div class="banner"}
	{div class="introduce"}
		{div class="left"}
			{h3}苏州国科数{/h3}
			{p}苏州国科数据中心{/p}
		{/div}
		{div class="right"}
			{p}
				苏州国科数据中心2008年开始立项，2009年着手设计，并在同年下半年动工建设。该数据中心严格按照Tier IV标准设计，采用模块化技术，一期建设规划建筑面积为1.8万平方米，提供1800个左右的机柜，已在2010年10月投入使用；二期规划建筑面积为2.4万平方米，提供2400~2600个左右的机柜，预计将在明年投入使用。
			{/p}
		{/div}
		{div class="clear"}
		{/div}
	{/div}
{/div}
{div class="content-detail swiper-container"}
	{h3}{lang}关于国科{/lang}{/h3}
	{div class="swiper-wrapper"}
		{for $i=1;$i<count($articles)/2+1;$i++}
			{div class="guoke-content swiper-slide"}
				{for $j=0;$j<2;$j++}
					{if ($i-1)*2+$j <= count($articles)-1}
						{if $articles[($i-1)*2+$j]->type == 'video'}
							{if $j%2 == 0}
								{div class="guoke-info video"}
									{div class="guoke-intro"}
										{span class="left"}“{/span}
											{p}{$articles[($i-1)*2+$j]->content}{/p}
										{span class="right"}”{/span}
									{/div}
									{div class="guoke-img"}
										<video src="{$articles[($i-1)*2+$j]->image_url}">
										</video>
									{/div}
								{/div}
							{else}
								{div class="guoke-info video"}
									{div class="guoke-img"}
										<video src="{$articles[($i-1)*2+$j]->image_url}">
										</video>
									{/div}
									{div class="guoke-intro"}
										{span class="left"}“{/span}
											{p}{$articles[($i-1)*2+$j]->content}{/p}
										{span class="right"}”{/span}
									{/div}
								{/div}
							{/if}
						{else}
							{if $j%2 == 0}
								{div class="guoke-info"}
									{div class="guoke-intro"}
										{span class="left"}“{/span}
											{p}{$articles[($i-1)*2+$j]->content}{/p}
										{span class="right"}”{/span}
									{/div}
									{div class="guoke-img"}
										{resimg data-image="{$articles[($i-1)*2+$j]->image_url}"}
									{/div}
								{/div}
							{else}
								{div class="guoke-info"}
								{div class="guoke-img"}
								{resimg data-image="{$articles[($i-1)*2+$j]->image_url}"}
								{/div}
								{div class="guoke-intro"}
								{span class="left"}“{/span}
								{p}{$articles[($i-1)*2+$j]->content}{/p}
								{span class="right"}”{/span}
								{/div}
								{/div}
							{/if}
						{/if}
					{/if}
				{/for}
			{/div}
		{/for}
	{/div}
	{div class="swiper-pagination swiper-pagination1"}{/div}
{/div}
{div class="joinus row-center"}
	{div class="title"}
		{h3}{lang}加入我们{/lang}{/h3}
		{span}{/span}{span}{/span}{span}{/span}
		{a uri='about/join'}{lang}了解更多{/lang}>>{/a}
	{/div}
	{div class="joinus-content row-center-content"}
		{ul}
			{foreach $recruits as $key => $row}
				{if $key <4 }
					{li class="joinus"}
						{a}
							{div class="join-info"}
								{resimg data-image="{$row->image_url}"}
								{p}{$row->title}{span} {$row->datetime}{/span}{/p}
							{/div}
							{div class="join-content"}
								{h4}{lang}岗位要求{/lang}：{/h4}
								{ul}
									{foreach $row->requirement as $id => $value}
										{li}
										{$value}
										{/li}
									{/foreach}
								{/ul}
							{/div}
						{/a}
					{/li}
				{/if}
			{/foreach}
		{/ul}
	{/div}
{/div}
{div class="contact row-center"}
	{div class="title"}
		{h3}{lang}联系我们{/lang}{/h3}
		{span}{/span}{span}{/span}{span}{/span}
	{/div}
	{div class="contact-content row-center-content"}
		{ul}
			{li}
				{div class="contact-info"}
					{p}{lang}公司名称{/lang}：{lang}苏州国科数据有限公司{/lang}{/p}
					{p}{lang}地址{/lang}：{lang}苏州创意产业园{/lang}{/p}
					{p}{lang}电话{/lang}：{lang}025-8745126{/lang}{/p}
					{p}{lang}传真{/lang}：{lang}025-8745123{/lang}{/p}
					{p}{lang}邮编{/lang}：{lang}254125{/lang}{/p}
					{p}{lang}网址{/lang}：{lang}www.guoke.com{/lang}{/p}
				{/div}
			{/li}
			{li}
				{div class="contact-info"}
					{p}{lang}公司名称{/lang}：{lang}苏州国科数据有限公司{/lang}{/p}
					{p}{lang}地址{/lang}：{lang}苏州创意产业园{/lang}{/p}
					{p}{lang}电话{/lang}：025-8745126{/p}
					{p}{lang}传真{/lang}：025-8745123{/p}
					{p}{lang}邮编{/lang}：254125{/p}
					{p}{lang}网址{/lang}：{lang}www.guoke.com{/lang}{/p}
				{/div}
			{/li}
		{/ul}
	{/div}
{/div}
{/block}
