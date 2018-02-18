UserBaseOps::Application.routes.draw do

  # in this way we are using a custom controller for Devise registrions and sessions.
  #devise_for :users, :controllers => {
  #   :registrations => "user/registrations",
  #   :sessions      => "user/sessions"
  # }
  devise_for :users do
    post  "sign_up" => "registrations#new", :as => :signup
    get   "sign_in" => "sessions#new",      :as => :signin
  end


  get '/after_registration', to: 'home#after_registration', as: 'after_registration'
  root to: "home#index"

end
