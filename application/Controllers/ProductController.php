<?php namespace Pinet\Guoke\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid", "image", "navigation", "form"})
 * @Clips\MessageBundle(name = "home")
 */

class ProductController extends BaseController
{
	/**
	 * @Clips\Form({"search"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Scss({"product/product"})
	 * @Clips\Model({"product"})
	 */
	public function index() {
		$lang = $this->request->cookie('lang');
		($lang == 'zh-US')?$languageId = 2:$languageId = 1;
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		$this->title('Product Service',true);
//		var_dump(array('products'=>$this->product->get()));die;
		return $this->render('product/product',array('products'=>$this->product->get()));
	}

	/**
	 * @Clips\Form({"search"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Scss({"product/virtual_server"})
	 * @Clips\Js({"application/static/js/product/detail.js"})
	 * @Clips\Model({"product","specification"})
	 */
	public function detail($productId) {
		if($this->request->cookie('lang') == 'zh-US'){
			$details =  $this->product->one(array('chinese_id'=>$productId));
		}else{
			$details = $this->product->one(array('id'=>$productId));
		}
		$details->specifications = $this->specification->get(array('product_id'=>$details->id));
		$args['details']  = $details;
		$args['productId'] = $productId;
		$args['products'] = $this->product->get();
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		$this->title('Product Detail',true);
		return $this->render('product/detail',$args);
	}

	/**
	 *  @Clips\Model({"product"})
	 */
	public function category() {
		$category_id = $this->post('category_id');
		$productCategory = $this->product->getAllProducts($category_id);
		echo $productCategory[0]->id;
	}

}