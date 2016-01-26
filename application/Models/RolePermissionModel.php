<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table role_permission
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Oct 8 11:19:00 2015
 *
 * @Clips\Model(table="role_permission")
 */
class RolePermissionModel extends DBModelV2 {

	public function addFields($rid,$permissions){
		foreach($permissions as $pid){
			$this->insert(array('role_id' => $rid,'permission_id' => $pid));
		}
	}

	public function getPermissionsByRoleid($rid){
		$result = $this->get(array('role_id'=>$rid));
		if($result) {
			return array_map(function($item){
				return $item->permission_id;
			}, $result);
		}
		return array();
	}

	public function updateFields($rid,$permissions){
		$result = $this->get(array('role_id'=>$rid));
		if($result){
			foreach($result as $key => $row){
				$this->delete(array('id'=>$row->id));
			}
		}
		if($permissions){
			foreach($permissions as $val) {
				$this->insert(array('role_id' => $rid, 'permission_id' => $val));
			}
		}
	}

	public function deleteFields($rid){
		$permissions = $this->get(array('role_id'=>$rid));
		foreach($permissions as $key => $row){
			$this->delete($row->id);
		}
	}

	public function insertRecord($data) {
		return $this->insert($data);
	}

}
