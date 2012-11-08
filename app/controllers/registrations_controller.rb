# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    render
  end

end
