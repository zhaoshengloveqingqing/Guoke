<?php namespace Pinet\Guoke\Controllers; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

/**
 * @Clips\Widget({"html", "lang", "adminlte", "grid"})
 */

class Download{

	public function download_file($file = ''){
		$filename = basename($file);
		$filesize = filesize($file);
		$ua = $_SERVER["HTTP_USER_AGENT"];
		$encoded_filename = rawurlencode($filename);
		header('Content-Type: application/octet-stream');
		if (preg_match("/MSIE/", $ua)) {
			header('Content-Disposition: attachment; filename="' . $encoded_filename . '"');
		} else if (preg_match("/Firefox/", $ua)) {
			header("Content-Disposition: attachment; filename*=\"utf8''" . $filename . '"');
		} else {
			header('Content-Disposition: attachment; filename="' . $filename . '"');
		}
		header('Content-Disposition: attachment; filename="'.$filename.'"');
		header('Expires: 0');
		header('Content-Transfer-Encoding: binary');
		header('Content-Length: '.$filesize);
		readfile($file);
	}

}
