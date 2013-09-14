class HitCreator
	extend ApplicationHelper

	DEFAULT_DESCRIPTIONS = "Please respond to the following text message"
	DEFAULT_PRICE        = 0.1


	def self.create(question,opt={})
		url =
			Rails.application.routes.url_helpers.new_response_url(:question_id => question.id, :host => host_path)

		title = "Respond to text messages"
		description = DEFAULT_DESCRIPTIONS
		model_name = "Response"
		num_assignments = 3
		price = DEFAULT_PRICE
		hit_lifetime = 5

		hit = Turkee::TurkeeTask.create_hit(url,title,description,model_name,num_assignments,price,hit_lifetime)
		question.update_attribute(:hit_id, hit.hit_id)
	end

end