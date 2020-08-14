class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def stellenbosch_university
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    auth = request.env["omniauth.auth"]
    auth_params = { provider: 'stellenbosch_university', uid: auth.uid }

    authentication = Authentication.find_by(auth_params) || User.transaction do
      user = User.create email: auth.info.email, password: Devise.friendly_token[0, 20]
      user.authentications.create auth_params
    end
      
    if authentication.persisted?
      sign_in_and_redirect authentication.user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Stellenbosch University") if is_navigational_format?
    else
      session["devise.stellenbosch_university_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end