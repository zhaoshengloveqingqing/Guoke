{extends file="admin/bootstrap-layout.tpl"}
{block name="toolbar"}
	{a class="btn btn-primary" form-for="user_edit"}
	{lang}update{/lang}
	{/a}
{/block}
{block name="content"}
	{form name="admin/resource/show" state="readonly" enctype="multipart/form-data"}
	{field field="type"}
	{select options=$resourcetypes label-field="type" value-field="id"}
	{/select}
	{/field}
	{foreach $resources as $k=>$v}
		{foreach $v->name as $key=> $value}
		{/foreach}
		{foreach $v->path as $key=> $val}
		{/foreach}
		<div id="uploadContent">
			<br />
			<div id="dts{$k}" style='width:120px; height:100px;'>

				<img img="img" src="../../../../application/static/img/{$val}" width="120" height="100" />
			</div>

			标题：<div id=div1><input id=file1 type=text size=50 name="name[]" value="{$value}"></div>
		</div>
	{/foreach}
	{/form}
{/block}
{block name=foot}
	<script type="text/javascript">
		var count = 0;
		var maxfile = 5;
		function addUpload() {
			if (count >= maxfile) return;
			count++;
			var newDiv = "<div id=divUpload" + count + ">"
					+ " <input id=file" + count + " type=file size=50 name=upload_file[] onchange=PreviewImage(this,'dts" + count +"')>"
					+ "<div id=dts" + count + " style=width:120px; height:100px;>"
					+ "<img id=img" + count + " src=../../../../application/static/img/user2-160x160.jpg width=120 height=100>"
					+ "</div>"
					+ "</br>"
					+ " 标题：<input id=title" + count + " type=text size=50 name=name[]>"
					+ " <a href=javascript:delUpload('divUpload" + count + "');>删除</a>"
					+ " </div>";
			document.getElementById("uploadContent").insertAdjacentHTML("beforeEnd", newDiv);
		}
		function delUpload(diva) {
			count--;
			document.getElementById(diva).parentNode.removeChild(document.getElementById(diva));
		}

		function PreviewImage(imgFile,id)
		{
			var filextension=imgFile.value.substring(imgFile.value.lastIndexOf("."),imgFile.value.length);
			filextension=filextension.toLowerCase();
			if ((filextension!='.jpg')&&(filextension!='.gif')&&(filextension!='.jpeg')&&(filextension!='.png')&&(filextension!='.bmp'))
			{
				alert("对不起，系统仅支持标准格式的照片，请您调整格式后重新上传，谢谢 !");
				imgFile.focus();
			}
			else
			{
				var path;
				if(document.all)//IE
				{
					imgFile.select();
					path = document.selection.createRange().text;
					document.getElementById(id).innerHTML="";
					document.getElementById(id).style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果
				}
				else//FF
				{
					path=window.URL.createObjectURL(imgFile.files[0]);// FF 7.0以上
					//path = imgFile.files[0].getAsDataURL();// FF 3.0
					document.getElementById(id).innerHTML = "<img id="+id+" width='120px' height='100px' src='"+path+"'/>";
					//document.getElementById("img1").src = path;
				}
			}
		}
	</script>
{/block}