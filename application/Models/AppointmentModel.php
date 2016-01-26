<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table appointment
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 11 15:48:23 2015
 *
 * @Clips\Model(table="appointment")
 */
class AppointmentModel extends DBModelV2 {

	public function addAppointment($data){
		return $this->insert('appointment',array($data));
	}

	public function addRecord($data){
		return $this->insert($data);
	}

}
