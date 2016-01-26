<?php namespace Clips\Web\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;

/**
 * Auto generated controller by Scaffold for table groups.
 *
 * @author Jack
 * @version 1.0
 * @date Mon Mar 30 19:39:09 2015
 *
 * @Clips\Widget({"html", "lang", "grid", "scaffold"})
 * @Clips\Model({ "group" });
 */
class GroupController extends Controller {

	/**
	 * @Clips\Widgets\DataTable("group")
	 * @Clips\Actions("group")
	 */
	public function index() {
		$this->title("Group List", true);
		return $this->render('group/index');
	}

	/**
	 * @Clips\Form("group_edit")
	 * @Clips\Actions("group")
	 */
	public function show($id) {
		$this->title("Group Details for group $id", true);
		$data = $this->group->load($id);
		$this->formData("group_edit", $data);
		$args = array();
		$args['data'] = $data;
		$args['id'] = $id;
		return $this->render('group/show', $args);
	}

	/**
	 * @Clips\Form("group_create")
	 * @Clips\Actions("group")
	 */
	public function create() {
		$this->title("Create Group", true);
		return $this->render('group/create', array());
	}

	/**
	 * @Clips\Form("group_create")
	 */
	public function create_form() {
		$this->group->insert($this->group->cleanFields('groups', $this->post()));
		return $this->redirect(\Clips\site_url('group/index'));
	}

	/**
	 * @Clips\Form("group_edit")
	 * @Clips\Actions("group")
	 */
	public function edit($id) {
		$this->title("Edit Group for group $id", true);
		$data = $this->group->load($id);
		$this->formData("group_edit", $data);
		return $this->render('group/edit', array());
	}

	/**
	 * @Clips\Form("group_edit")
	 */
	public function edit_form() {
		$data = $this->group->cleanFields('groups', $this->post());
		$result = $this->group->update((Object)$data);
		if ($result) {
			return $this->redirect(\Clips\site_url("group/index"));
		} else {
			$this->error('Error in updating group.', 'update');
		}
	}

	public function delete($id = null) {
		if($id) {
			$this->group->delete($id);
		}
		else {
			 $this->group->delete($this->post('ids'));
		}
		return $this->redirect(\Clips\site_url('group/index'));
	}
}
