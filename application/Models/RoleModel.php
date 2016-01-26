<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table roles
 *
 * @author Jessica
 * @version 1.0
 * @date Fri Oct 10 16:00:00 2015
 *
 * @Clips\Model(table="roles")
 */
class RoleModel extends DBModelV2 {

    public function insertRecord($data){
        return $this->insert($data);
    }

}
