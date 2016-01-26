<?php namespace Pinet\Guoke\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid"})
 * @Clips\MessageBundle(name = "home")
 */

class ServiceController extends BaseController
{
	/**
	 * @Clips\Form({"search","new/new"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Scss({"service/new"})
	 * @Clips\Widgets\ListView("new")
	 * @Clips\Js({"application/static/js/new/index.js"})
	 * @Clips\Model({"category","article","banner"})
	 */
	public function index($categoryId = 0,$orderBy = 'visit_volumn'){
		$this->title('Service Center',true);
		$lang = $this->request->cookie('lang');
		($lang == 'zh-US')?$languageId = 2:$languageId = 1;

		$args['banners']  = json_decode($this->banner->getBannersByType('3')[0]->contents);
		$args['categoryLists'] = $this->category->getCategoryLists($languageId);
		if($categoryId == 0){
			$this->request->session('categoryId',0);
			$order = 'desc';
		}else{
			$order = $this->request->session('order');
			if($order == 'desc'){
				$order = 'asc';
			}else{
				$order = 'desc';
			}
		}
		$args['type'] = 'news';
		$args['categoryId'] = $categoryId;

		$this->request->session('categoryId', $categoryId);
		$orderBy = $orderBy.' '.$order;
		$this->request->session('order', $order);
		$this->request->session('orderBy', $orderBy);
		$searchColumn = $this->post('search');
		$this->request->session('searchColumn', $searchColumn);
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		return $this->render('service/new',$args);
	}

	/**
	 * @Clips\Model({"category"})
	 * @Clips\Widgets\DataTable("new")
	 */
	public function new_pagination() {
		$lang = $this->request->cookie('lang');
		($lang == 'zh-US')?$languageId = 2:$languageId = 1;
		$categoryId = $this->request->session('categoryId');
		$whereColumn = $this->request->session('searchColumn');
		$orderBy = $this->request->session('orderBy');
		$pagination = $this->getPagination('new');
		if($categoryId == 0){
			$categoryLists = $this->category->getCategoryLists();
			$pagination->where['category_id'] = $categoryLists[0]->id;
		}else{
			$pagination->where['category_id'] = $categoryId;
		}
		if($whereColumn != ''){
			$pagination->where['title'] = $whereColumn;
		}
		$pagination->orderBy = $orderBy;
		return $this->processPagination($pagination);
	}

	/**
	 * @Clips\Form({"search","new/new"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Widgets\ListView("new")
	 * @Clips\Scss({"service/newdetail"})
	 * @Clips\Js({"application/static/js/new/detail.js"})
	 * @Clips\Model({"category","article"})
	 */
	public function news_detail($id){
		$this->title('News Detail',true);

		$lang = $this->request->cookie('lang');
		($lang == 'zh-US')?$languageId = 2:$languageId = 1;

		$args['type'] = 'news';
		$args['newsid'] = $id;
		$args['newsLists'] = $this->category->getNewsLists($languageId);
		$args['newsDetail'] = $this->article->getOneArticle($id,$languageId);
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		return $this->render('service/newdetail',$args);
	}

	/**
	 * @Clips\Form({"search","new/new"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Scss({"service/download"})
	 * @Clips\Model({"resource"})
	 */
	public function download() {
		$this->title('Download Files',true);
		$args['downloadFiles'] = $this->resource->getFiles();
		$args['type'] = 'download';
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		return $this->render('service/download',$args);
	}

	public function download_file(){
		$file_url = $this->get('file_url');
		$file_url = \Clips\try_path($file_url);
		if(file_exists($file_url)){
			$download = new Download();
			$download->download_file($file_url);
		}
	}

	/**
	 * @Clips\Form({"search","new/new"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Scss({"service/service"})
	 */
	public function service() {
		$this->title('Service',true);
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		return $this->render('service/service');
	}

}