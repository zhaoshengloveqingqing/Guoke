<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * Auto generated controller by Scaffold for table users.
 *
 * @author Jessica
 * @version 1.0
 * @date Fri Oct 9 14:39:09 2015
 *
 * @Clips\Widget({"html", "lang", "adminlte", "navigation","grid", "scaffold"})
 * @Clips\Model({ "article","user","userRole"});
 * @Clips\DataGenerator()
 */
class ArticleController extends BaseController {

	/**
	 * @Clips\Widgets\DataTable("admin_article")
	 * @Clips\Actions("admin/article")
	 */
	public function index() {
		$this->title("User List", true);
		return $this->render('admin/article/index');
	}

	/**
	 * @Clips\Form("admin/article/create")
	 * @Clips\Scss({"admin/user"})
	 */
	public function create() {
		$this->title("Create Article", true);
		return $this->render('admin/article/create', array('articletypes'=>$this->article->getArticleTypes()));
	}

	/**
	 * @Clips\Form("user_create")
	 */
	public function create_form() {
		$uid = $this->user->insert($this->role->cleanFields('users',$this->post()));
		$roles = $this->post('roles',null);
		if($roles){
			$this->userrole->addFields($uid, $roles);
		}
		return $this->redirect(\Clips\site_url('admin/user/index'));
	}

	/**
	 * @Clips\Form("user_edit")
	 * @Clips\Actions("admin/user")
	 */
	public function edit($uid) {
		if($this->permission()){
			$data = $this->user->load($uid);
			$data->{"roles[]"} = $this->userrole->getRolesByUserid($uid);
			$this->formData("user_edit", $data);
			$this->title("Edit User [{$data->username}]", true);
			return $this->render('admin/user/edit',array('roles'=>$this->role->get()));
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("user_edit")
	 */
	public function edit_form() {

		$data = $this->role->cleanFields('users',$this->post());
		$roles = $this->post('roles',null);
		$this->user->update((object)$data);
		$this->userrole->updateFields($data['id'],$roles);
		return $this->redirect(\Clips\site_url('admin/user/index'));
	}

	/**
	 * @Clips\Form("user_edit")
	 * @Clips\Actions("admin/user")
	 */
	public function show($uid) {
		if($this->permission()){
			$data = $this->user->load($uid);
			$this->title("User Details for [{$data->username}]", true);
			$data->{"roles[]"} = $this->userrole->getRolesByUserid($uid);
			$this->formData("user_edit", $data);
			return $this->render('admin/user/show', array('uid'=>$uid,'roles'=>$this->role->get()));
		}else{
			return $this->render('admin/error');
		}
	}

	public function delete($uid) {
		if($this->permission()){
			if($uid) {
				$this->userrole->deleteFields($uid);
				$this->user->delete($uid);
				return $this->redirect(\Clips\site_url('admin/user/index'));
			}
		}else{
			return $this->render('admin/error');
		}
	}

}
