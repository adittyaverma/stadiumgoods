class SocialController < ApplicationController

	def home
		result = Social.execute
		render json: result, status: :ok, code: 200
	end

end
