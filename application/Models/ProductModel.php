<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;


/**
 * Model to manipulate table products
 *
 * @author Jessica
 * @version 1.0
 * @date Mon Mar 30 19:13:23 2015
 *
 * @Clips\Model(table="products")
 */
class ProductModel extends DBModelV2 {

	public function getProductDetails($pid,$languageId){
		if($languageId == 1){
			return $this->one(array('id'=>$pid));
		}else{
			return $this->one(array('chinese_id'=>$pid));
		}
	}

	public function insertRecord($data){
		return $this->insert($data);
	}

}
