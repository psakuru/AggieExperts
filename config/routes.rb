AggieExperts::Application.routes.draw do
  resources :passwords, controller: 'passwords', only: [:create, :new]
  resource  :session, controller: 'sessions', only: [:create]
  resources :users, controller: 'users', only: [:create, :update]

  delete '/sign_out'              => 'sessions#destroy', as: 'sign_out'
  get    '/sign_up'               => 'users#new',        as: 'sign_up'
  root :to                        => "static#index"
  get  '/search'                  => 'search#search'
  get  '/admin/main'              => 'admin#main'
  post '/admin/approve_all'       => 'admin#approve_all'
  post '/admin/add_user'          => 'admin#add_users'
  post '/admin/delete_user'       => 'admin#delete_user'
  post '/admin/disable_user'      => 'admin#disable_user'
  post '/admin/resend_act_suser'  => 'admin#resend_activation'
  post '/admin/approve_user'      => 'admin#approve_user'
  post '/admin/delete_suser'      => 'admin#delete_suser'
  get  '/request_invite'          => 'profile#request_invite'
  get  '/activate'                => 'users#new'
  get  '/reset'                   => 'users#reset'
  get  '/forgot_password'         => 'users#forgot_password'
  post  '/forgot_action'           => 'users#forgot_action'
  post '/invite_suser'            => 'profile#invite_suser'
  post '/admin/approve_suser'     => 'admin#approve_suser'
  post '/admin/delete_inv_suser'  => 'admin#delete_inv_suser'
  get  '/passwords/reset'         => 'passwords#reset_password'
  get  '/contact_us'              => 'static#contact_us'
  post '/admin/make_admin_user'   => 'admin#make_admin'
  resources :profile
  
  resources :keywords do
    get :autocomplete_keyword_key, :on => :collection
  end
  
end
