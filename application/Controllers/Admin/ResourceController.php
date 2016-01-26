<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");
header("Content-Type: text/html;charset=utf-8");
use Clips\Controller;
use Clips\SimpleAction;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "navigation","grid", "scaffold"})
 * @Clips\Model({ "user","banner","resource"});
 * @Clips\DataGenerator("navi")
 */
class ResourceController extends BaseController {

//	/**
//	 * @Clips\Widgets\DataTable("admin_resource")
// 	*/
//	public function admin_resource_pagination()
//	{
//		$pagination = $this->getPagination('admin_resource');
//		$pagination->where['id'] = 1;
//		return $this->processPagination($pagination);
//	}

	/**
	 * @Clips\Widgets\DataTable("admin_resource")
	 * @Clips\Actions("admin/resource")
	 */
	public function index() {
		$data = $this->resource->getResourceTypes();
		\Clips\add_init_js(<<<T_EXTENDS
function datatable_render_resource_name(data, type, full, meta) {
	var json = JSON.parse(data);
	console.info(json);
	var ul = [];
	var i = 0;
	for(i = 0; i < json.length; i++) {
		ul.push('<br />'+'<li style="list-style-type:none"><img src="'+Clips.staticUrl('application/static/img/' + json[i]['path'])+'" width=100 height=100></li>');
		ul.push();
	}
	return "<ul>" + ul.join("") + "</ul>";
}
function datatable_render_resource_type(data, type, full, meta) {
		console.info(data);
		if(data==1)
			return   "<h1>资料下载</h1>";

}
T_EXTENDS
);
		if($this->permission()){
			$a = new SimpleAction(array('children' => $this->data->navi));
			return $this->render('admin/resource/index', array('actions' => $a->children()));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("admin/resource/create")
	 * @Clips\Actions("admin/resource/create")
	 * @Clips\Model({"resource","category"})
	 */
	public function create() {
		if($this->permission()){
			$this->title("Create User", true);
			return $this->render('admin/resource/create',array('resourcetypes'=>array(array('type'=>'资料下载','id'=>'1')),'img_url'=>dirname(\Clips\site_url())));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("admin/resource/create")
	 * @Clips\Model({"resource"})
	 */
	public function create_form() {
		$data = $this->post();
		$resource=$this->resource->one(array('type'=>$data['type']));
		$a =  new \Pinet\Guoke\Controllers\Admin\FileUpload();
		foreach($_FILES['upload_file']['name'] as $k=>$v){
			$file_url[]=$a->upload_file($_FILES['upload_file']['size'][$k],$_FILES['upload_file']['tmp_name'][$k],$_FILES['upload_file']['name'][$k],"resources");
		}
		$names=$data['name'];
		$paths=$file_url;

		foreach($names as $k=>$v){
			$names[$k]=array('name'=>$names[$k]);
		}
		foreach($paths as $k=>$v){
			$paths[$k]=array('path'=>$paths[$k]);
		}
		$tempArr = array();
		foreach($names as $k=>$v){
			$tempArr[$k] = $k;
		}
		foreach($paths as $k => $v) {
			if(!array_key_exists($k, $tempArr[$k])) {
				$arr[$k]['name'] = array($names[$k]['name']);
				$arr[$k]['path'] = array($paths[$k]['path']);
			} else {
				$arr[$k]['path'] = '';
			}
		}
		foreach($paths as $k => $v) {
			if(!array_key_exists($k, $tempArr[$k])) {
				$thumbnail[$k]['name'] = array($names[$k]['name']);
				$img_url[$k] = pathinfo(array($paths[$k]['path'])[0])['extension'];
				if($img_url[$k]=='xls'||$img_url[$k]=='xlsx'){
					$thumbnail[$k]['path'][0] ='excel.png';
				}
				if($img_url[$k]=='doc'){
					$thumbnail[$k]['path'][0] = 'word.jpg';
				}

			} else {
				$thumbnail[$k]['path'] = '';
			}
		}
		$paths = $arr;
		$data['path'] = json_encode($paths);
		$data['name']=json_encode($data['name']);
		$data['thumbnail']=json_encode($thumbnail);
		unset($data['_clips_form']);
		$this->resource->insertField($data);
		return $this->redirect(\Clips\site_url('admin/resource/index'));
	}


	/**
	 * @Clips\Model({"resource"})
	 * @Clips\Form("admin/resource/show")
	 * @Clips\Actions("admin/resource/show")
	 */
	public function show($id) {
		if($this->permission()){
			$this->title("User Details for user $id", true);
			$data = $this->resource->load($id);
			$this->formData("admin/resource/show", $data);
			return $this->render('admin/resource/show',array('resourcetypes'=>array(array('type'=>'资料下载','id'=>'1')),'resources'=>json_decode($data->thumbnail)));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Model({"resource","image","category"})
	 * @Clips\Form("admin/resource/edit")
	 * @Clips\Actions("user")
	 */
	public function edit($id) {
		if($this->permission()){
			$this->title("Edit User for user $id", true);
			$data = $this->resource->load($id);
//			print_r(json_decode($data->thumbnail));die;
			$this->formData("admin/resource/edit", $data);
			return $this->render('admin/resource/edit',array('resourcetypes'=>array(array('type'=>'资料下载','id'=>'1')),'datas'=>$data,
				'resources'=>json_decode($data->thumbnail)));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Model({"resource",'image'})
	 * @Clips\Form("admin/resource/edit")
	 */
	public function edit_form()
	{
		$data = $this->post();
		$resources = $this->resource->load($data['id']);
		foreach (json_decode($resources->thumbnail) as $k => $v)
		{
			foreach ($v->name as $key => $value)
			foreach ($v->path as $key => $val)
			{
				$ks[]=$val;
			}
		}
		$a =  new \Pinet\Guoke\Controllers\Admin\FileUpload();
		foreach($_FILES['upload_file']['name'] as $k=>$v){
			if($_FILES['upload_file']['name'][$k]==null){
				$file_url=$ks;
			}else{
				$file_url[]=$a->upload_file($_FILES['upload_file']['size'][$k],$_FILES['upload_file']['tmp_name'][$k],$_FILES['upload_file']['name'][$k]);
			}

		}
		$names=$data['name'];
		$paths=$file_url;
		foreach($names as $k=>$v){
			$names[$k]=array('name'=>$names[$k]);
		}
		foreach($paths as $k=>$v){
			$paths[$k]=array('path'=>$paths[$k]);
		}
		$tempArr = array();
		foreach($names as $k=>$v){
			$tempArr[$k] = $k;
		}
		foreach($paths as $k => $v) {
			if(!array_key_exists($k, $tempArr[$k])) {
				$arr[$k]['name'] = array($names[$k]['name']);
				$arr[$k]['path'] = array($paths[$k]['path']);
			} else {
				$arr[$k]['path'] = '';
			}
		}
		$paths = $arr;
		$data['path'] = json_encode($paths);
		$data['name']=json_encode($data['name']);
		$data['thumbnail']=json_encode($paths);
		unset($data['_clips_form']);
		$result = $this->resource->update((object)$data);
		if ($result) {
			return $this->redirect(\Clips\site_url("admin/resource/index"));
		} else {
			$this->error('Error in updating user.', 'update');
		}
	}

	/**
	 * @Clips\Model({"resource"})
	 * @Clips\Form("admin/resource/edit")
	 * @Clips\Actions("admin/resource")
	 */
	public function delete($id = null) {
		if($this->permission()){
			if($id) {
				$this->resource->delete($id);
			}
			else {
				$this->resource->delete($this->post('ids'));
			}
			return $this->redirect(\Clips\site_url('admin/resource/index'));
		}else{
			return $this->render('admin/error');
		}
	}
}
