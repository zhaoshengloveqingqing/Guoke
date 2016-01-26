<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table partner
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Aug 27 12:02:23 2015
 *
 * @Clips\Model(table="partner")
 * @Clips\Model({"image"});
 */
class PartnerModel extends DBModelV2 {

	public function getPartners(){
		$partners = $this->get();
		foreach($partners as $key => $row){
			$partners[$key]->logo_path = json_decode($row->logo_path)[0]->path;
		}
		return $partners;
	}

	public function insertRecord($data){
		return $this->insert($data);
	}

	public function getPartnerByID($id,$num='0'){
		return  $this->select('partner.id,partner.name,image.image_url')->from('partner')
			->join('image', array('image.id' => 'partner.image_id'))
			->where(array(
				'partner.is_active'=>'1',
				'partner.id'=>$id
			))->groupBy('partner.id')->orderBy('partner.id')->result()[$num];
	}

	public function modify($data) {
		$p = $this->one(array('id' => $data->id));
//		print_r($p);die;
		if($p) {
			return  $this->update((object)array(
				'id' =>$p->id,
				'name' =>$p->name
			));
		}
		return false;
	}

	public function insertField($data){
//        var_dump(array($data));die;
		return $this->insert(array($data));
	}
}
