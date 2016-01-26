<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table appointment_members
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 15 11:48:23 2015
 *
 * @Clips\Model(table="appointment_members")
 */
class AppointmentMembersModel extends DBModelV2 {

	public function addRecord($data){
		return $this->insert($data);
	}

}
