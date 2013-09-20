class Response < ActiveRecord::Base

	attr_accessible :rating, :question_id

	belongs_to :question

end