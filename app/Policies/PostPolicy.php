<?php

namespace App\Policies;

use App\Model\admin\admin;
use Illuminate\Auth\Access\HandlesAuthorization;

class PostPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the user can view the post.
     *
     * @param  \App\Model\user\User  $user
     * @param  \App\Post  $post
     * @return mixed
     */
    public function view(admin $user)
    {
        //
    }

    /**
     * Determine whether the user can create posts.
     *
     * @param  \App\Model\user\User  $user
     * @return mixed
     */
    public function create(admin $user)
    {

     return $this->getPermission($user,16);

 }

    /**
     * Determine whether the user can update the post.
     *
     * @param  \App\Model\user\User  $user
     * @param  \App\Post  $post
     * @return mixed
     */
    public function update(admin $user)
    {

        return $this->getPermission($user,17);

    }

    /**
     * Determine whether the user can delete the post.
     *
     * @param  \App\Model\user\User  $user
     * @param  \App\Post  $post
     * @return mixed
     */
    public function delete(admin $user)
    {

     return $this->getPermission($user,18);

 }

/*For Tag*/
 public function tag(admin $user)

 {

    return $this->getPermission($user,23);

 }

/*For Category*/
 public function category(admin $user)

 {

     return $this->getPermission($user,24);

 }

 /*For Users Related Permissions*/

 public function users_create(admin $user)

 {

    return $this->getPermission($user,19);

 }

 public function users_update(admin $user)

 {

    return $this->getPermission($user,20);

 }

 public function users_delete(admin $user)

 {

    return $this->getPermission($user,21);

 }

 protected function getPermission($user,$p_id)

 {

   foreach ($user->roles as $role) {

    foreach ($role->permissions as $permission) {

        if ($permission->id == $p_id) {

         return true;

     }
 }
}

return false;

}
}
