<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table category_describe
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 7 12:48:23 2015
 *
 * @Clips\Model(table="category_describe")
 */
class CategoryDescribeModel extends DBModelV2 {

	public function getForeignByCategoryIdTypeId($categoryId, $typeId){
		$data = array('category_id'=>$categoryId,'type_id' => $typeId);
		return $this->one($data);
	}

	public function getForeignByCategoryId($categoryId){
		$data = array('category_id'=>$categoryId);
		return $this->get($data);
	}


	public function insertRecord($data) {
		return $this->insert($data);
	}

}
