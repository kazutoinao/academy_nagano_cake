Rails.application.routes.draw do
 devise_for :admins, path: 'admin',controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
 }
 devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
 }
 root to: 'public/homes#top'
 namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
 end

    scope module: :public do
    get 'homes/top' => 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        get 'withdraw'
      end
    end
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      collection do
        delete 'cart_items/:id' => 'cart_items#destroy_all'
      end
    end
    resources :orders, onlsy: [:new, :create, :index, :show] do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
end