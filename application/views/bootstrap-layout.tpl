{extends file="base-layout.tpl"}
	{block name="head"}
		{header id="header"}
			{div class="top_toolbar"}
				{ul}
					{*{if $username == ''}*}
						{*{li}*}
							{*{a uri="login/index"}{lang}欢迎，请登录{/lang}{/a}*}
						{*{/li}*}
						{*{li}*}
							{*{a class="login"}{lang}注册{/lang}{/a}*}
						{*{/li}*}
					{*{else}*}
						{*{li}*}
							{*{a uri="login/index"}{$username}{/a}*}
						{*{/li}*}
					{*{/if}*}
					{li}
						{a class="language"}{lang}语言{/lang}{i class="caret"}{/i}{/a}
						{ul class="language-downdrop"}
							{li}
								{form name="setLangChinese" method="post" action="home/switch_lang"}
									<input type="hidden"  name="language"  value="zh-CN" />
									<input type="submit"  value="中文"  />
								{/form}
							{/li}
							{li}
								{form name="setLangEnglish" method="post" action="home/switch_lang"}
									<input type="hidden"  name="language"  value="zh-US"   />
									<input type="submit"  value="ENGLISH" />
								{/form}
							{/li}
						{/ul}
					{/li}
					{li}{a class="help"}{lang}帮助中心{/lang}{/a}{/li}
				{/ul}
			{/div}
			{div class="nav-toolbar"}
				{div id="nav"}
					{div class="actionbar__brand"}
						{a uri="/"}{resimg data-image="logo.png"}{/a}
					{/div}
					{navigation id="navigation" class="menu" actions=$navi}{/navigation}
					{form class="actionbar__search-form" name="search" action=''}
						{field field="search"}{/field}
						{label class="submit"}
							{submit id="search-submit"}
						{/label}
					{/form}
					{i class="meun-icon"}{/i}
				{/div}
			{/div}
		{/header}
	{/block}
	{block name="main"}
	{/block}
	{block name="foot"}
		<footer id="footer">
			{div class="footer_content"}
				{div class="footer-links"}
					{ul class="navbar-footer"}
						{li}{a uri="product/index"}{lang}产品&服务{/lang}{/a}{/li}
						{li}{a uri="solution/index"}{lang}解决方案{/lang}{/a}{/li}
						{li}{a uri="service/index"}{lang}服务中心{/lang}{/a}{/li}
						{li}{a uri="about/index"}{lang}关于我们{/lang}{/a}{/li}
					{/ul}
					{div class="footer-copyright"}
						{p}{lang}苏州国科综合数据中心有限公司{/lang}{span}|{/span} 苏ICP备 10037052号-2{/p}
						{p}{lang}信息产业部备案管理系统网址{/lang} www.miitbeian.gov.cn	{/p}
					{/div}
				{/div}
				{div class="footer-share"}
					{a class="logo"}{resimg data-image="logo_control_data.png"}{/a}
					{ul class="share"}
						{li}{a class="weibo"}{resimg data-image="weibo.png"}{/a}{/li}
						{li}{a class="weixin"}{resimg data-image="weixin.png"}{/a}{/li}
					{/ul}
				{/div}
			{/div}
		</footer>
		{div id="right_fixed"}
			{ul}
				{li}{a class="icound top"}{span}{lang}回顶部{/lang}{/span}{i}{/i}{/a}{/li}
				{li}{a class="icound icound_shoppping"}{span}{lang}云商城{/lang}{/span}{i}{/i}{/a}

				{/li}
				{ul class="icound-more"}
					{li}{a class="icound bbs_login"}{span}{lang}BBS登录{/lang}{/span}{i}{/i}{/a}{/li}
					{li}{a class="icound oss_login"}{span}{lang}OSS登录{/lang}{/span}{i}{/i}{/a}{/li}
					{li}{a class="icound register"}{span}{lang}用户注册{/lang}{/span}{i}{/i}{/a}{/li}
					{li}{a class="icound visit"}{span}{lang}参观预约{/lang}{/span}{i}{/i}{/a}{/li}
				{/ul}

			{/ul}
		{/div}
	{/block}
