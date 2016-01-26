<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");
header("Content-Type: text/html; charset=utf-8");

use Clips\Controller;
use Clips\SimpleAction;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;


/**
 * @Clips\Widget({"html", "lang", "adminlte", "navigation","grid", "scaffold"})
 * @Clips\Model({ "user","banner"});
 * @Clips\DataGenerator("navi")
 */
class PartnerController extends BaseController {

	/**
	 * @Clips\Widgets\DataTable("admin_partner")
	 * @Clips\Actions("admin/partner")
	 */
	public function index() {
		\Clips\add_init_js(<<<T_EXTENDS
function datatable_render_partner_name(data, type, full, meta) {
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
T_EXTENDS
		);
		if($this->permission()){
			$a = new SimpleAction(array('children' => $this->data->navi));
			return $this->render('admin/partner/index', array('actions' => $a->children()));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("admin/partner/create")
	 * @Clips\Actions("admin/partner")
	 * @Clips\Model({"image","partner"})
	 */
	public function create() {
		if($this->permission()){
			$this->title("Create User", true);
			return $this->render('admin/partner/create',array('img_url' =>
			dirname(\Clips\site_url())));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("admin/partner/create")
	 * @Clips\Model({"partner"})
	 */
	public function create_form() {
		$data = $this->post();
		$a =  new \Pinet\Guoke\Controllers\Admin\FileUpload();
		foreach($_FILES['upload_file']['name'] as $k=>$v){
			$file_url[]=$a->upload_file($_FILES['upload_file']['size'][$k],$_FILES['upload_file']['tmp_name'][$k],$_FILES['upload_file']['name'][$k]);
		}
		$paths=$file_url;
		foreach($paths as $k=>$v){
			$paths[$k]=array('path'=>$paths[$k]);
		}
		$data['company_name']=$data['company_name'];
		$data['logo_path']=json_encode($paths);
		unset($data['_clips_form']);
		$this->partner->insertField($data);
		return $this->redirect(\Clips\site_url('admin/partner/index'));
	}


	/**
	 * @Clips\Model({"partner"})
	 * @Clips\Form("admin/partner/show")
	 */
	public function show($id) {
		if($this->permission()){
			$this->title("User Details for user $id", true);
			$data = $this->partner->load($id);
			$this->formData("admin/partner/show", $data);
			return $this->render('admin/partner/show', array('partners'=>json_decode($data->logo_path)));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Model({"partner","image"})
	 * @Clips\Form("admin/partner/edit")
	 */
	public function edit($id) {
		if($this->permission()){
			$this->title("Edit User for user $id", true);
			$data = $this->partner->load($id);
			$this->formData("admin/partner/edit", $data);
			$args['partners']= json_decode($data->logo_path);
			$args['id'] = $data->id;
			return $this->render('admin/partner/edit',$args);
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Model({"partner"})
	 * @Clips\Form("admin/partner/edit")
	 */
	public function edit_form() {

		$data = $this->post();
		$partners = $this->partner->load($data['id']);
		foreach (json_decode($partners->logo_path) as $k => $v)
		{
			$ks[]=$v->path;
		}

		$a =  new \Pinet\Guoke\Controllers\Admin\FileUpload();
		foreach($_FILES['upload_file']['name'] as $k=>$v){
			if($_FILES['upload_file']['name'][$k]==null){
				$file_url=$ks;
			}else{
				$file_url[]=$a->upload_img($_FILES['upload_file']['size'][$k],$_FILES['upload_file']['tmp_name'][$k],$_FILES['upload_file']['name'][$k]);
			}

		}
		$paths=$file_url;
		foreach($paths as $k=>$v){
			$paths[$k]=array('path'=>$paths[$k]);
		}
		$data['company_name']=$data['company_name'];
		$data['logo_path']=json_encode($paths);
		unset($data['_clips_form']);
		$result = $this->partner->update((object)$data);
		if ($result) {
			return $this->redirect(\Clips\site_url("admin/partner/index"));
		} else {
			$this->error('Error in updating user.', 'update');
		}
	}

	/**
	 * @Clips\Model({"partner"})
	 * @Clips\Actions("admin/partner")
	 */
	public function delete($id = null) {
		if($this->permission()){
			if($id) {
				$this->partner->delete($id);
			}
			else {
				$this->partner->delete($this->post('ids'));
			}
			return $this->redirect(\Clips\site_url('admin/partner/index'));
		}else{
			return $this->render('admin/error');
		}
	}


}
