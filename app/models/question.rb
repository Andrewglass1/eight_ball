class Question < ActiveRecord::Base
	attr_accessible :description, :hit_id, :title, :video_url, :status, :response_id

	has_many :responses

	after_create :make_hits

	def make_hits
		HitCreator.create(self)
	end

	def turkee_task
		Turkee::TurkeeTask.where(:hit_id => hit_id).first
	end

	def response_url
		if Rails.env == "development"
			"https://localhost:3000/responses/new"
		elsif Rails.env == "production"
			"https://eight-ball.herokuapp.com/responses/new"
		end
	end

end