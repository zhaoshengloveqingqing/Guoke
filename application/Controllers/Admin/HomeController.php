<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;
use Clips\SimpleAction;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "navigation"})
 */
class HomeController extends BaseController {

	public function index() {
		if($this->permission()){
			return $this->render('admin/home');
		}else{
			return $this->render('admin/error');
		}
	}
}
