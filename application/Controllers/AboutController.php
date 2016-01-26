<?php namespace Pinet\Guoke\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid"})
 * @Clips\MessageBundle(name = "home")
 */

class AboutController extends BaseController
{
	/**
	 * @Clips\Model({"inject"})
	 * @Clips\Form({"search"})
	 * @Clips\Js({"application/static/js/about/about.js"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Scss({"about/about"})
	 * @Clips\Model({"category"})
	 */
	public function index() {

		$lang = $this->request->cookie('lang');
		($lang == 'zh-US')?$languageId = 2:$languageId = 1;
		$args['articles'] = $this->category->getAllAboutArticles($languageId);
		$args['recruits'] = $this->category->getAllRecruits($languageId);
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		$this->title('About Us',true);
		return $this->render('about/about',$args);
	}

	/**
	 * @Clips\Model({"banner"})
	 */
	public function getAboutBanner() {
		$banner = $this->banner->getBannersByType('4');
		echo json_encode($banner);
		exit();
	}

	/**
	 * @Clips\Form({"search"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Js({"application/static/js/about/about.js"})
	 * @Clips\Scss({"about/join"})
	 * @Clips\Model({"category","article"})
	 */
	public function join($recruitId=0){

		$lang = $this->request->cookie('lang');
		($lang == 'zh-US')?$languageId = 2:$languageId = 1;
		$args['allRecruits'] = $this->category->getAllRecruits($languageId);
		if($recruitId == 0){
			$recruitId =  $args['allRecruits'][0]->id;
		}
		$args['recruitId'] = $recruitId;
		$oneRecruit = $this->article->getOneArticle($recruitId,$languageId);
		$content = explode('/',$oneRecruit->content);
		$oneRecruit->requirement = explode(';',$content[0]);
		$oneRecruit->task = explode(';',$content[1]);
		$args['oneRecruit'] = $oneRecruit;
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		$this->title('Join Us',true);
		return $this->render('about/join',$args);
	}

	/**
	 * @Clips\Form({"about/appointment","search"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Scss({"about/appointment"})
	 * @Clips\Js({"application/static/js/about/appointment.js"})
	 */
	public function appointment() {
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		$this->title('Make an appointment',true);
		return $this->render('about/appointment');
	}

	public function get_checkcode() {
		$checkCode = \Clips\site_url('login/getCheckCode');
		echo $checkCode ;
		exit;
	}

	/**
	 * @Clips\Model({"appointment","appointmentmembers"})
	 */
	public function submit_appointment() {
		$dataAppoint = $this->post('dataAppoint');
		$dataAppointRelated = $this->post('dataAppointRelated');
		$appointmentId = $this->appointment->addRecord($dataAppoint);

		foreach($dataAppointRelated as $key => $row){
			$dataAppointRelated[$key]['appointment_id'] = $appointmentId;
		}
		foreach($dataAppointRelated as $key => $row){
			$id = $this->appointmentmembers->addRecord($row);
		}
		echo $id;
		exit;
	}

	/**
	 * @Clips\Form({"about/appointment"})
	 * @Clips\Widget({"Guoke","navigation", "image"})
	 * @Clips\Scss({"about/success"})
	 */
	public function success() {
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);
		$this->title('succeful',true);
		return $this->render('about/success');
	}

}
