{extends file="base-layout.tpl"}
	{block name="head"}
		{header id="header"}
			{div class="top_toolbar"}

				{ul}
					{li}
						{a}国科平台首页{/a}
					{/li}
					{li}
						{a}云服务管理平台{/a}
					{/li}
					{li}{a class="help"}帮助中心{/a}{/li}
				{/ul}
			{/div}
			{div class="nav-toolbar"}
				{div id="nav"}
					{div class="actionbar__brand"}
						{a uri="/"}{resimg data-image="logo.png"}{/a}
					{/div}
					{h3 class="login"}
						账号登陆
					{/h3}
					{form class="actionbar__search-form" name="search"}
						{field field="search"}{/field}
						{label class="submit"}
							{submit id="search-submit"}
						{/label}
					{/form}
				{/div}
			{/div}
		{/header}
	{/block}
	{block name="main"}
		{div class="swiper-container"}
			{div class="swiper-wrapper"}
				{div class="swiper-slide login_banner1"}
				{/div}
				{div class="swiper-slide login_banner2"}
				{/div}
			{/div}
			{div class="swiper-button-prev"}{/div}
			{div class="swiper-button-next"}{/div}
		{/div}
		{div id="login"}
			{div class="form-login"}
				{form class="login-content" name="login/index" method="post" action="login/index"}
					{field field="username"}{/field}
					{field field="password"}{/field}
					{p class="forget"}忘记登录名或密码？{/p}
					{field class="code" field="code"}{/field}
					{div class="code-content"}
						{span id="checkCode"}<img style="-webkit-user-select: none" src="">{/span}
						{a uri=''}点击刷新{/a}
					{/div}
					{div class="deal"}
						{label}
							<input type="checkbox"> 我已同意并阅读《国科云服务协议》
						{/label}
					{/div}
					{submit class="login-btn" value="登 录"}
					{a class="register"}免费注册{/a}
					{div class="qr-image"}
						{a}{/a}
					{/div}
				{/form}
			{/div}
			{div class="qr-login"}
				{resimg data-image="login/weixin.png"}
				{p}用时空令扫描动态二维码安全登录{a}（点击下载）{/a}{/p}
				{submit class="back-btn" value="返 回"}
			{/div}
		{/div}
	{/block}
	{block name="foot"}
		<footer id="footer">
			{div class="footer_content"}
				{div class="footer-links"}
					{ul class="navbar-footer"}
						{li}{a href="#"}产品&服务{/a}{/li}
						{li}{a href="#"}解决方案{/a}{/li}
						{li}{a href="#"}服务中心{/a}{/li}
						{li}{a href="#"}关于我们{/a}{/li}
					{/ul}
					{div class="footer-copyright"}
						{p}苏州国科综合数据中心有限公司{span}|{/span} 苏ICP备 10037052号-2{/p}
						{p}信息产业部备案管理系统网址 www.miitbeian.gov.cn	{/p}
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
	{/block}
