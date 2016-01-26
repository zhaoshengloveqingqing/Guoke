<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table file
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 14 16:12:00 2015
 *
 * @Clips\Model(table="file")
 * @Clips\Model({"image"});
 */
class FileModel extends DBModelV2 {

	public function getDownloadFiles($categoryId){
		$files = $this->get('category_id',$categoryId);
		foreach($files as $key => $row){
			$files[$key]->image_url = $this->image->getImageById($row->image_id)->image_url;
		}
		return $files;
	}

	public function insertRecord($data) {
		return $this->insert($data);
	}

}
