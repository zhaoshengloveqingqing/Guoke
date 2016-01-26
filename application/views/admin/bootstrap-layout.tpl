{extends file="admin/base-layout.tpl"}
	{block name="main"}
		{div class="wrapper"}
			{header class="main-header"}
				{a uri="/" class="logo"}
					{span class="logo-lg"}
						{b}国科后台管理系统{/b}
					{/span}
				{/a}
			{/header}
			{aside class="main-sidebar"}
				{sect class="sidebar"}
					{div class="user-panel"  style="height:70px"}
						{div class="pull-left info"}
							{p}{$username}{/p}
							{a uri="admin/login/index"}{i class="fa fa-circle text-success"}{/i}退出登录{/a}
						{/div}
					{/div}
				{/sect}
				{navigation class="sidebar-menu" actions=$actions}{/navigation}
				{ul class="sidebar-menu"}
					{li class="active treeview"}
						{a uri="admin/home/index"}
							{i class="fa fa-dashboard"}{/i} {span}欢迎页面{/span} {i class="fa fa-angle-left pull-right"}{/i}
						{/a}
						{*{foreach $global_permissions as $key => $row}*}
							{*{if $key == 'user'}*}
								{*{a uri="admin/user/index"}*}
									{*{i class="fa fa-dashboard"}{/i} {span}用户管理{/span} {i class="fa fa-angle-left pull-right"}{/i}*}
								{*{/a}*}
							{*{elseif $key == 'role'}*}
								{*{a uri="admin/role/index"}*}
									{*{i class="fa fa-dashboard"}{/i} {span}角色管理{/span} {i class="fa fa-angle-left pull-right"}{/i}*}
								{*{/a}*}
							{*{elseif $key == 'banner'}*}
								{*{a uri="admin/banner/index"}*}
									{*{i class="fa fa-dashboard"}{/i} {span}幻灯片管理{/span} {i class="fa fa-angle-left pull-right"}{/i}*}
								{*{/a}*}
							{*{elseif $key == 'partner'}*}
								{*{a uri="admin/partner/index"}*}
									{*{i class="fa fa-dashboard"}{/i} {span}合作伙伴管理{/span} {i class="fa fa-angle-left pull-right"}{/i}*}
								{*{/a}*}
							{*{elseif $key == 'resource'}*}
								{*{a uri="admin/resource/index"}*}
									{*{i class="fa fa-dashboard"}{/i} {span}文档管理{/span} {i class="fa fa-angle-left pull-right"}{/i}*}
								{*{/a}*}
							{*{/if}*}
							{*{a uri="admin/article/index"}*}
								{*{i class="fa fa-dashboard"}{/i} {span}文章管理{/span} {i class="fa fa-angle-left pull-right"}{/i}*}
							{*{/a}*}
						{*{/foreach}*}
						{a uri="admin/user/index"}
							{i class="fa fa-dashboard"}{/i} {span}用户管理{/span} {i class="fa fa-angle-left pull-right"}{/i}
						{/a}
						{a uri="admin/role/index"}
							{i class="fa fa-user"}{/i} {span}角色管理{/span} {i class="fa fa-angle-left pull-right"}{/i}
						{/a}
						{a uri="admin/banner/index"}
							{i class="fa fa-spinner"}{/i} {span}幻灯片管理{/span} {i class="fa fa-angle-left pull-right"}{/i}
						{/a}
						{a uri="admin/partner/index"}
							{i class="fa fa-dashboard"}{/i} {span}合作伙伴管理{/span} {i class="fa fa-angle-left pull-right"}{/i}
						{/a}
						{a uri="admin/resource/index"}
							{i class="fa fa-files-o"}{/i} {span}文件上传{/span} {i class="fa fa-angle-left pull-right"}{/i}
						{/a}
					{/li}
				{/ul}
			{/aside}
			{div class="content-wrapper"}
				{sect class="content-header"}
					{block name="content-header"}
					{/block}
				{/sect}
				{sect class="content"}
					{block name="content"}
					{/block}
				{/sect}
			{/div}
		{/div}
	{/block}
