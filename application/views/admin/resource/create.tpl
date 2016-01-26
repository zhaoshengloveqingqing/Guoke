{extends file="admin/bootstrap-layout.tpl"}
{block name="toolbar"}
	{a class="btn btn-primary" form-for="user_edit"}
	{lang}update{/lang}
	{/a}
{/block}
{block name="content"}
	{form name="admin/resource/create" state="readonly" enctype="multipart/form-data"}
	{*{field field="id" state="hidden"}{/field}*}
		{*{field field="name"}{/field}*}
		{field field="type"}
			{select options=$resourcetypes label-field="type" value-field="id"}
			{/select}
		{/field}
		<a href="javascript:addUpload()">添加附件</a>
		<!--承接整个file文件框的HTML容器-->
		<div id="uploadContent">
			<input id=file type=file size=50 name="upload_file[]" onchange="PreviewImage(this,document.getElementById('dts').id)" >


			<br />
			<div id="dts" style='width:120px; height:100px;'>
				<img img="img" src="../../../application/static/img/word.jpg" width="120" height="100" />


			</div>
			暂时只支持上传文件格式有：xls,xlsx,doc
			</br>
			标题：<div id=div1><input id=file1 type=text size=50 name="name[]"></div>
		</div>
	{submit value="submit"}
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
					+ "<img id=img" + count + " src=../../../application/static/img/user2-160x160.jpg width=120 height=100>"
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
			var ks=imgFile.value;
			var arr = new Array();
			arr = ks.split(".");
			if(arr.length > 1){
				var result = arr[1].substring(0);
			}
			var filextension=imgFile.value.substring(imgFile.value.lastIndexOf("."),imgFile.value.length);
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
					if(result=='xls'||result=='xlsx'){
						document.getElementById(id).innerHTML = "<img id="+id+" width='120px' height='100px' src='../../../application/static/img/excel.png'/>";
					}
					if(result=='doc'){
						document.getElementById(id).innerHTML = "<img id="+id+" width='120px' height='100px' src='../../../application/static/img/word.jpg'/>";
					}

					//document.getElementById("img1").src = path;
				}

		}
	</script>
{/block}