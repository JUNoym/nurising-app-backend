class ApplicationController < ActionController::API
        before_action :configure_permitted_parameters, if: :devise_controller?
        include DeviseTokenAuth::Concerns::SetUserByToken
        private
                def configure_permitted_parameters
                        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
                end
end
