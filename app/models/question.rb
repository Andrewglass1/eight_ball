class Question < ActiveRecord::Base
	attr_accessible :content, :hit_id

	has_many :responses

	after_create :make_hits

	def make_hits
		HitCreator.create(self, {})
	end
end