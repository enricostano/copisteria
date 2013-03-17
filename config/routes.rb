Copisteria::Application.routes.draw do

  resources :volantinos

  get "signup_landing" => "landing#signup"

  resources :url_connectors

  resources :orders

  match "order/autorizza/:id" => "orders#authorize", :as => :authorize_order

  resources :line_items

  match "dashboard" => "dashboard#index"

  match "cart/add/:id" => "cart#add", :as => :add_cart

  match "cart/change/(:id/(:quantity))" => "cart#change", :as => :change_cart

  match "download/:temp_url" => "url_connectors#download", :as => :url_connectors_download

  resources :tenders

  resources :institutions

  devise_for :users, :controllers => { :registrations => "registrations" }

  scope "/admin" do
    resources :users
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'dashboard#index'
end
