<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Analog\Handler\Variable;
use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table category
 *
 * @author Jessica
 * @version 1.0
 * @date Sept 1 13:00:23 2015
 *
 * @Clips\Model(table="category")
 * @Clips\Model({"article","image","product","categoryDescribe","banner"});
 */
class CategoryModel extends DBModelV2 {

	public function getAllProducts($languageId) {
		$parentId = $this->one('name','product')->id;
		$productList = $this->getCategoryByParentId($parentId);
		foreach($productList as $key => $row) {
			if($languageId == 2){
				$productList[$key]->name = $this->categorydescribe->getForeignByCategoryId($row->id)[0]->title;
				$productList[$key]->content = $this->categorydescribe->getForeignByCategoryId($row->id)[0]->content;
			}
			$productList[$key]->content = explode(';',$row->content);
			$categoryImage = $this->image->getImageById($row->image_id);
			$productList[$key]->image_url = $categoryImage->image_url;
			$productList[$key]->image_hover_url = $categoryImage->image_hover_url;
			$productList[$key]->products = $this->product->getAllProducts($row->id,$languageId);

		}
		return $productList;
	}

	public function getCategoryIdByName($name){
		return $this->one('name',$name);
	}

	public function getCategoryByParentId($parent_id) {
		return $this->get('parent_id',$parent_id);
	}

	public function getHomeBanners($languageId) {
		$categoryId = $this->one('name','home')->id;
		return $this->banner->getBannersByCategoryId($categoryId,$languageId);
	}

	public function getNewsBanners($languageId) {
		$categoryId = $this->one('name','news')->id;
		return $this->banner->getBannersByCategoryId($categoryId,$languageId);
	}

	public function getAllSolutions($languageId) {
		$categoryId = $this->one('name','solution')->id;
		return $this->article->getArticlesByCategoryId($categoryId,$languageId);
	}

	public function getAllRecruits($languageId) {
		$categoryId = $this->one('name','recruit')->id;
		$allRecruits =  $this->article->getArticlesByCategoryId($categoryId,$languageId);

		foreach($allRecruits as $key => $row){
			if($languageId == 2){
				$recrult = $this->categorydescribe->getForeignByCategoryIdTypeId($categoryId,$row->id);
				$allRecruits[$key]->content = $recrult->content;
				$allRecruits[$key]->title = $recrult->title;
			}
			$content = explode('/',$row->content);
			$allRecruits[$key]->requirement = explode(';',$content[0]);
			$allRecruits[$key]->task = explode(';',$content[1]);
			$allRecruits[$key]->image_url = $this->image->getImageById($row->image_id)->image_url;
			$allRecruits[$key]->datetime = date('Y-m-d',$row->created_date);
		}
		return $allRecruits;
	}

	public function getNewsLists($languageId) {
		$parentId = $this->one('name','news')->id;
		$newsLists = $this->getCategoryByParentId($parentId);
		foreach($newsLists as $key => $row) {
			if($languageId == 2){
				$newsLists[$key]->name = $this->categorydescribe->getForeignByCategoryId($row->id)->content;
			}
			$newsLists[$key]->articles = $this->article->getArticlesByCategoryId($row->id,$languageId);
		}
		return $newsLists;
	}

	public function getAllNews($newsLists,$languageId){
		$allNews = array();
		foreach($newsLists as $key => $row){
			$news = $this->article->getArticlesByCategoryId($row->id,$languageId);
			$allNews = array_merge($allNews,$news);
		}
		return $allNews;
	}

	public function getCategoryLists($languageId) {
		$parentId = $this->one('name','news')->id;
		$categoryLists = $this->getCategoryByParentId($parentId);
		if($languageId == 2){
			foreach ($categoryLists as $key => $row ) {
				$categoryLists[$key]->name = $this->categorydescribe->getForeignByCategoryId($row->id)[0]->content;
			}
		}
		return $categoryLists;
	}

	public function getAboutBanner($languageId) {
		$categoryId = $this->one('name','about')->id;
		return $this->banner->getBannersByCategoryId($categoryId,$languageId);
	}

	public function getAllAboutArticles($languageId) {
		$categoryId = $this->one('name','about')->id;
		return $this->article->getArticlesByCategoryId($categoryId,$languageId);
	}

	public function insertRecord() {
		$data = array(
					array('id'=>1,'name'=>'product','parent_id'=>0),
					array('id'=>2,'name'=>'solution','parent_id'=>0),
					array('id'=>3,'name'=>'news','parent_id'=>0),
					array('id'=>4,'name'=>'about','parent_id'=>0),
					array('id'=>5,'name'=>'home','parent_id'=>0),
					array('id'=>7,'name'=>'recruit','parent_id'=>0),
					array('id'=>8,'name'=>'contact','parent_id'=>0),
					array('id'=>11,'name'=>'计算','mark'=>'calculate','content'=>'公共网络宽带服务;公共网络网络接入端口服务;安全服务','image_id'=>1,'parent_id'=>1),
					array('id'=>12,'name'=>'存储','mark'=>'storage','content'=>'公共网络宽带服务;公共网络网络接入端口服务;安全服务','image_id'=>2,'parent_id'=>1),
					array('id'=>13,'name'=>'网络','mark'=>'network','content'=>'公共网络宽带服务;公共网络网络接入端口服务;安全服务','image_id'=>3,'parent_id'=>1),
					array('id'=>14,'name'=>'安全','mark'=>'security','content'=>'公共网络宽带服务;公共网络网络接入端口服务;安全服务','image_id'=>4,'parent_id'=>1),
					array('id'=>15,'name'=>'软件','mark'=>'software','content'=>'公共网络宽带服务;公共网络网络接入端口服务;安全服务','image_id'=>5,'parent_id'=>1),
					array('id'=>16,'name'=>'管理','mark'=>'management','content'=>'公共网络宽带服务;公共网络网络接入端口服务;安全服务','image_id'=>6,'parent_id'=>1),
					array('id'=>31,'name'=>'公司新闻','parent_id'=>3),
					array('id'=>32,'name'=>'通知活动','parent_id'=>3),
					array('id'=>33,'name'=>'行业动态','parent_id'=>3),
					array('id'=>34,'name'=>'媒体聚焦','parent_id'=>3)
				);
		return $this->insert($data);
	}

}
