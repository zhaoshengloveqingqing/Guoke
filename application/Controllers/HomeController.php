<?php namespace Pinet\Guoke\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid", "image", "navigation", "form"})
 * @Clips\MessageBundle(name = "home")
 */

class HomeController extends BaseController
{
	/**
	 * @Clips\Form({"search"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Js({"application/static/js/home/home.js"})
	 * @Clips\Scss({"home/home"})
	 * @Clips\Model({"partner","banner"})
	 */
	public function index($id = 0) {
		$lang = $this->request->cookie('lang');
		($lang == 'zh-US')?$languageId = 2:$languageId = 1;
		$args['languageId'] = $languageId;
		$args['partners']  = $this->partner->getPartners();
//		var_dump($args['partners']);die;
		$args['banners']  = json_decode($this->banner->getBannersByType('1')[0]->contents);
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		$this->title('Home Page',true);
		return $this->render('home',$args);
	}

	/**
	 * @Clips\Model({"banner"})
	 */
	public function getNewsBanner() {
		$banner = $this->banner->getBannersByType('2');
		echo json_encode($banner);
		exit();
	}

	public function switch_lang() {
		$lang = $this->post('language');
		setcookie('lang',$lang,time()+3000,'/');
		$langPath = $this->request->session('langPath');
		header('Location: '.$langPath);
	}

}