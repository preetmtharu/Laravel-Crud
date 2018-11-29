<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::resource('posts', 'App\Policies\PostPolicy');
        Gate::define('posts.tag', 'App\Policies\PostPolicy@tag');
        Gate::define('posts.category', 'App\Policies\PostPolicy@category');
        Gate::define('posts.users_create', 'App\Policies\PostPolicy@users_create');
        Gate::define('posts.users_update', 'App\Policies\PostPolicy@users_update');
        Gate::define('posts.users_delete', 'App\Policies\PostPolicy@users_delete');
    }
}
