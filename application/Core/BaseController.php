<?php namespace Pinet\Guoke\Core; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid", "image", "navigation", "form"})
 * @Clips\MessageBundle(name = "home")
 */
class BaseController extends Controller {

	protected function render($template, $args = array(), $engine = NULL, $headers = array()) {
		$action1 = $this->action('home/index', '首页');
		$action2 = $this->action('product/index', '产品&服务');
		$action3 = $this->action('solution/index', '解决方案');
		$action4 = $this->action('service/index', '服务中心');
		$action5 = $this->action('about/index', '关于我们');
		$navigation = array(
			$action1,
			$action2,
			$action3,
			$action4,
			$action5
		);
		$args['username'] = $this->request->session('username');
		$args['global_permissions'] = $this->request->session('global_permissions');
		$args['navi'] = $navigation;
		return parent::render($template, $args, $engine, $headers);
	}

	protected function permission(){
		$parms = explode('/',$_SERVER['REQUEST_URI']);
		for($i=0;$i<count($parms);$i++){
			if($parms[$i] == 'admin'){
				break;
			}
		}
		if(isset($parms[$i+1])){
			$controller = $parms[$i+1];
		}
		($parms[$i+2])?$method = $parms[$i+2]:$method = 'index';
		($method == 'index')?$tag = true:$tag = false;
		$permissions = $this->request->session('global_permissions');
		if(!isset($permissions[$controller])){
			$tag = false;
		}else{
			foreach($permissions[$controller]['methods'] as $val){
				if($val == $method ){
					$tag = true;
				}
			}
		}
		if($controller == 'home'){
			$tag = true;
		}
		$tag = true;
		return $tag;
	}

}
