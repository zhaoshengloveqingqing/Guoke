<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * Auto generated controller by Scaffold for table users.
 *
 * @author Jessica
 * @version 1.0
 * @date Fri Oct 9 14:39:09 2015
 *
 * @Clips\Widget({"html", "lang", "adminlte", "navigation","grid", "scaffold"})
 * @Clips\Model({ "product"})
 * @Clips\DataGenerator()
 */
class ProductController extends BaseController {

	/**
	 * @Clips\Widgets\DataTable("admin_product")
	 * @Clips\Actions("admin/product")
	 */
	public function index() {
		if($this->permission()){
			$this->title("Product List", true);
			return $this->render('admin/product/index');
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Model({ "specification"})
	 */
	public function edit2($pid) {
		if($this->permission()){
			$product = $this->product->one(array('id'=>$pid));
			$product->specifications = $this->specification->get(array('product_id'=>$product->id));
			$args['product'] = $product;
			$this->title("Edit Product [{$product->name}]", true);
			return $this->render('admin/product/edit',$args);
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Form("admin/product/edit")
	 * @Clips\Actions("admin/product")
	 */
	public function edit($pid) {
		if($this->permission()){
			$data = $this->product->load($pid);
			$this->formData("product_edit", $data);
			$this->title("Edit Product [{$data->name}]", true);
			$args['types'] = array("0"=>array('1'=>'计算','2'=>'存储'));
			return $this->render('admin/product/edit',$args);
		}else{
			return $this->render('admin/error');
		}
	}

}
