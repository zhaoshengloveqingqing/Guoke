<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table article
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Sept 1 12:48:23 2015
 *
 * @Clips\Model(table="article")
 * @Clips\Model({"image","categoryDescribe"});
 */
class ArticleModel extends DBModelV2 {

	public function getArticlesByCategoryId($categoryId,$languageId) {
		$articles = $this->get(array('category_id'=>$categoryId));
		foreach($articles as $key => $row){
			$imageMessage = $this->image->getImageById($row->image_id);
			$articles[$key]->type = $imageMessage->type;
			$articles[$key]->image_url = $imageMessage->image_url;
			$articles[$key]->release_date = date('Y-m-d' ,$imageMessage->release_date);
			if($languageId == 2){
				$articleEnglish = $this->categorydescribe->getForeignByCategoryIdTypeId($categoryId,$row->id);
				$articles[$key]->title = $articleEnglish->title;
				$articles[$key]->content = $articleEnglish->content;
			}
		}
		return $articles;
	}

	public function getOneArticle($id,$languageId) {
		$news = $this->one(array('id'=>$id));
		if($languageId == 2){
			$newsEnglish = $this->categorydescribe->getForeignByCategoryIdTypeId($news->category_id,$id);
			$news->title = $newsEnglish->title;
			$news->content = $newsEnglish->content;;
		}
		$news->image_url = $this->image->getImageById($news->image_id)->image_url;
		$news->release_date = date('Y-m-d' ,$news->release_date);
		return $news;
	}

	public function insertRecord($data) {
		return $this->insert($data);
	}

	public function getArticleTypes(){
		return array(
			array('type'=>'产品案例','id'=>'1'),
			array('type'=>'解决方案','id'=>'2'),
			array('type'=>'服务中心-新闻','id'=>'3'),
			array('type'=>'服务中心-备案服务','id'=>'4'),
			array('type'=>'关于我们-关于国科','id'=>'5'),
			array('type'=>'关于我们-加入我们','id'=>'6')
		);
	}
}
