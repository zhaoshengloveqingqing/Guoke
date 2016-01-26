<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table resource
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 14 16:12:00 2015
 *
 * @Clips\Model(table="resources")
 * @Clips\Model({"image"});
 */
class ResourceModel extends DBModelV2 {

	public function getFiles(){
		$files = $this->get();
		foreach($files as $key => $row){
			$files[$key]->name = json_decode($row->name)[0];
			$files[$key]->thumbnail = json_decode($row->thumbnail)[0]->path[0];
			$files[$key]->path = 'application/static/img/'.json_decode($row->path)[0]->path[0];
		}
		return $files;
	}

	public function insertRecord($data) {
		return $this->insert($data);
	}

	public function insertField($data){
		return $this->insert(array($data));
	}

	public function getResourceTypes(){
		return array(
			array('type'=>'产品服务','id'=>'1'),
			array('type'=>'解决方案','id'=>'2'),
			array('type'=>'服务中心','id'=>'3'),
			array('type'=>'关于我们','id'=>'4')
		);
	}

	public function getAllResources(){
		return  $this->select('resources.id,name.thumbnail,resources.path,resources.type')->from('carts')
			->orderBy('resources.id')->result();
	}
}
