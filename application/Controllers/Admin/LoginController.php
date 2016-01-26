<?php namespace Pinet\Guoke\Controllers\Admin; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Controller;
use Clips\SimpleAction;
use Analog\Handler\Variable;
use Pinet\Guoke\Core\BaseController;

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid", "image", "navigation", "form"})
 * @Clips\Model({"user"});
 */
class LoginController extends BaseController {

	/**
	 * @Clips\Form("login")
	 */
	public function index() {
		$this->title("Login", true);
		return $this->render('admin/login');
	}

	/**
	 * @Clips\Form("login")
	 */
	public function index_form() {
		$username = $this->post()['username'];
		$password = $this->post()['password'];
		if($this->user->get(array('username'=>$username,'password'=>$password))){
			$permissions = $this->user->getPermissionsByUid($this->user->get(array('username'=>$username,'password'=>$password))[0]->id);
		}else{
			echo '用户名或者密码错误，请重新输入';
			return $this->render('admin/login');
		}
		$this->request->session('username',$username);
		$this->request->session('global_permissions',$permissions);
		$this->title('Login Page',true);
		return $this->redirect(\Clips\site_url('admin/home/index'));
	}

}
