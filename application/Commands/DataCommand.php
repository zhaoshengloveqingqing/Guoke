<?php namespace Pinet\Guoke\Commands; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Command;

/**
 * @Clips\Model({"user","role","permission","userRole","rolePermission","language","category","image","partner","product","specification","article","banner","categoryDescribe","resource"})
 * @Clips\DataGenerator({"user","role","permission","userrole","rolepermission","language","category","image","partner","product","specification","article","banner","categorydescribe","resource"})
 */
class DataCommand extends Command {
	public function execute($args = array()) {

		foreach($this->data->user as $val) {
			$this->user->insertRecord($val);
		}

		foreach($this->data->role as $val) {
			$this->role->insertRecord($val);
		}

		foreach($this->data->permission as $val) {
			$this->permission->insertRecord($val);
		}

		foreach($this->data->userrole as $val) {
			$this->userrole->insertRecord($val);
		}

		foreach($this->data->rolepermission as $val) {
			$this->rolepermission->insertRecord($val);
		}

		foreach($this->data->language as $val) {
			$this->language->insertRecord($val);
		}

		$this->category->insertRecord();

		foreach($this->data->image as $val) {
			$this->image->insertRecord($val);
		}

		foreach($this->data->partner as $val) {
			$this->partner->insertRecord($val);
		}

		foreach($this->data->product as $val) {
			$this->product->insertRecord($val);
		}

		foreach($this->data->specification as $val) {
			$this->specification->insertRecord($val);
		}

		foreach($this->data->article as $val) {
			$this->article->insertRecord($val);
		}

		foreach($this->data->banner as $val) {
			$this->banner->insertRecord($val);
		}

		foreach($this->data->resource as $val) {
			$this->resource->insertRecord($val);
		}

		foreach($this->data->categorydescribe as $val) {
			$this->categorydescribe->insertRecord($val);
		}

	}


}
