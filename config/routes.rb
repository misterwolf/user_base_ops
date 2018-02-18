UserBaseOps::Application.routes.draw do

  # in this way we are using a custom controller for Devise registrions and sessions.
  #devise_for :users, :controllers => {
  #   :registrations => "user/registrations",
  #   :sessions      => "user/sessions"
  # }

  devise_for :users, :controllers => {
      :registrations => "user/registrations",
      :sessions      => "user/sessions"
  }

  get '/welcome', to: "home#welcome"

  root to: "home#index"

end
