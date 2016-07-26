module Frontend::PagesHelper
	# Returns a correct user
	def correct_user?(user)
		user == current_user
	end

	# Just Correct User can access the page
	def correct_user
		@user = User.find(params[:id])
		redirect_to current_user unless correct_user?(@user) 
	end
end
