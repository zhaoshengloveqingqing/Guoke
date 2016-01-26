<?php namespace Pinet\Guoke\Models; in_array(__FILE__, get_included_files()) or exit("No direct script access allowed");

use Clips\Libraries\DBModelV2;

/**
 * Model to manipulate table users
 *
 * @author Jessica
 * @version 1.0
 * @date Fri Oct 9 15:06:23 2015
 *
 * @Clips\Model(table="users")
 * @Clips\Model({"userRole","rolePermission","permission"});
 */

class UserModel extends DBModelV2 {

    public function getPermissionsByUid($uid){
        $roles = $this->userrole->get(array('user_id'=>$uid));
        if(count($roles) == 1){
            $pids = $this->rolepermission->get(array('role_id'=>$roles[0]->role_id));
        }else{
            foreach($roles as $key => $row){
                $temp_pids = $this->rolepermission->get(array('role_id'=>$row->role_id));
                foreach($temp_pids as $key => $row){
                    $pids[] = $temp_pids[$key];
                }
            }
        }
        foreach ($pids as $key => $row){
            $temp[]=$row->permission_id;
        }
        $temp = array_unique($temp);
        foreach ($temp as $k => $v){
            $p = $this->permission->get(array('id'=>$v))[0];
            $permissions[$p->controller]['methods'][] = $p->method;
            $permissions[$p->controller]['filter'] = $p->filter;
        }
        return $permissions;
    }

    public function insertRecord($data){
        return $this->insert($data);
    }
}
