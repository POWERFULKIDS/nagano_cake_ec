class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	#signin後のリダイレクト先
	def after_sign_in_path_for(resource)
	  	case resource
	  		when Admin
	    		admin_root_path
	  		when Customer
	     		root_path
	  	end
	end

	#signout後のリダイレクト先
	def after_sign_out_path_for(resource)
	  	case resource
	  		when :admin
	    		new_admin_session_path
	  		when :customer
	    		root_path
	  	end
	end

	protected
	#signup時の登録情報追加
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [
	      :last_name,
	      :first_name,
	      :last_name_kana,
	      :first_name_kana,
	      :email,
	      :postcode,
	      :address,
	      :phone
	    ])
	  end

end
