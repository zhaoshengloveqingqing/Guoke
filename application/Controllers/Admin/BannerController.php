<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");
header("Content-Type: text/html; charset=utf-8");
use Clips\Controller;
use Clips\SimpleAction;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "navigation","grid", "scaffold"})
 * @Clips\Model({ "user","banner","resource"});
 * @Clips\DataGenerator("navi")
*/
class BannerController extends BaseController {

	/**
	 * @Clips\Widgets\DataTable("admin_banner")
	 * @Clips\Actions("admin/banner")
	 */
	public function index() {
		\Clips\add_init_js(<<<T_EXTENDS
function datatable_render_banner_name(data, type, full, meta) {
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

function datatable_render_banner_type(data, type, full, meta) {
		console.info(data);
		if(data==1)
			return   "<h1>首页顶部</h1>";
		else if(data==2)
			return   "<h1>首页底部</h1>";
		else if(data==3)
			return   "<h1>服务中心</h1>";
		else if(data==4)
			return   "<h1>关于我们</h1>";

}
T_EXTENDS
		);
		if($this->permission()){
			$a = new SimpleAction(array('children' => $this->data->navi));
			return $this->render('admin/banner/index', array('actions' => $a->children()));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Widgets\DataTable("admin_banner")
	 */
	public function admin_banner_pagination() {
		$pagination = $this->getPagination('admin_banner');
		$permissions = $this->request->session('global_permissions');
		$pagination->where['type'] = $permissions['banner']['filter'];
		return $this->processPagination($pagination);
	}

	/**
	 * @Clips\Form("admin/banner/create")
	 * @Clips\Actions("banner/partner")
	 * @Clips\Model({"banner","category","image"})
	 * @Clips\Js("application/static/js/public.js")
	 */
	public function create() {
		if($this->permission()){
			$this->title("Create User", true);
			return $this->render('admin/banner/create',array('img_url' =>
				dirname(\Clips\site_url()),'categories'=>$this->category->get(),'banners'=>$this->banner->getBannerTypes()));
		}else{
			return $this->render('admin/error');
		}
	}

	function combine_same_val($array,$start,$key,$newkey){
		static $new;
		foreach($array as $k=>$v){
			if($v[$key]==$start){
				$new[$v[$newkey]][] = $v;
				unset($array[$k]);
				continue;
			}
		}
		sort($array);
		if(count($array)!==0){
			combine_same_val($array,$array[0][$key],$key,$newkey);
		}
		return $new;
	}
	/**
	 * @Clips\Form("admin/banner/create")
	 * @Clips\Model({"banner"})
	 */
	public function create_form() {
		$data = $this->post();
		$resource=$this->banner->one(array('type'=>$data['type']));
		$a =  new \Pinet\Guoke\Controllers\Admin\FileUpload();
		foreach($_FILES['upload_file']['name'] as $k =>$v){
			$file_url[]=$a->upload_img($_FILES['upload_file']['size'][$k],$_FILES['upload_file']['tmp_name'][$k],$_FILES['upload_file']['name'][$k]);
		}
		$titles=$data['title'];
		$s_titles=$data['s_title'];
		$paths=$file_url;
		foreach($titles as $k=>$v){
			$titles[$k]=array('title'=>$titles[$k]);
		}
//		foreach($s_titles as $k=>$v){
//			$s_titles[$k]=array('s_title'=>$titles[$k]);
//		}
		foreach($paths as $k=>$v){
			$paths[$k]=array('path'=>$paths[$k]);
		}
		$tempArr = array();
		foreach($titles as $k=>$v){
			$tempArr[$k] = $k;
		}

		foreach($data['check'] as $k =>$v){
			$check[$k] =substr($data['check'][$k],5);
			if(substr($data['check'][$k],5)==null){
				$check[$k]='0';
			}
//			$check[$k] =substr($data['check'][$k],5);
		}
		if($check[0]=='0'){
			$check;
		}else{
			array_unshift($check,'');
		}

		$checks = $check;
		foreach($paths as $k => $v) {
			if(!array_key_exists($k, $tempArr[$k])) {
				$arr[$k]['title'] = array($titles[$k]['title']);
				$arr[$k]['s_title']=array($s_titles[$k]['s_title']);
				$arr[$k]['path'] = array($paths[$k]['path']);
				$arr[$k]['check'] = array($checks[$k]);
			} else {
				$arr[$k]['path'] = '';
			}
		}

		$paths = $arr;
		$data['contents'] = json_encode($paths);
		$data['title']=json_encode($data['title']);
		$insert_datas['title'] = $data['title'];
		$insert_datas ['contents']= $data['contents'];
		$insert_datas['type'] = $data['type'];
		unset($data['_clips_form']);
//		print_r($insert_datas);die;
		if($resource){
			$insert_datas['id']=$resource->id;
			$result = $this->banner->update((object)$insert_datas);
		}else{
			$this->banner->insertField($insert_datas);
		}
		return $this->redirect(\Clips\site_url('admin/banner/index'));
	}

	/**
	 * @Clips\Model({"banner","resource"})
	 * @Clips\Form("admin/banner/show")
	 * @Clips\Actions("admin/show")
	 */
	public function show($id) {
		if($this->permission()){
			$this->title("User Details for user $id", true);
			$data = $this->banner->load($id);
			$this->formData("admin/banner/show", $data);
			return $this->render('admin/banner/show',array('resourcetypes'=>$this->resource->getResourceTypes(),'banners'=>json_decode($data->contents)));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("admin/banner/edit")
	 * @Clips\Actions("banner/partner")
	 * @Clips\Model({"banner","category","image","resource"})
	 * @Clips\Js("application/static/js/public.js")
	 */
	public function edit($id) {
		if($this->permission()){
			$this->title("Edit User for user $id", true);
			$data = $this->banner->load($id);
			$this->formData("admin/banner/edit", $data);
			$args['resourcetypes'] = $this->resource->getResourceTypes();
			$args['banners'] = json_decode($data->contents);
			$args['id'] = $data->id;
			return $this->render('admin/banner/edit',$args);
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Model({"banner","image"})
	 * @Clips\Form("admin/banner/edit")
	 */
	public function edit_form() {
		$data = $this->post();
		$banners = $this->banner->load($data['id']);
		foreach (json_decode($banners->contents) as $k => $v)
		{
			foreach ($v->title as $key => $value)
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
				$file_url[]=$a->upload_img($_FILES['upload_file']['size'][$k],$_FILES['upload_file']['tmp_name'][$k],$_FILES['upload_file']['name'][$k]);
			}

		}
		$titles=$data['title'];
		$paths=$file_url;
		foreach($titles as $k=>$v){
			$titles[$k]=array('title'=>$titles[$k]);
		}
		foreach($paths as $k=>$v){
			$paths[$k]=array('path'=>$paths[$k]);
		}
		$tempArr = array();
		foreach($titles as $k=>$v){
			$tempArr[$k] = $k;
		}
		foreach($paths as $k => $v) {
			if(!array_key_exists($k, $tempArr[$k])) {
				$arr[$k]['title'] = array($titles[$k]['title']);
				$arr[$k]['path'] = array($paths[$k]['path']);
			} else {
				exit('sdf');
				$arr[$k]['path'] = '';
			}
		}
		$paths = $arr;
		$data['contents'] = json_encode($paths);
		$data['title']=json_encode($data['title']);
		unset($data['_clips_form']);
		$result = $this->banner->update((object)$data);
		if ($result) {
			return $this->redirect(\Clips\site_url("admin/banner/index"));
		} else {
			$this->error('Error in updating user.', 'update');
		}
	}

	/**
	 * @Clips\Model({"banner"})
	 * @Clips\Actions("admin/banner")
	 */
	public function delete($id = null) {
		if($this->permission()){
			if($id) {
				$this->banner->delete($id);
			}
			else {
				$this->banner->delete($this->post('ids'));
			}
			return $this->redirect(\Clips\site_url('admin/banner/index'));
		}else{
			return $this->render('admin/error');
		}
	}
}
