<?php namespace Pinet\Guoke\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid"})
 * @Clips\MessageBundle(name = "home")
 */

class SolutionController extends BaseController
{
	/**
	 * @Clips\Form({"search"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Widgets\ListView("search")
	 * @Clips\Scss({"solution/solution"})
	 * @Clips\Model({"category"})
	 */
	public function index()
	{
		$lang = $this->request->cookie('lang');
		($lang == 'zh-US') ? $languageId = 2 : $languageId = 1;
		$args['allSolutions'] = $this->category->getAllSolutions($languageId);

		$langPath = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
		$this->request->session('langPath', $langPath);
		$this->title('Solutions',true);
		return $this->render('solution/solution', $args);
	}

	/**
	 * @Clips\Form({"search"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Widgets\ListView("search")
	 * @Clips\Scss({"solution/search"})
	 * @Clips\Model({"category"})
	 */
	public function search() {
		$this->title('solution',true);
		return $this->render('solution/search');
	}
}