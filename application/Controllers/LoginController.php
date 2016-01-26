<?php namespace Pinet\Guoke\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid"})
 * @Clips\Form({"search"})
 * @Clips\MessageBundle(name = "home")
 */

class LoginController extends BaseController
{
	/**
	 * @Clips\Form({"login/index","search"})
	 * @Clips\Widget({"Guoke","image"})
	 * @Clips\Js({"application/static/js/login/index.js"})
	 * @Clips\Scss({"login/index"})
	 * @Clips\Model({"user"})
	 */
	public function index() {
		if($this->post()){
			$checkCode = $this->post('code');
			$username = $this->post('username');
			$password = $this->post('password');

			$user = $this->user->getUser(array('username'=>$username,'password'=>$password));
			$usernameSql = $user->username;
			$passwordSql = $user->password;

			$checkCodeSessicon = $this->request->session('checkcode');

			if(strtolower($checkCode) == strtolower($checkCodeSessicon) && $username == $usernameSql && $password == $passwordSql){
				$args['username'] = $username;
				$this->request->session('username',$username);
				$url = \Clips\site_url('home/index/'.$user->id,$args);
				echo '<script>location.href="'.$url.'";</script>';
			}
		}

		$langPath = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
		$this->request->session('langPath',$langPath);

		return $this->render('login/index');

	}

	public function get_checkcode() {
		$checkCode = \Clips\site_url('login/getCheckCode');
		echo $checkCode ;
		exit;
	}

	public function getCheckCode() {
		$checkCode = new Checkcode();
		return $checkCode->getCheckcode();
	}

	/**
	 * @Clips\Model({"user"})
	 */
	public function submit_checkcode() {
		$checkCode = $this->post('code');
		$username = $this->post('username');
		$password = $this->post('password');

		$user = $this->user->getUser(array('username'=>$username,'password'=>$password));
		$usernameSql = $user->username;
		$passwordSql = $user->password;

		$checkCodeSessicon = $this->request->session('checkCode');

		if(strtolower($checkCode) != strtolower($checkCodeSessicon) || $username != $usernameSql || $password != $passwordSql){
			echo '<script>location.href="index";</script>';
		}else{
			$url = \Clips\site_url('home/index');
			echo '<script>location.href="'.$url.'";</script>';
		}
	}

}