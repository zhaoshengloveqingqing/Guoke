<?php namespace Pinet\Guoke\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid"})
 */

class Checkcode{

	private $width;
	private $height;

	public function __construct($width=90,$height=34){
		$this->width = $width;
		$this->height = $height;
	}

	public function getCheckcode(){
		header('Content-Type:image/jpeg');
		//创建画布
		$img = imagecreate($this->width,$this->height);
		//画布背景颜色
		imagecolorallocate($img,mt_rand(200,255),mt_rand(200,255),mt_rand(200,255));

		//画点
		for($i=1;$i<=20;$i++){
			$point_color = imagecolorallocate($img,255,255,255);
			imagesetpixel($img,rand(0,$this->width),rand(0,$this->height),$point_color); //参数：图片，坐标点，点的颜色
		}

		//画线
		for($i=1;$i<3;$i++){
			$line_color = imagecolorallocate($img,255,255,255);
			imageline($img,rand(0,$this->width),rand(0,$this->height),rand(0,$this->width),rand(0,$this->height),$line_color);  //参数：图片，起点坐标，终点坐标，颜色
		}

		//写字
		//参数：图片,大小（1-5,其中1最小）,起点坐标,文字，字颜色 (不能写中文)
		//imagestring($im,5,rand(1,80),rand(5,20),$str_code,$text_color);

		$str = 'ABCDEFGHIGKLMNOPQRSTUVWXYZabcdefghigklmnopqrstuvwxyz1234567890';
		$str_arr = str_split($str);

		$text = '';
		for($i=1;$i<=4;$i++){
			$text .= $str_arr[rand(0,61)];
		}

		$_SESSION['checkcode'] = $text;

		$text_color = imagecolorallocate($img,mt_rand(0,200),mt_rand(0,200),mt_rand(0,200));
		imagestring($img,5,rand(5,40),rand(5,15),$text,$text_color);

		imagejpeg($img);
	}

	//消毁资源
	function __destruct(){
		imagedestroy($img);
	}

}
