<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * Auto generated controller by Scaffold for table specifications.
 *
 * @author Jessica
 * @version 1.0
 * @date Thur Oct 22 10:57:02 2015
 *
 * @Clips\Widget({"html", "lang", "adminlte", "navigation","grid", "scaffold"})
 * @Clips\Model({ "specification"})
 * @Clips\DataGenerator()
 */
class SpecificationController extends BaseController {

	/**
	 * @Clips\Widgets\DataTable("admin_specification")
	 * @Clips\Actions("admin/specification")
	 */
	public function index() {
		if($this->permission()){
			$this->title("Product List", true);
			return $this->render('admin/specification/index');
		}else{
			return $this->render('admin/error');
		}
	}

	/**
	 * @Clips\Model({ "specification"})
	 */
	public function edit($pid) {
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

}
