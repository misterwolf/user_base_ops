UserBaseOps::Application.routes.draw do

  # in this way we are using a custom controller for Devise registrions and sessions.
  #devise_for :users, :controllers => {
  #   :registrations => "user/registrations",
  #   :sessions      => "user/sessions"
  # }
  devise_for :users, :path_names => {
        :sign_in  => "signin",
        :sign_out => "signout"
      },
      :controllers => {
        :sessions      => "user/sessions"
      }, skip: :registration

  #  as default, Devise defines a different url for registration#create (POST) from registration#create (GET)
  #  this cause problem if user reload after the signup went wrong.
  #  this is a little hack to solve it.
  #  included skip: :registration above.

  devise_scope :user do
    resource :registration, :as => :user_registration, :only => [ :new, :edit, :update, :destroy ],
      :path=> "/users",
      :path_names=> {
        :new =>"signup"
      },
      :controller=>"devise/registrations"  do
        get :cancel
        post :signup, action: :create, as: ''
      end
  end

  get '/welcome', to: "home#welcome"

  root to: "home#index"

end
