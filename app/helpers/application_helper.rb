module ApplicationHelper

	def host_path
		case Rails.env
		when "development"
			"localhost:3000"
		when "production"
			"http://eight-ball.herokuapp.com/"
		else
			"http://eight-ball.herokuapp.com/"
		end		
	end
end
