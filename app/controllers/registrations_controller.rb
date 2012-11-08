# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  protected

  def after_inactive_sign_up_path_for(resource)
    signup_landing_path
  end

end
