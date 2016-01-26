<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table user_role
 *
 * @author Jessica
 * @version 1.0
 * @date Fri Oct 9 15:06:23 2015
 *
 * @Clips\Model(table="user_role")
 */

class UserRoleModel extends DBModelV2 {

    public function addFields($uid,$roles){
        foreach($roles as $rid){
            $this->insert(array('user_id' => $uid,'role_id' => $rid));
        }
    }

    public function getRolesByUserid($uid){
        $result = $this->get(array('user_id'=>$uid));
        if($result) {
            return array_map(function($item){
                return $item->role_id;
            }, $result);
        }
        return array();
    }

    public function updateFields($uid,$roles){
        $result = $this->get(array('user_id'=>$uid));
        if($result){
            foreach($result as $key => $row){
                $this->delete(array('id'=>$row->id));
            }
        }
        if($roles){
            foreach($roles as $val) {
                $this->insert(array('user_id' => $uid, 'role_id' => $val));
            }
        }
    }

    public function deleteFields($uid){
        $roles = $this->get(array('user_id'=>$uid));
        foreach($roles as $key => $row){
            $this->delete($row->id);
        }
    }


    public function insertRecord($data){
        return $this->insert($data);
    }

}
