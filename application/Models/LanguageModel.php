<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table language
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 9 10:35:00 2015
 *
 * @Clips\Model(table="language")
 */
class LanguageModel extends DBModelV2 {

	public function insertRecord($data){
		return $this->insert($data);
	}

}
