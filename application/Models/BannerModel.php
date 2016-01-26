<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table banner
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 1 16:48:23 2015
 *
 * @Clips\Model(table="banners")
 * @Clips\Model({"image"});
 */
class BannerModel extends DBModelV2 {
	public function getBannersByCategoryId($category_id,$languageId){
		$banners = $this->get(array('category_id'=>$category_id,'language_id'=>$languageId));
		foreach($banners as $key => $row){
			$banners[$key]->image_url = $this->image->getImageById($row->image_id)->image_url;
		}
		return $banners;
	}

	public function getBannersByType($type){
		return $this->get(array('type'=>$type));
	}


	public function insertRecord($data){
		return $this->insert($data);
	}

	public function getAllBanners(){
		return  $this->select('banner.title,banner.content')->from('banner')
			->join("category",array('category.id'=>'banner.category_id'))
			->join('image', array('category.id' => 'banner.image_id'))
			->where(array(
				'banner.is_active'=>'1'
			))->groupBy('banner.id')->orderBy('banner.id')->result();
	}

	public function insertField($data){
//        var_dump(array($data));die;
		return $this->insert(array($data));
	}

	public function getBannerTypes(){
		return array(
			array('banner'=>'首页顶部','id'=>'1'),
			array('banner'=>'首页底部','id'=>'2'),
			array('banner'=>'服务中心','id'=>'3'),
			array('banner'=>'关于我们','id'=>'4')
		);
	}
}
