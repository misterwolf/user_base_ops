class User::RegistrationsController < Devise::RegistrationsController
  # custom registration controller for Devise

  protected

  def after_sign_up_path_for(resource)
    welcome_path
  end

end
