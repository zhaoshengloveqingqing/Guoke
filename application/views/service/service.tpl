{extends file="bootstrap-layout.tpl"}
{block name="main"}
	{div id="workbench"}
		{row}
			{div class="service"}
				{h3}服务中心{/h3}
				{div class="service-info"}
					{ul class="service-info-cont"}
						{li}
							{div class="service-detail"}
								{h2}在线参观{/h2}
								{ul}
									{li}基础设施{/li}
									{li}3D展示{/li}
									{li}公司宣传展示{/li}
									{li}合作伙伴{/li}
								{/ul}
								{a}查看全部{/a}
							{/div}
						{/li}
						{li}
							{div class="service-detail"}
								{h2}产品信息{/h2}
								{ul}
									{li}虚拟服务器{/li}
									{li}空间租赁{/li}
									{li}操作系统{/li}
									{li}私有云{/li}
								{/ul}
								{a}查看全部{/a}
							{/div}
						{/li}
						{li}
							{div class="service-detail"}
								{h2}注册与账户资料{/h2}
								{ul}
									{li}登录云服务管理平台{/li}
									{li}找回密码{/li}
									{li}修改个人资料{/li}
									{li}修改账户邮箱{/li}
								{/ul}
								{a}马上注册{/a}
							{/div}
						{/li}
						{li}
							{div class="service-detail"}
								{h2}新闻与活动{/h2}
								{ul}
									{li}公司动态{/li}
									{li}通知活动{/li}
									{li}行业动态{/li}
									{li}媒体报道{/li}
								{/ul}
								{a}查看全部{/a}
							{/div}
						{/li}
						{li}
							{div class="service-detail"}
								{h2}订单{/h2}
								{ul}
									{li}服务定制{/li}
									{li}查看订单{/li}
									{li}修改订单{/li}
									{li}{/li}
								{/ul}
								{a}进入商城{/a}
							{/div}
						{/li}
						{li}
							{div class="service-detail"}
								{h2}办公流程{/h2}
								{ul}
									{li}访客出入办理流程{/li}
									{li}VIP客户出入办理流程{/li}
									{li}客户工程师出入流程{/li}
									{li}私有云设备迁出与嵌入流程{/li}
								{/ul}
							      	{a}查看全部{/a}
							{/div}
						{/li}
					{/ul}
				{/div}
			{/div}
			{div class="service_content"}
				{div class="data"}
					{div class="service-detail"}
						{h2}资料下载{/h2}
						{ul}
							{li}{a}公司介绍{/a}{/li}
							{li}{a}客服手册{/a}{/li}
							{li}{a}云计算服务订购单{/a}{/li}
							{li}{a}云计算{/a}{/li}
							{li}{a}云计算服务合同模板{/a}{/li}
							{li}{a}云计算服务工作说明书{/a}{/li}
						{/ul}
						{a class="more"}查看更多{/a}
					{/div}
				{/div}
				{div class="visit"}
					{div class="visit-detail"}
						{h2}参观预约{/h2}
						{form}
							{div class="visit-detail-left"}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}联系人{/label}
									{input type="text" class="form-control" placeholder="请输入姓名"}
								{/div}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}联系电话{/label}
									{input type="text" class="form-control" placeholder="请输入联系电话"}
								{/div}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}邮箱{/label}
									{input type="text" class="form-control" placeholder="请输入邮箱"}
								{/div}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}公司名称{/label}
									{input type="text" class="form-control" placeholder="请输入公司名称"}
								{/div}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}公司地址{/label}
									{input type="text" class="form-control" placeholder="请输入公司地址"}
								{/div}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}参观时间{/label}
									{input type="text" class="form-control" placeholder="请输入参观时间"}
								{/div}
							{/div}
							{div class="visit-detail-left"}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}参观人数{/label}
									{input type="text" class="form-control" placeholder="请输入姓名"}
								{/div}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}参观说明{/label}
									{textarea class="form-control" placeholder="请输入相关说明" rows="3"}{/textarea}
								{/div}
								{div class="form-group"}
									{label for="exampleInputName2"}{i}*{/i}验证码{/label}
									{input type="text" class="form-control" placeholder="请输入验证码"}
								{/div}
								{div class="form-group"}
									所有*项必填，否则无法预约
								{/div}
								{a class="more btn"}马上预约{/a}
							{/div}
						{/form}
					{/div}
				{/div}
			{/div}
		{/row}
	{/div}
{/block}