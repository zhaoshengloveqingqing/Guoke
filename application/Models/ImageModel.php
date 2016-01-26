<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table image
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 1 12:48:23 2015
 *
 * @Clips\Model(table="image")
 *
 */
class ImageModel extends DBModelV2 {

	public function getImageById($id){
		$image = $this->load('c_image',$id);
		$image->content = explode(';',$image->content);
		return $image;
	}

	public function insertRecord($data){
		return $this->insert($data);
	}

}
