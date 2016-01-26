<?php namespace Clips\Web\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;

/**
 * Auto generated controller by Scaffold for table users.
 *
 * @author Jack
 * @version 1.0
 * @date Mon Mar 30 19:39:09 2015
 *
 * @Clips\Widget({"html", "lang", "adminlte", "navigation"})
 * @Clips\Model({ "user", "role" });
 * @Clips\DataGenerator()
 */
class UserController extends Controller {

	/**
	 * @Clips\Widgets\DataTable("user")
	 * @Clips\Actions("user")
	 */
	public function index() {
		$this->title("User List", true);
		return $this->render('admin/user/index');
	}

	/**
	 * @Clips\Form("user_edit")
	 * @Clips\Actions("user")
	 */
	public function show($id) {
		$this->title("User Details for user $id", true);
		$data = $this->user->load($id);
		$this->formData("user_edit", $data);
		$args = array('groups' => $this->group->get());
		$args['data'] = $data;
		$args['id'] = $id;
		return $this->render('user/show', $args);
	}

	/**
	 * @Clips\Actions("user")
	 */
	public function create() {
		$this->title("Create User", true);
		return $this->render('user/create', array('roles' => $this->role->get()));
	}

	/**
	 * @Clips\Form("admin/user/create")
	 */
	public function create_form() {
		$this->user->insert($this->user->cleanFields('users', $this->post()));
		return $this->redirect(\Clips\site_url('user/index'));
	}

	/**
	 * @Clips\Form("user_edit")
	 * @Clips\Actions("user")
	 */
	public function edit($id) {
		$this->title("Edit User for user $id", true);
		$data = $this->user->load($id);
		$this->formData("user_edit", $data);
		return $this->render('user/edit', array('groups' => $this->group->get()));
	}

	/**
	 * @Clips\Form("user_edit")
	 */
	public function edit_form() {
		$data = $this->user->cleanFields('users', $this->post());
		$result = $this->user->update((Object)$data);
		if ($result) {
			return $this->redirect(\Clips\site_url("user/index"));
		} else {
			$this->error('Error in updating user.', 'update');
		}
	}

	public function delete($id = null) {
		if($id) {
			$this->user->delete($id);
		}
		else {
			 $this->user->delete($this->post('ids'));
		}
		return $this->redirect(\Clips\site_url('user/index'));
	}
}
