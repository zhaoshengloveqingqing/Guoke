<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table permissions
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Oct 8 11:18:00 2015
 *
 * @Clips\Model(table="permissions")
 */
class PermissionModel extends DBModelV2 {

	public function insertRecord($data) {
		return $this->insert($data);
	}

}
