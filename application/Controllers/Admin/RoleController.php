<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * Auto generated controller by Scaffold for table roles.
 *
 * @author Jessica
 * @version 1.0
 * @date Sat Oct 10 15:37:09 2015
 *
 * @Clips\Widget({"html", "lang", "adminlte", "navigation","grid", "scaffold"})
 * @Clips\Model({ "role","permission","rolePermission" })
 * @Clips\DataGenerator()
 */
class RoleController extends BaseController {

	/**
	 * @Clips\Widgets\DataTable("admin_role")
	 * @Clips\Actions("admin/role")
	 */
	public function index() {
		if($this->permission()){
			$this->title("Role List", true);
			return $this->render('admin/role/index');
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("role_create")
	 * @Clips\Scss({"admin/role"})
	 * @Clips\Js({"application/static/js/admin/role"})
	 */
	public function create() {
		if($this->permission()){
			$this->title("Create Role", true);
			$args['permissions'] = $this->permission->get();
			$args['global_permission'] = $this->request->session('global_permission');
			return $this->render('admin/role/create', $args);
		}else{
			return $this->render('admin/error');
		}
	}

	public function hasRole(){
		if($this->role->get(array('role'=>$this->post('role')))){
			echo 'true';
			return;
		}else{
			echo 'false';
			return;
		}
	}

	/**
	 * @Clips\Form("user_create")
	 */
	public function create_form() {
		if($this->role->get(array('role'=>$this->post()['role']))) {
			echo '<script>alert("角色名已存在，请重新设置");window.history.go(-1);</script>';
		}else{
			$rid = $this->role->insert($this->permission->cleanFields('roles',$this->post()));
			$permissions = $this->post('permissions',null);
			if($permissions){
				$this->rolepermission->addFields($rid, $permissions);
			}
			return $this->redirect(\Clips\site_url('admin/role/index'));
		}
	}

	/**
	 * @Clips\Form("role_create")
	 * @Clips\Js({"application/static/js/admin/role2.js"})
	 */
	public function create2() {
		if($this->permission()){
			$this->title("Create Role", true);
			$args['permissions'] = $this->permission->get();
			$args['global_permission'] = $this->request->session('global_permission');
//			var_dump(array('permissions'=>$this->permission->get()));die;
			return $this->render('admin/role/create2',array('permissions'=>$this->permission->get()));
		}else{
			return $this->render('admin/error');
		}
	}

	public function create2_form(){
		$data = $this->post();
		var_dump($data);die;
	}

	/**
	 * @Clips\Form("role_edit")
	 * @Clips\Actions("admin/role")
	 * @Clips\Scss({"admin/role"})
	 */
	public function edit($rid) {
		if($this->permission()){
			$data = $this->role->load($rid);
			$data->{"permissions[]"} = $this->rolepermission->getPermissionsByRoleid($rid);
			$this->formData("role_edit", $data);
			$this->title("Edit User [{$data->role}]", true);
			return $this->render('admin/role/edit',array('permissions'=>$this->permission->get()));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("role_edit")
	 */
	public function edit_form() {
		$data = $this->permission->cleanFields('roles',$this->post());
		$permissions = $this->post('permissions',null);
		$this->role->update((object)$data);
		$this->rolepermission->updateFields($data['id'],$permissions);
		return $this->redirect(\Clips\site_url('admin/role/index'));
	}

	/**
	 * @Clips\Form("role_edit")
	 * @Clips\Actions("admin/role")
	 * @Clips\Scss({"admin/role"})
	 */
	public function show($rid) {
		if($this->permission()){
			$data = $this->role->load($rid);
			$data->{"permissions[]"} = $this->rolepermission->getPermissionsByRoleid($rid);
			$this->formData("role_edit", $data);
			$this->title("Role Details for [{$data->role}]", true);
			return $this->render('admin/role/show', array('permissions'=>$this->permission->get()));
		}else{
			return $this->render('admin/error');
		}
	}

	public function delete($rid) {
		if($this->permission()){
			if($rid) {
				$this->rolepermission->deleteFields($rid);
				$this->role->delete($rid);
				return $this->redirect(\Clips\site_url('admin/role/index'));
			}
		}else{
			return $this->render('admin/error');
		}
	}

}
