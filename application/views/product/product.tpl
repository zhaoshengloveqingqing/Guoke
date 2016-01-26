{extends file="category-layout.tpl"}
	{block name="main_content" append}
		{div class="data-control"}
			{h3 class="title"}
				{lang}苏州国科数据中心产品结构标题{/lang}
			{/h3}
			{resimg data-image="product/structure.png"}
		{/div}
		{div class="data-control"}
			{h3 class="title"}
				{lang}苏州国科数据中心云产品{/lang}
				{a}{lang}云商城{/lang}>>{/a}
			{/h3}
			{ul class="icolud-product"}
				{li}
					{a}
						{h4}{lang}计算{/lang}{/h4}
						{span}{lang}虚拟服务器{/lang}{/span}
						{span}{lang}空间租赁{/lang}{/span}
						{i class="product-icon icon-calculate"}{/i}
					{/a}
				{/li}
				{li}
					{a}
						{h4}{lang}存储{/lang}{/h4}
						{span}{lang}备份数据{/lang}{/span}
						{span}{lang}灾难数据{/lang}{/span}
						{i class="product-icon icon-storage"}{/i}
					{/a}
				{/li}
				{li}
					{a}
						{h4}{lang}网络{/lang}{/h4}
						{span}{lang}公有网络{/lang}{/span}
						{span}{lang}私有网络{/lang}{/span}
						{span}{lang}虚拟网关{/lang}{/span}
						{span}{lang}负载均衡{/lang}{/span}
						{i class="product-icon icon-network"}{/i}
					{/a}
				{/li}
				{li}
					{a}
						{h4}{lang}安全{/lang}{/h4}
						{span}{lang}漏洞扫描{/lang}{/span}
						{i class="product-icon icon-security"}{/i}
					{/a}
				{/li}
				{li}
					{a}
						{h4}{lang}软件{/lang}{/h4}
						{span}{lang}操作系统{/lang}{/span}
						{i class="product-icon icon-software"}{/i}
					{/a}
				{/li}
				{li}
					{a}
						{h4}{lang}管理{/lang}{/h4}
						{span}{lang}私有云管理{/lang}{/span}
						{i class="product-icon icon-management"}{/i}
					{/a}
				{/li}
			{/ul}
		{/div}
	{/block}
